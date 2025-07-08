import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/linea/linea.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/domain/repository/toma_inventario/toma_inventario_repository.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/toma_inventario/toma_inventario_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/grupo/grupo_local_repository_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/linea/linea_local_repository_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/subgrupo/subgrupo_local_repository_impl.dart';

enum TipoBusqueda { grupo, producto, ubicacion, codigo }

class DetalleTomaInventarioState {
  final TomasInventario? tomaInventario;
  final List<dynamic> productosAgregados;
  final List<String>? productosEliminados;
  final TipoBusqueda? tipoBusquedaActual;
  final List<ListaDetalleProducto> listaDetalleProducto;

  // Estados para el modal de búsqueda
  final String textoBusquedaProducto;
  final String textoBusquedaUbicacion;
  final String textoBusquedaCodigo;
  final Linea? lineaSeleccionada;
  final Grupo? grupoSeleccionado;
  final Subgrupo? subgrupoSeleccionado;

  // Estados de carga
  final bool isLoadingLineas;
  final bool isLoadingGrupos;
  final bool isLoadingSubgrupos;
  final bool isLoadingGuardar;
  final bool isLoadingDatos;

  // Listas de datos
  final List<Linea> lineas;
  final List<Grupo> grupos;
  final List<Subgrupo> subgrupos;

  // Mensajes y estados de diálogo
  final bool mostrarDialogo;
  final String? tipoDialogo;

  DetalleTomaInventarioState({
    this.tomaInventario,
    this.listaDetalleProducto = const [],
    this.productosAgregados = const [],
    this.productosEliminados,
    this.tipoBusquedaActual,
    this.textoBusquedaProducto = '',
    this.textoBusquedaUbicacion = '',
    this.textoBusquedaCodigo = '',
    this.lineaSeleccionada,
    this.grupoSeleccionado,
    this.subgrupoSeleccionado,
    this.isLoadingLineas = false,
    this.isLoadingGrupos = false,
    this.isLoadingSubgrupos = false,
    this.isLoadingGuardar = false,
    this.isLoadingDatos = false,
    this.lineas = const [],
    this.grupos = const [],
    this.subgrupos = const [],
    this.mostrarDialogo = false,
    this.tipoDialogo,
  });

  DetalleTomaInventarioState copyWith({
    TomasInventario? tomaInventario,
    List<ListaDetalleProducto>? listaDetalleProducto,
    List<dynamic>? productosAgregados,
    List<String>? productosEliminados,
    TipoBusqueda? tipoBusquedaActual,
    String? textoBusquedaProducto,
    String? textoBusquedaUbicacion,
    String? textoBusquedaCodigo,
    Linea? lineaSeleccionada,
    Grupo? grupoSeleccionado,
    Subgrupo? subgrupoSeleccionado,
    bool? isLoadingLineas,
    bool? isLoadingGrupos,
    bool? isLoadingSubgrupos,
    bool? isLoadingGuardar,
    bool? isLoadingDatos,
    List<Linea>? lineas,
    List<Grupo>? grupos,
    List<Subgrupo>? subgrupos,
    String? mensajeExito,
    bool? mostrarDialogo,
    String? tipoDialogo,
  }) {
    return DetalleTomaInventarioState(
      tomaInventario: tomaInventario ?? this.tomaInventario,
      listaDetalleProducto: listaDetalleProducto ?? this.listaDetalleProducto,
      productosAgregados: productosAgregados ?? this.productosAgregados,
      productosEliminados: productosEliminados ?? this.productosEliminados,
      tipoBusquedaActual: tipoBusquedaActual ?? this.tipoBusquedaActual,
      textoBusquedaProducto:
          textoBusquedaProducto ?? this.textoBusquedaProducto,
      textoBusquedaUbicacion:
          textoBusquedaUbicacion ?? this.textoBusquedaUbicacion,
      textoBusquedaCodigo: textoBusquedaCodigo ?? this.textoBusquedaCodigo,
      lineaSeleccionada: lineaSeleccionada ?? this.lineaSeleccionada,
      grupoSeleccionado: grupoSeleccionado ?? this.grupoSeleccionado,
      subgrupoSeleccionado: subgrupoSeleccionado ?? this.subgrupoSeleccionado,
      isLoadingLineas: isLoadingLineas ?? this.isLoadingLineas,
      isLoadingGrupos: isLoadingGrupos ?? this.isLoadingGrupos,
      isLoadingSubgrupos: isLoadingSubgrupos ?? this.isLoadingSubgrupos,
      isLoadingGuardar: isLoadingGuardar ?? this.isLoadingGuardar,
      isLoadingDatos: isLoadingDatos ?? this.isLoadingDatos,
      lineas: lineas ?? this.lineas,
      grupos: grupos ?? this.grupos,
      subgrupos: subgrupos ?? this.subgrupos,
      mostrarDialogo: mostrarDialogo ?? this.mostrarDialogo,
      tipoDialogo: tipoDialogo ?? this.tipoDialogo,
    );
  }

  int get cantidadTotalProductos {
    int cantidadTotal = 0;
    if (tomaInventario?.listaDetalleProducto != null &&
        tomaInventario!.listaDetalleProducto!.isNotEmpty) {
      cantidadTotal = tomaInventario!.listaDetalleProducto!.length;
    } else if (tomaInventario?.cantidadProducto != null &&
        tomaInventario!.cantidadProducto > 0) {
      cantidadTotal = tomaInventario!.cantidadProducto;
    }
    if (productosAgregados.isNotEmpty) {
      cantidadTotal += productosAgregados.length;
    }
    return cantidadTotal;
  }

  String get fechaFormateada {
    final fecha = tomaInventario?.fechaRegistro;
    return fecha != null ? fecha.shortDate() : 'Sin fecha';
  }
}

class DetalleTomaInventarioNotifier
    extends StateNotifier<DetalleTomaInventarioState> {
  final TomaInventarioRepository tomaInventarioRepository;
  final LineaLocalRepositoryImpl lineaRepository;
  final GrupoLocalRepositoryImpl grupoRepository;
  final SubgrupoLocalRepositoryImpl subgrupoRepository;

  DetalleTomaInventarioNotifier({
    required this.tomaInventarioRepository,
    required this.lineaRepository,
    required this.grupoRepository,
    required this.subgrupoRepository,
  }) : super(DetalleTomaInventarioState());

  Future<void> cargarDatos(int codigoTomaInventario) async {
    try {
      state = state.copyWith(isLoadingDatos: true);
      final tomaInventario = await tomaInventarioRepository
          .buscarTomaInventario(codigoTomaInventario);
      await cargarLineas();
      if (mounted) {
        final listaDetalleProducto = List<ListaDetalleProducto>.from(
            tomaInventario.listaDetalleProducto ?? []);
        state = state.copyWith(
          listaDetalleProducto: listaDetalleProducto,
          tomaInventario: tomaInventario,
          isLoadingDatos: false,
        );
      }
    } catch (e) {
      if (mounted) {
        state = state.copyWith(isLoadingDatos: false);
      }
      rethrow;
    }
  }

  Future<void> cargarDatosIniciales() async {
    try {
      if (state.lineas.isEmpty) {
        await cargarLineas();
      }
      if (state.lineaSeleccionada != null ||
          state.grupoSeleccionado != null ||
          state.subgrupoSeleccionado != null) {
        final lineasActuales = state.lineas;
        if (mounted) {
          state = state.copyWith(
            lineaSeleccionada: null,
            grupoSeleccionado: null,
            subgrupoSeleccionado: null,
            grupos: const [],
            subgrupos: const [],
            lineas: lineasActuales,
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void agregarProductos(List<Producto> productosNuevos) {
    final List<ListaDetalleProducto> nuevosDetallesParaAgregar = [];
    final Set<String> idsExistentes = state.listaDetalleProducto
        .map((detalle) =>
            '${detalle.codigoProducto}-${detalle.codigoLote ?? 'no_lote'}')
        .toSet();

    for (var producto in productosNuevos) {
      if (producto.listaLotes != null && producto.listaLotes!.isNotEmpty) {
        for (var lote in producto.listaLotes!) {
          final String nuevoId = '${producto.codigo}-${lote.codigo}';
          if (!idsExistentes.contains(nuevoId)) {
            nuevosDetallesParaAgregar.add(
              ListaDetalleProducto(
                codigoTomaInventario: state.tomaInventario!.codigo,
                codigoProducto: producto.codigo,
                codigoUnidadMedida: producto.codigoUnidadMedidaBase,
                stock: lote.stock.toDouble(),
                verificado: false,
                codigoLote: lote.codigo,
                cantidadVerificada: 0.0,
                producto: producto,
              ),
            );
            idsExistentes.add(nuevoId);
          }
        }
      } else {
        final String nuevoId = '${producto.codigo}-no_lote';
        if (!idsExistentes.contains(nuevoId)) {
          nuevosDetallesParaAgregar.add(
            ListaDetalleProducto(
              codigoTomaInventario: state.tomaInventario!.codigo,
              codigoProducto: producto.codigo,
              codigoUnidadMedida: producto.codigoUnidadMedidaBase,
              stock: producto.stock,
              verificado: false,
              codigoLote: null,
              cantidadVerificada: 0.0,
              producto: producto,
            ),
          );
          idsExistentes.add(nuevoId);
        }
      }
    }

    state = state.copyWith(
      listaDetalleProducto: [
        ...state.listaDetalleProducto,
        ...nuevosDetallesParaAgregar
      ],
    );
  }

  void establecerTipoBusqueda(TipoBusqueda tipo) {
    state = state.copyWith(tipoBusquedaActual: tipo);
  }

  void seleccionarLinea(Linea? linea) {
    if (linea == null) {
      state = state.copyWith(
        lineaSeleccionada: null,
        grupoSeleccionado: null,
        subgrupoSeleccionado: null,
        grupos: const [],
        subgrupos: const [],
        isLoadingGrupos: false,
        isLoadingSubgrupos: false,
      );
      return;
    }
    if (state.lineaSeleccionada != null &&
        state.lineaSeleccionada!.codigo == linea.codigo) {
      return;
    }
    state = DetalleTomaInventarioState(
      listaDetalleProducto: state.listaDetalleProducto,
      tomaInventario: state.tomaInventario,
      productosAgregados: state.productosAgregados,
      lineas: state.lineas,
      textoBusquedaProducto: state.textoBusquedaProducto,
      textoBusquedaUbicacion: state.textoBusquedaUbicacion,
      textoBusquedaCodigo: state.textoBusquedaCodigo,
      tipoBusquedaActual: state.tipoBusquedaActual,
      lineaSeleccionada: linea,
      isLoadingGrupos: true,
    );
    cargarGrupos(linea.codigo);
  }

  void seleccionarGrupo(Grupo? grupo) {
    if (grupo == null) {
      state = state.copyWith(
        grupoSeleccionado: null,
        subgrupoSeleccionado: null,
        subgrupos: const [],
        isLoadingSubgrupos: false,
      );
      return;
    }
    if (state.grupoSeleccionado != null &&
        state.grupoSeleccionado!.codigo == grupo.codigo) {
      return;
    }

    if (state.lineaSeleccionada != null &&
        grupo.lineaCodigo != state.lineaSeleccionada!.codigo) {
      final lineaActual = state.lineaSeleccionada;
      reiniciarSelecciones();
      if (lineaActual != null) {
        seleccionarLinea(lineaActual);
      }
      return;
    }

    final estadoActual = state;
    state = DetalleTomaInventarioState(
      listaDetalleProducto: estadoActual.listaDetalleProducto,
      tomaInventario: estadoActual.tomaInventario,
      productosAgregados: estadoActual.productosAgregados,
      tipoBusquedaActual: estadoActual.tipoBusquedaActual,
      textoBusquedaProducto: estadoActual.textoBusquedaProducto,
      textoBusquedaUbicacion: estadoActual.textoBusquedaUbicacion,
      textoBusquedaCodigo: estadoActual.textoBusquedaCodigo,
      lineaSeleccionada: estadoActual.lineaSeleccionada,
      lineas: estadoActual.lineas,
      grupos: estadoActual.grupos,
      isLoadingLineas: estadoActual.isLoadingLineas,
      isLoadingGrupos: estadoActual.isLoadingGrupos,
      grupoSeleccionado: grupo,
      subgrupos: const [],
      subgrupoSeleccionado: null,
      isLoadingSubgrupos: true,
    );
    cargarSubgrupos(grupo.codigo);
  }

  void seleccionarSubgrupo(Subgrupo? subgrupo) {
    if (subgrupo == null) {
      state = state.copyWith(subgrupoSeleccionado: null);
      return;
    }

    if (state.subgrupoSeleccionado != null &&
        state.subgrupoSeleccionado!.codigo == subgrupo.codigo) {
      return;
    }

    bool subgrupoExisteEnLista =
        state.subgrupos.any((s) => s.codigo == subgrupo.codigo);
    if (!subgrupoExisteEnLista) {
      final grupoActual = state.grupoSeleccionado;
      if (grupoActual != null) {
        state = state.copyWith(
          subgrupoSeleccionado: null,
          subgrupos: const [],
          isLoadingSubgrupos: true,
        );
        cargarSubgrupos(grupoActual.codigo);
      }
      return;
    }
    state = state.copyWith(subgrupoSeleccionado: subgrupo);
  }

  Future<void> cargarLineas() async {
    if (state.lineas.isNotEmpty) return;
    try {
      state = state.copyWith(isLoadingLineas: true);
      final lineas = await lineaRepository.obtenerLineas();
      if (mounted) {
        state = state.copyWith(
          lineas: lineas,
          isLoadingLineas: false,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cargarGrupos(int codigoLinea) async {
    if (codigoLinea <= 0) {
      state = state.copyWith(
        grupos: const [],
        isLoadingGrupos: false,
      );
      return;
    }

    try {
      if (!state.isLoadingGrupos) {
        state = state.copyWith(isLoadingGrupos: true);
      }

      final grupos = await grupoRepository.obtenerGruposPorLinea(codigoLinea);
      if (mounted) {
        state = state.copyWith(
          grupos: grupos,
          isLoadingGrupos: false,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cargarSubgrupos(int codigoGrupo) async {
    if (codigoGrupo <= 0) {
      state = state.copyWith(
        subgrupos: const [],
        isLoadingSubgrupos: false,
      );
      return;
    }

    try {
      if (!state.isLoadingSubgrupos) {
        state = state.copyWith(isLoadingSubgrupos: true);
      }

      final subgrupos =
          await subgrupoRepository.obtenerSubgruposPorGrupo(codigoGrupo);
      if (mounted) {
        state = state.copyWith(
          subgrupos: subgrupos,
          isLoadingSubgrupos: false,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  void actualizarTextoBusquedaProducto(String texto) {
    state = state.copyWith(textoBusquedaProducto: texto.toUpperCase());
  }

  void actualizarTextoBusquedaUbicacion(String texto) {
    state = state.copyWith(textoBusquedaUbicacion: texto.toUpperCase());
  }

  void actualizarTextoBusquedaCodigo(String texto) {
    state = state.copyWith(textoBusquedaCodigo: texto.toUpperCase());
  }

  void limpiarProductosAgregados() {
    state = state.copyWith(productosAgregados: []);
  }

  void inicializarConNuevaToma(TomasInventario nuevaToma) {
    final listaDetalleProducto =
        nuevaToma.listaDetalleProducto ?? <ListaDetalleProducto>[];
    state = state.copyWith(
      tomaInventario: nuevaToma,
      isLoadingDatos: false,
      listaDetalleProducto: listaDetalleProducto,
    );
  }

  Future<void> eliminarProducto(ListaDetalleProducto detalle) async {
    final current = state.listaDetalleProducto;
    final idx = current.indexOf(detalle);
    if (idx == -1) return;
    final updated = List<ListaDetalleProducto>.from(current)..removeAt(idx);
    state = state.copyWith(listaDetalleProducto: updated);
  }

  Future<void> guardarCambiosTomaInventario() async {
    final tomaInventario = state.tomaInventario;
    if (tomaInventario == null) {
      _detenerCarga();
      return;
    }

    _iniciarCarga();

    try {
      final tomaActualizada = tomaInventario.copyWith(
        listaDetalleProducto: state.listaDetalleProducto,
      );

      final resultado = await tomaInventarioRepository
          .guardarTomaInventario(tomaActualizada)
          .ejecutar();

      if (!mounted) return;

      state = resultado > 0
          ? state.copyWith(
              tomaInventario: tomaActualizada,
              productosAgregados: [],
              productosEliminados: [],
              isLoadingGuardar: false,
            )
          : state.copyWith(isLoadingGuardar: false);
    } catch (_) {
      _detenerCarga();
    }
  }

  void _iniciarCarga() {
    if (mounted) {
      state = state.copyWith(isLoadingGuardar: true);
    }
  }

  void _detenerCarga() {
    if (mounted) {
      state = state.copyWith(isLoadingGuardar: false);
    }
  }

  void reiniciarSelecciones() {
    final lineasActuales =
        state.lineas.isNotEmpty ? List<Linea>.from(state.lineas) : <Linea>[];

    state = DetalleTomaInventarioState(
      listaDetalleProducto: state.listaDetalleProducto,
      tomaInventario: state.tomaInventario,
      productosAgregados: state.productosAgregados,
      tipoBusquedaActual: null,
      textoBusquedaProducto: '',
      textoBusquedaUbicacion: '',
      textoBusquedaCodigo: '',
      lineaSeleccionada: null,
      grupoSeleccionado: null,
      subgrupoSeleccionado: null,
      grupos: const [],
      subgrupos: const [],
      lineas: lineasActuales,
      isLoadingLineas: false,
      isLoadingGrupos: false,
      isLoadingSubgrupos: false,
      isLoadingDatos: false,
      isLoadingGuardar: false,
    );
    if (lineasActuales.isEmpty) {
      cargarLineas();
    }
  }

  void resetDetalleTomaInventario() {
    state = DetalleTomaInventarioState();
  }
}

final detalleTomaInventarioProvider = StateNotifierProvider<
    DetalleTomaInventarioNotifier, DetalleTomaInventarioState>((ref) {
  final tomaInventarioRepository = ref.read(tomaInventarioRepositoryProvider);

  return DetalleTomaInventarioNotifier(
    tomaInventarioRepository: tomaInventarioRepository,
    lineaRepository: LineaLocalRepositoryImpl(),
    grupoRepository: GrupoLocalRepositoryImpl(),
    subgrupoRepository: SubgrupoLocalRepositoryImpl(),
  );
});

final lineaRepositoryProvider = Provider((ref) => LineaLocalRepositoryImpl());
final grupoRepositoryProvider = Provider((ref) => GrupoLocalRepositoryImpl());
final subgrupoRepositoryProvider =
    Provider((ref) => SubgrupoLocalRepositoryImpl());

final lineasProvider = FutureProvider<List<Linea>>((ref) async {
  final repository = ref.read(lineaRepositoryProvider);
  return await repository.obtenerLineas();
});

final gruposProvider = FutureProvider<List<Grupo>>((ref) async {
  final repository = ref.read(grupoRepositoryProvider);
  return await repository.obtenerGrupos();
});

final gruposPorLineaProvider =
    FutureProvider.family<List<Grupo>, int>((ref, codigoLinea) async {
  final repository = ref.read(grupoRepositoryProvider);
  return await repository.obtenerGruposPorLinea(codigoLinea);
});

final subgruposProvider = FutureProvider<List<Subgrupo>>((ref) async {
  final repository = ref.read(subgrupoRepositoryProvider);
  return await repository.obtenerSubgrupos();
});

final subgruposPorGrupoProvider =
    FutureProvider.family<List<Subgrupo>, int>((ref, codigoGrupo) async {
  final repository = ref.read(subgrupoRepositoryProvider);
  return await repository.obtenerSubgruposPorGrupo(codigoGrupo);
});
