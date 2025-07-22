import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/domain/repository/almacen/almacen_repository.dart';
import 'package:m_dual_inventario/domain/repository/toma_inventario/toma_inventario_repository.dart';
import 'package:m_dual_inventario/domain/repository/usuario/usuario/usuario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/almacen/almacen_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/toma_inventario/toma_inventario_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/usuario/usuario_provider.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

final reporteTomasInventarioProvider = StateNotifierProvider<
    ReporteTomasInventarioNotifier, ReporteTomasInventarioState>((ref) {
  final almacenRepository = ref.read(almacenRepositoryProvider);
  final tomaInventarioRepository = ref.read(tomaInventarioRepositoryProvider);
  final usuarioRepository = ref.read(usuarioRepositoryProvider);
  return ReporteTomasInventarioNotifier(
    almacenRepository: almacenRepository,
    tomaInventarioRepository: tomaInventarioRepository,
    usuarioRepository: usuarioRepository,
  );
});

class ReporteTomasInventarioNotifier
    extends StateNotifier<ReporteTomasInventarioState> {
  final AlmacenRepository almacenRepository;
  final TomaInventarioRepository tomaInventarioRepository;
  final UsuarioRepository usuarioRepository;
  ReporteTomasInventarioNotifier(
      {required this.almacenRepository,
      required this.tomaInventarioRepository,
      required this.usuarioRepository})
      : super(const ReporteTomasInventarioState());

  Future<void> cargarAlmacenes() async {
    try {
      state = state.copyWith(isLoadingAlmacenes: true);

      final codigoUsuario =
          await AppPreference.getValue<int>(KeyAppPreferences.codigoUsuario);
      bool esSupervisor =
          (await usuarioRepository.obtenerUsuarioLocal(codigoUsuario ?? 0))
                  ?.esSupervisor ??
              false;
      final almacenes = await almacenRepository.obtenerAlmacenesPorLocal(
          incluirOpcionTodos: esSupervisor);

      if (almacenes.isEmpty) {
        state = state.copyWith(isLoadingAlmacenes: false);
        return;
      }

      final codigoSeleccionado = state.almacenSeleccionado?.codigo;

      final almacenASeleccionar = almacenes.firstWhere(
        (almacen) => almacen.codigo == codigoSeleccionado,
        orElse: () => almacenes.first,
      );

      state = state.copyWith(
        almacenes: almacenes,
        almacenSeleccionado: almacenASeleccionar,
        isLoadingAlmacenes: false,
      );

      await cargarTomasInventario(almacenASeleccionar.codigo);
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
      isLoadingTomas: true,
      tomasInventario: [],
    );

    await cargarTomasInventario(almacen.codigo);
  }

  Future<void> cargarTomasInventario(int codigoAlmacen) async {
    try {
      state = state.copyWith(isLoadingTomas: true);
      final tomas =
          await tomaInventarioRepository.obtenerUltimasTomas(codigoAlmacen);

      state = state.copyWith(
        tomasInventario: tomas,
        isLoadingTomas: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingTomas: false);
      rethrow;
    }
  }

  List<TomasInventario> obtenerTomasPorAlmacenSeleccionado() {
    if (state.almacenSeleccionado == null) return [];
    return state.tomasInventario;
  }
}

class ReporteTomasInventarioState {
  final List<AlmacenXLocal> almacenes;
  final List<TomasInventario> tomasInventario;
  final AlmacenXLocal? almacenSeleccionado;
  final bool? isLoadingAlmacenes;
  final bool isLoadingTomas;

  const ReporteTomasInventarioState({
    this.almacenes = const [],
    this.tomasInventario = const [],
    this.almacenSeleccionado,
    this.isLoadingAlmacenes = false,
    this.isLoadingTomas = false,
  });

  ReporteTomasInventarioState copyWith({
    List<AlmacenXLocal>? almacenes,
    List<TomasInventario>? tomasInventario,
    AlmacenXLocal? almacenSeleccionado,
    bool? isLoadingAlmacenes,
    bool? isLoadingTomas,
  }) {
    return ReporteTomasInventarioState(
      almacenes: almacenes ?? this.almacenes,
      tomasInventario: tomasInventario ?? this.tomasInventario,
      almacenSeleccionado: almacenSeleccionado ?? this.almacenSeleccionado,
      isLoadingAlmacenes: isLoadingAlmacenes ?? this.isLoadingAlmacenes,
      isLoadingTomas: isLoadingTomas ?? this.isLoadingTomas,
    );
  }
}
