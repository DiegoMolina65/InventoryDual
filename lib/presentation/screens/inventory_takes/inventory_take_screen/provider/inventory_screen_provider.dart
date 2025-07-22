import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/entities/almacen_resumen_tomas/almacen_resumen_tomas.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/domain/repository/almacen/almacen_repository.dart';
import 'package:m_dual_inventario/domain/repository/conteo/conteo_repository.dart';
import 'package:m_dual_inventario/domain/repository/toma_inventario/toma_inventario_repository.dart';
import 'package:m_dual_inventario/domain/repository/usuario/usuario/usuario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/conteo/conteo_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/almacen/almacen_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/toma_inventario/toma_inventario_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/usuario/usuario_provider.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/detalle_recuento_inventario_mapper/detalle_recuento_inventario_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/lista_detalle_producto_mapper/lista_detalle_producto_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_detail_model/count_inventory_detail_model.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

final tomasInventarioScreenProvider =
    StateNotifierProvider<TomasInventarioNotifier, TomasInventarioState>((ref) {
  final almacenRepository = ref.read(almacenRepositoryProvider);
  final tomaInventarioRepository = ref.read(tomaInventarioRepositoryProvider);
  final usuarioRepository = ref.read(usuarioRepositoryProvider);
  final conteoRepository = ref.read(conteoRepositoryProvider);
  return TomasInventarioNotifier(
    almacenRepository: almacenRepository,
    tomaInventarioRepository: tomaInventarioRepository,
    usuarioRepository: usuarioRepository,
    conteoRepository: conteoRepository,
  );
});

final selectorAlmacenProvider = tomasInventarioScreenProvider;

class TomasInventarioNotifier extends StateNotifier<TomasInventarioState> {
  final AlmacenRepository almacenRepository;
  final TomaInventarioRepository tomaInventarioRepository;
  final UsuarioRepository usuarioRepository;
  final ConteoRepository conteoRepository;

  TomasInventarioNotifier({
    required this.almacenRepository,
    required this.tomaInventarioRepository,
    required this.usuarioRepository,
    required this.conteoRepository,
  }) : super(TomasInventarioState());

  Future<void> inicialiarAlmacenes([int? codigoAlmacenSeleccionado]) async {
    await cargarAlmacenes(codigoAlmacenSeleccionado);
  }

  List<AlmacenResumenTomas> obtenerResumenesPorAlmacen({
    required List<AlmacenXLocal> almacenes,
    required List<TomasInventario> tomas,
  }) {
    return almacenes.map((almacen) {
      late final Iterable<TomasInventario> tomasFiltradas;

      if (almacen.codigo == 0) {
        // Almacen "TODOS": no filtrar
        tomasFiltradas = tomas;
      } else {
        // Almacen normal
        tomasFiltradas = tomas.where((t) => t.codigoAlmacen == almacen.codigo);
      }

      final pendientes =
          tomasFiltradas.where((t) => t.estado == 'PENDIENTE').length;
      final contando =
          tomasFiltradas.where((t) => t.estado == 'CONTANDO').length;
      final finalizados =
          tomasFiltradas.where((t) => t.estado == 'FINALIZADO').length;

      return AlmacenResumenTomas(
        almacen: almacen,
        pendientes: pendientes,
        contando: contando,
        finalizados: finalizados,
      );
    }).toList();
  }

  Future<void> cargarAlmacenes([int? codigoAlmacenSeleccionado]) async {
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

      if (almacenes.isNotEmpty) {
        AlmacenXLocal almacenASeleccionar;
        if (codigoAlmacenSeleccionado != null) {
          // Caso 1: Se pasó un código específico
          try {
            almacenASeleccionar = almacenes.firstWhere(
              (almacen) => almacen.codigo == codigoAlmacenSeleccionado,
            );
          } catch (e) {
            if (state.almacenSeleccionado != null) {
              try {
                almacenASeleccionar = almacenes.firstWhere(
                  (almacen) =>
                      almacen.codigo == state.almacenSeleccionado!.codigo,
                );
              } catch (e) {
                almacenASeleccionar = almacenes.first;
              }
            } else {
              almacenASeleccionar = almacenes.first;
            }
          }
        } else if (state.almacenSeleccionado != null) {
          // Caso 2: Mantener el almacén que ya está seleccionado
          try {
            almacenASeleccionar = almacenes.firstWhere(
              (almacen) => almacen.codigo == state.almacenSeleccionado!.codigo,
            );
          } catch (e) {
            almacenASeleccionar = almacenes.first;
          }
        } else {
          // Caso 3: No hay almacén seleccionado, usar el primero
          almacenASeleccionar = almacenes.first;
        }

        state = state.copyWith(
          almacenes: almacenes,
          almacenSeleccionado: almacenASeleccionar,
          isLoadingAlmacenes: false,
        );

        await cargarTomasInventario(almacenASeleccionar.codigo);

        final resumenes = obtenerResumenesPorAlmacen(
          almacenes: almacenes,
          tomas: state.tomasInventario,
        );

        AlmacenResumenTomas? resumenSeleccionado;
        if (resumenes.isNotEmpty) {
          try {
            resumenSeleccionado = resumenes.firstWhere(
              (resumen) => resumen.almacen.codigo == almacenASeleccionar.codigo,
            );
          } catch (e) {
            resumenSeleccionado = resumenes.first;
          }
        }

        state = state.copyWith(
          listaResumenes: resumenes,
          resumenSeleccionado: resumenSeleccionado,
        );
      } else {
        state = state.copyWith(
          almacenes: [],
          almacenSeleccionado: null,
          isLoadingAlmacenes: false,
          tomasInventario: [],
          listaResumenes: [],
          resumenSeleccionado: null,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoadingAlmacenes: false);
      rethrow;
    }
  }

  void seleccionarAlmacen(AlmacenXLocal almacen) async {
    if (state.almacenSeleccionado?.codigo == almacen.codigo) return;

    state = state.copyWith(
      almacenSeleccionado: almacen,
      isLoadingTomas: true,
    );

    try {
      await cargarTomasInventario(almacen.codigo);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cargarTomasInventario(int codigoAlmacen) async {
    try {
      state = state.copyWith(isLoadingTomas: true);
      final tomas =
          await tomaInventarioRepository.obtenerUltimasTomas(codigoAlmacen);
      final resumenes = obtenerResumenesPorAlmacen(
        almacenes: state.almacenes,
        tomas: tomas,
      );

      AlmacenResumenTomas? nuevoResumenSeleccionado;
      if (resumenes.isNotEmpty) {
        try {
          nuevoResumenSeleccionado =
              resumenes.firstWhere((r) => r.almacen.codigo == codigoAlmacen);
        } catch (_) {
          nuevoResumenSeleccionado = resumenes.first;
        }
      }

      state = state.copyWith(
        tomasInventario: tomas,
        isLoadingTomas: false,
        listaResumenes: resumenes,
        resumenSeleccionado: nuevoResumenSeleccionado,
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

  Future<TomasInventario> buscarTomaInventario(int codigoTomaInventario) async {
    try {
      state = state.copyWith(isLoadingDetalleToma: true);
      final tomaInventario = await tomaInventarioRepository
          .buscarTomaInventario(codigoTomaInventario);

      return tomaInventario;
    } catch (e) {
      state = state.copyWith(isLoadingDetalleToma: false);
      rethrow;
    }
  }

  Future<List<Usuario>> obtenerUsuariosPorAlmacen(int codigoAlmacen) async {
    try {
      state = state.copyWith(isLoadingUsuarios: true);
      final usuarios =
          await usuarioRepository.listaUsuariosPorAlmacen(codigoAlmacen);

      state = state.copyWith(
        usuarios: usuarios,
        isLoadingUsuarios: false,
      );

      return usuarios;
    } catch (e) {
      state = state.copyWith(isLoadingUsuarios: false);
      rethrow;
    }
  }

  Future<int> crearNuevoConteo({
    required int codigoTomaInventario,
    required int codigoAlmacen,
    required int codigoUsuarioAsignado,
  }) async {
    state = state.copyWith(isCreatingConteo: true);

    final tomaInventario = await tomaInventarioRepository
        .buscarTomaInventario(codigoTomaInventario);
    final estadoOriginal = tomaInventario.estado;

    final listaDetalleRecuentoInventario =
        (tomaInventario.listaDetalleProducto ?? []).map((detalle) {
      final detailProductModel =
          ListaDetalleProductoMapper.mapearAListaDetalleProducto(detalle);

      var countInventoryDetailModel =
          CountInventoryDetailModel.fromListDetailProduct(detailProductModel);

      countInventoryDetailModel = countInventoryDetailModel.copyWith(
        quantityCount: 0.0,
        listDetailCount: [],
        listImageCount: [],
        checkUbication: true,
        observations: '',
        jsonDetailCount: '',
        dateCount: DateTime.now(),
      );

      return DetalleRecuentoInventarioMapper.mapearDetalleRecuentoInventario(
          countInventoryDetailModel);
    }).toList();

    int numeroConteo = (tomaInventario.listaConteoInventario?.length ?? 0) + 1;

    final conteoInventario = ConteoInventario(
      codigo: 0,
      numeroConteo: numeroConteo,
      codigoTI: codigoTomaInventario,
      codigoAlmacen: codigoAlmacen,
      codigoUsuarioAsignado: codigoUsuarioAsignado,
      fechaCreacion: DateTime.now(),
      fechaInicio: DateTime.now(),
      fechaFin: DateTime.now(),
      estadoConteo: "PENDIENTE",
      tipo: "TODOS",
      nombreTomaInventario: tomaInventario.nombre,
      listaDetalleRecuentoInventario: listaDetalleRecuentoInventario,
      turnoTrabajo: '',
    );

    final codigoConteoInventario =
        await conteoRepository.guardarConteoInventario(conteoInventario);

    state = state.copyWith(
      isCreatingConteo: false,
      tomasInventario: state.tomasInventario
          .map((toma) => toma.codigo == codigoTomaInventario
              ? toma.copyWith(
                  cantidadConteo: toma.cantidadConteo + 1,
                  estado: estadoOriginal)
              : toma)
          .toList(),
    );

    return codigoConteoInventario;
  }

  Future<Map<String, dynamic>> prepararNuevoConteo(
      int codigoTomaInventario) async {
    state = state.copyWith(isCreatingConteo: true);

    final tomaInventario = await tomaInventarioRepository
        .buscarTomaInventario(codigoTomaInventario);
    final usuarios = await usuarioRepository
        .listaUsuariosPorAlmacen(tomaInventario.codigoAlmacen);

    state = state.copyWith(isCreatingConteo: false);

    return {
      'tomaInventario': tomaInventario,
      'usuarios': usuarios,
    };
  }

  Future<TomasInventario> nuevaTomaInventarioAPartirDeTomaExistente(
      int codigoTomaInventario) async {
    state = state.copyWith(isLoadingDetalleToma: true);

    final tomaOriginal = await tomaInventarioRepository
        .buscarTomaInventario(codigoTomaInventario);

    final nuevaToma = TomasInventario(
      codigo: 0,
      nombre: tomaOriginal.nombre,
      codigoAlmacen: tomaOriginal.codigoAlmacen,
      codigoUsuarioCreador: tomaOriginal.codigoUsuarioCreador,
      fechaRegistro: DateTime.now(),
      estado: 'PENDIENTE',
      tipo: tomaOriginal.tipo,
      cantidadProducto: tomaOriginal.cantidadProducto,
      cantidadConteo: 0,
      cantidadConteoFinalizado: 0,
      listaDetalleProducto: tomaOriginal.listaDetalleProducto
          ?.map((detalle) => ListaDetalleProducto(
                codigoTomaInventario: 0,
                codigoProducto: detalle.codigoProducto,
                codigoUnidadMedida: detalle.codigoUnidadMedida,
                codigoLote: detalle.codigoLote,
                stock: detalle.stock,
                verificado: false,
                cantidadVerificada: 0,
                producto: detalle.producto,
              ))
          .toList(),
      listaConteoInventario: [],
    );

    state = state.copyWith(isLoadingDetalleToma: false);
    return nuevaToma;
  }

  Future<void> refrescarTomasInventario() async {
    if (state.almacenSeleccionado == null) return;
    final loadingState = state.isLoadingTomas;
    state = state.copyWith(isLoadingTomas: true);

    try {
      final tomas = await tomaInventarioRepository
          .obtenerUltimasTomas(state.almacenSeleccionado!.codigo);

      final resumenes = obtenerResumenesPorAlmacen(
        almacenes: state.almacenes,
        tomas: tomas,
      );

      AlmacenResumenTomas? nuevoResumenSeleccionado;
      if (resumenes.isNotEmpty && state.resumenSeleccionado != null) {
        try {
          nuevoResumenSeleccionado = resumenes.firstWhere((r) =>
              r.almacen.codigo == state.resumenSeleccionado!.almacen.codigo);
        } catch (_) {
          nuevoResumenSeleccionado = resumenes.first;
        }
      }

      state = state.copyWith(
        tomasInventario: tomas,
        isLoadingTomas: false,
        listaResumenes: resumenes,
        resumenSeleccionado: nuevoResumenSeleccionado,
      );
    } catch (e) {
      state = state.copyWith(isLoadingTomas: loadingState);
    }
  }

  void seleccionarResumen(AlmacenResumenTomas resumen) {
    state = state.copyWith(resumenSeleccionado: resumen);
  }
}

class TomasInventarioState {
  final bool isLoadingAlmacenes;
  final bool isLoadingTomas;
  final bool isLoadingDetalleToma;
  final bool isLoadingUsuarios;
  final bool isCreatingConteo;
  final AlmacenXLocal? almacenSeleccionado;
  final List<AlmacenXLocal> almacenes;
  final List<TomasInventario> tomasInventario;
  final List<Usuario> usuarios;
  final AlmacenResumenTomas? resumenSeleccionado;
  final List<AlmacenResumenTomas> listaResumenes;

  TomasInventarioState({
    this.isLoadingAlmacenes = false,
    this.isLoadingTomas = false,
    this.isLoadingDetalleToma = false,
    this.isLoadingUsuarios = false,
    this.isCreatingConteo = false,
    this.almacenSeleccionado,
    this.almacenes = const [],
    this.tomasInventario = const [],
    this.usuarios = const [],
    this.listaResumenes = const [],
    this.resumenSeleccionado,
  });

  TomasInventarioState copyWith({
    bool? isLoadingAlmacenes,
    bool? isLoadingTomas,
    bool? isLoadingDetalleToma,
    bool? isLoadingUsuarios,
    bool? isCreatingConteo,
    AlmacenXLocal? almacenSeleccionado,
    List<AlmacenXLocal>? almacenes,
    List<TomasInventario>? tomasInventario,
    List<Usuario>? usuarios,
    AlmacenResumenTomas? resumenSeleccionado,
    List<AlmacenResumenTomas>? listaResumenes,
  }) {
    return TomasInventarioState(
        isLoadingAlmacenes: isLoadingAlmacenes ?? this.isLoadingAlmacenes,
        isLoadingTomas: isLoadingTomas ?? this.isLoadingTomas,
        isLoadingDetalleToma: isLoadingDetalleToma ?? this.isLoadingDetalleToma,
        isLoadingUsuarios: isLoadingUsuarios ?? this.isLoadingUsuarios,
        isCreatingConteo: isCreatingConteo ?? this.isCreatingConteo,
        almacenSeleccionado: almacenSeleccionado ?? this.almacenSeleccionado,
        almacenes: almacenes ?? this.almacenes,
        tomasInventario: tomasInventario ?? this.tomasInventario,
        usuarios: usuarios ?? this.usuarios,
        resumenSeleccionado: resumenSeleccionado ?? this.resumenSeleccionado,
        listaResumenes: listaResumenes ?? this.listaResumenes);
  }
}
