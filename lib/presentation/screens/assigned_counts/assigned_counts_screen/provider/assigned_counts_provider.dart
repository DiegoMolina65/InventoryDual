import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/repository/almacen/almacen_repository.dart';
import 'package:m_dual_inventario/domain/repository/conteo/conteo_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/almacen/almacen_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/conteo/conteo_provider.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

final conteosAsignadosProvider =
    StateNotifierProvider<ConteosAsignadosNotifier, ConteosAsignadosState>(
        (ref) {
  final almacenRepository = ref.read(almacenRepositoryProvider);
  final conteoRepository = ref.read(conteoRepositoryProvider);

  return ConteosAsignadosNotifier(
    almacenRepository: almacenRepository,
    conteoRepository: conteoRepository,
  );
});

final navegacionDetalleProvider =
    StateProvider<Map<String, dynamic>?>((ref) => null);

class ConteosAsignadosNotifier extends StateNotifier<ConteosAsignadosState> {
  final AlmacenRepository almacenRepository;
  final ConteoRepository conteoRepository;

  ConteosAsignadosNotifier({
    required this.almacenRepository,
    required this.conteoRepository,
  }) : super(ConteosAsignadosState());

  void inicializarDatos() {
    Future.microtask(() async {
      await cargarAlmacenes();
    });
  }

  Future<void> cargarAlmacenes() async {
    state = state.copyWith(isLoadingAlmacenes: true);

    try {
      final almacenes = await almacenRepository.obtenerAlmacenesPorLocal();

      if (almacenes.isNotEmpty) {
        state = state.copyWith(
          almacenes: almacenes,
          almacenSeleccionado: almacenes.first,
          isLoadingAlmacenes: false,
        );

        await cargarTodosLosConteos(almacenes.first.codigo);
      } else {
        state = state.copyWith(isLoadingAlmacenes: false);
      }
    } catch (e) {
      state = state.copyWith(isLoadingAlmacenes: false);
      rethrow;
    }
  }

  void seleccionarAlmacen(AlmacenXLocal almacen) async {
    if (state.almacenSeleccionado?.codigo == almacen.codigo) {
      return;
    }

    state = state.copyWith(
      almacenSeleccionado: almacen,
      isLoadingConteos: true,
      conteosAsignados: [],
    );

    await cargarTodosLosConteos(almacen.codigo);
  }

  Future<int> obtenerCodigoUsuarioActual() async {
    final codigoUsuario =
        await AppPreference.getValue<int>(KeyAppPreferences.codigoUsuario);
    return codigoUsuario ?? 0;
  }

  Future<List<ConteoInventario>> obtenerConteos({
    required int codigoAlmacen,
    required int codigoUsuario,
    required int codigoConteo,
  }) async {
    try {
      return await conteoRepository.listarConteosAsignados(
        codigoAlmacen: codigoAlmacen,
        codigoUsuario: codigoUsuario,
        codigoConteo: codigoConteo,
        fechaActualizacion: DateTime.now().add(const Duration(days: 1)),
      );
    } catch (e) {
      return [];
    }
  }

  Future<void> cargarTodosLosConteos(int codigoAlmacen) async {
    state = state.copyWith(conteosAsignados: [], isLoadingConteos: true);

    try {
      final codigoUsuario = await obtenerCodigoUsuarioActual();
      final List<ConteoInventario> todosLosConteos = [];

      final primeraPagina = await obtenerConteos(
        codigoAlmacen: codigoAlmacen,
        codigoUsuario: codigoUsuario,
        codigoConteo: 0,
      );

      if (primeraPagina.isEmpty) {
        state = state.copyWith(
          conteosAsignados: [],
          isLoadingConteos: false,
        );
        return;
      }

      todosLosConteos.addAll(primeraPagina);

      int codigoConteoMasAntiguo = primeraPagina.last.codigo;

      bool hayMasPaginas = primeraPagina.length == 5;
      int intentos = 0;
      const maxIntentos = 20;

      while (hayMasPaginas && intentos < maxIntentos) {
        intentos++;
        int codigoParaSiguientePagina = codigoConteoMasAntiguo - 1;

        final paginaAnterior = await obtenerConteos(
          codigoAlmacen: codigoAlmacen,
          codigoUsuario: codigoUsuario,
          codigoConteo: codigoParaSiguientePagina,
        );

        if (paginaAnterior.isEmpty) {
          hayMasPaginas = false;
          break;
        }

        final nuevosUnicos = paginaAnterior
            .where(
                (nuevo) => !_contieneConteoPorId(todosLosConteos, nuevo.codigo))
            .toList();

        if (nuevosUnicos.isEmpty) {
          hayMasPaginas = false;
          break;
        }

        todosLosConteos.addAll(nuevosUnicos);

        codigoConteoMasAntiguo = nuevosUnicos.last.codigo;
      }

      todosLosConteos
          .sort((a, b) => b.fechaCreacion.compareTo(a.fechaCreacion));

      state = state.copyWith(
        conteosAsignados: todosLosConteos,
        isLoadingConteos: false,
      );
    } catch (e) {
      state = state.copyWith(
        conteosAsignados: [],
        isLoadingConteos: false,
      );
      rethrow;
    }
  }

  Future<void> cargarPrimeraPaginaConteos() async {
    if (state.almacenSeleccionado == null) return;

    state = state.copyWith(isLoadingConteos: true);

    try {
      final codigoUsuario = await obtenerCodigoUsuarioActual();

      final conteos = await obtenerConteos(
        codigoAlmacen: state.almacenSeleccionado!.codigo,
        codigoUsuario: codigoUsuario,
        codigoConteo: 0,
      );

      conteos.sort((a, b) => b.fechaCreacion.compareTo(a.fechaCreacion));

      state = state.copyWith(
        conteosAsignados: conteos,
        isLoadingConteos: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingConteos: false);
      rethrow;
    }
  }

  Future<void> refrescarConteos() async {
    if (state.almacenSeleccionado == null) return;
    await cargarTodosLosConteos(state.almacenSeleccionado!.codigo);
  }

  bool _contieneConteoPorId(List<ConteoInventario> conteos, int codigo) {
    return conteos.any((conteo) => conteo.codigo == codigo);
  }
}

class ConteosAsignadosState {
  final List<AlmacenXLocal> almacenes;
  final AlmacenXLocal? almacenSeleccionado;
  final List<ConteoInventario> conteosAsignados;
  final bool isLoadingAlmacenes;
  final bool isLoadingConteos;

  ConteosAsignadosState({
    this.almacenes = const [],
    this.almacenSeleccionado,
    this.conteosAsignados = const [],
    this.isLoadingAlmacenes = false,
    this.isLoadingConteos = false,
  });

  ConteosAsignadosState copyWith({
    List<AlmacenXLocal>? almacenes,
    AlmacenXLocal? almacenSeleccionado,
    List<ConteoInventario>? conteosAsignados,
    bool? isLoadingAlmacenes,
    bool? isLoadingConteos,
  }) {
    return ConteosAsignadosState(
      almacenes: almacenes ?? this.almacenes,
      almacenSeleccionado: almacenSeleccionado ?? this.almacenSeleccionado,
      conteosAsignados: conteosAsignados ?? this.conteosAsignados,
      isLoadingAlmacenes: isLoadingAlmacenes ?? this.isLoadingAlmacenes,
      isLoadingConteos: isLoadingConteos ?? this.isLoadingConteos,
    );
  }
}
