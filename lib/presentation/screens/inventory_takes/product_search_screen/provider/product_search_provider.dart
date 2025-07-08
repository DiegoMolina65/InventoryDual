import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/linea/linea.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/grupo/grupo_local_repository_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/linea/linea_local_repository_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/subgrupo/subgrupo_local_repository_impl.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/search_strategy.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/strategy_factory.dart';

class EstadoBusquedaProducto {
  final List<Producto> productos;
  final List<Producto> productosSeleccionados;
  final bool isLoading;
  final String? errorMessage;
  final Map<String, dynamic> filtros;
  final TipoBusqueda? tipoBusquedaActual;
  final String? textoBusqueda;
  final bool todosSeleccionados;
  final String nombreBusqueda;
  final BusquedaStrategy? strategy;

  EstadoBusquedaProducto({
    this.productos = const [],
    this.productosSeleccionados = const [],
    this.isLoading = false,
    this.errorMessage,
    this.filtros = const {},
    this.tipoBusquedaActual,
    this.textoBusqueda,
    this.todosSeleccionados = false,
    this.nombreBusqueda = '',
    this.strategy,
  });

  EstadoBusquedaProducto copyWith({
    List<Producto>? productos,
    List<Producto>? productosSeleccionados,
    bool? isLoading,
    String? errorMessage,
    Map<String, dynamic>? filtros,
    TipoBusqueda? tipoBusquedaActual,
    String? textoBusqueda,
    bool? todosSeleccionados,
    String? nombreBusqueda,
    BusquedaStrategy? strategy,
  }) {
    return EstadoBusquedaProducto(
      productos: productos ?? this.productos,
      productosSeleccionados:
          productosSeleccionados ?? this.productosSeleccionados,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      filtros: filtros ?? this.filtros,
      tipoBusquedaActual: tipoBusquedaActual ?? this.tipoBusquedaActual,
      textoBusqueda: textoBusqueda ?? this.textoBusqueda,
      todosSeleccionados: todosSeleccionados ?? this.todosSeleccionados,
      nombreBusqueda: nombreBusqueda ?? this.nombreBusqueda,
      strategy: strategy ?? this.strategy,
    );
  }
}

class BusquedaProductoNotifier extends StateNotifier<EstadoBusquedaProducto> {
  final Ref ref;

  BusquedaProductoNotifier(this.ref) : super(EstadoBusquedaProducto());
  void actualizarProductos(List<Producto> productos) {
    state = state.copyWith(
      productos: productos,
      isLoading: false,
      errorMessage: null,
    );
  }

  void establecerCargando() {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );
  }

  void limpiarFiltros() {
    state = state.copyWith(
      filtros: {},
      errorMessage: null,
      textoBusqueda: '',
    );
  }

  void resetearBusqueda() {
    final currentStrategy = state.strategy;
    final currentTipoBusqueda = state.tipoBusquedaActual;

    state = EstadoBusquedaProducto(
      tipoBusquedaActual: currentTipoBusqueda,
      strategy: currentStrategy,
    );
  }

  void establecerEstrategia(String tipoBusqueda) {
    try {
      final strategy = StrategyFactory.obtenerStrategy(tipoBusqueda);
      state = state.copyWith(strategy: strategy);
    } catch (e) {
      final defaultStrategy = StrategyFactory.obtenerStrategy('regular');
      state = state.copyWith(strategy: defaultStrategy);
    }
  }

  void toggleSeleccionProducto(Producto producto) {
    final seleccionados = List<Producto>.from(state.productosSeleccionados);

    if (seleccionados.contains(producto)) {
      seleccionados.remove(producto);
      if (producto.listaLotes != null && producto.listaLotes!.isNotEmpty) {
        seleccionados.add(producto);
      }
    } else {
      seleccionados.add(producto);
    }

    final todosProductosConLotesNoVacios = state.productos
        .where((p) => p.listaLotes != null && p.listaLotes!.isNotEmpty);

    final todos = seleccionados.length ==
            todosProductosConLotesNoVacios.length &&
        todosProductosConLotesNoVacios.isNotEmpty &&
        seleccionados.every(
            (selected) => todosProductosConLotesNoVacios.contains(selected));

    state = state.copyWith(
      productosSeleccionados: seleccionados,
      todosSeleccionados: todos,
    );
  }

  void toggleSeleccionProductoConLotes(
      Producto producto, List<LotesEntidad>? lotesSeleccionados) {
    if (lotesSeleccionados == null) return;
    final productoConLotes = producto.copyWith(listaLotes: lotesSeleccionados);
    toggleSeleccionProducto(productoConLotes);
  }

  List<LotesEntidad>? obtenerLotesSeleccionado(String codigoProducto) {
    final producto = state.productosSeleccionados
        .where((pro) => pro.codigo == codigoProducto)
        .firstOrNull;
    if (producto == null) {
      return null;
    }
    return producto.listaLotes;
  }

  void seleccionarTodosLosProductos() {
    state = state.copyWith(
      productosSeleccionados: List.from(state.productos),
      todosSeleccionados: true,
    );
  }

  void deseleccionarTodosLosProductos() {
    state = state.copyWith(
      productosSeleccionados: [],
      todosSeleccionados: false,
    );
  }

  Future<void> inicializarBusqueda({
    required String tipoBusqueda,
    required int codigoAlmacen,
    String? fecha,
    int? codigoLinea,
    int? codigoGrupo,
    int? codigoSubgrupo,
    String? ubicacion,
    String? nombreProducto,
    String? codigoBarra,
  }) async {
    resetearBusqueda();
    establecerEstrategia(tipoBusqueda);
    if (state.strategy == null) {
      return;
    }
    try {
      await inicializarNombreBusqueda(
        tipoBusqueda: tipoBusqueda,
        codigoLinea: codigoLinea,
        codigoGrupo: codigoGrupo,
        codigoSubgrupo: codigoSubgrupo,
        ubicacion: ubicacion,
        nombreProducto: nombreProducto,
      );
      await buscarProductos(
        codigoAlmacen: codigoAlmacen,
        fecha: fecha,
        codigoLinea: codigoLinea,
        codigoGrupo: codigoGrupo,
        codigoSubgrupo: codigoSubgrupo,
        ubicacion: ubicacion,
        nombreProducto: nombreProducto,
        codigoBarra: codigoBarra,
      );
      seleccionarTodosLosProductos();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> inicializarNombreBusqueda({
    required String tipoBusqueda,
    int? codigoLinea,
    int? codigoGrupo,
    int? codigoSubgrupo,
    String? ubicacion,
    String? nombreProducto,
  }) async {
    String nombre = '';
    switch (tipoBusqueda) {
      case 'grupo':
        List<String> partes = [];
        if (codigoLinea != null && codigoLinea > 0) {
          final lineasAsync = await ref.read(lineasProvider.future);
          final linea = lineasAsync.firstWhere(
            (l) => l.codigo == codigoLinea,
            orElse: () =>
                Linea(codigo: codigoLinea, descripcion: 'Línea $codigoLinea'),
          );
          partes.add("Línea: ${linea.descripcion}");

          if (codigoGrupo != null && codigoGrupo > 0) {
            final gruposAsync =
                await ref.read(gruposPorLineaProvider(codigoLinea).future);
            final grupo = gruposAsync.firstWhere(
              (g) => g.codigo == codigoGrupo,
              orElse: () => Grupo(
                  codigo: codigoGrupo,
                  descripcion: 'Grupo $codigoGrupo',
                  lineaCodigo: codigoLinea),
            );
            partes.add("Grupo: ${grupo.descripcion}");

            if (codigoSubgrupo != null && codigoSubgrupo > 0) {
              final subgruposAsync =
                  await ref.read(subgruposPorGrupoProvider(codigoGrupo).future);
              final subgrupo = subgruposAsync.firstWhere(
                (s) => s.codigo == codigoSubgrupo,
                orElse: () => Subgrupo(
                    codigo: codigoSubgrupo,
                    descripcion: 'Subgrupo $codigoSubgrupo',
                    lineaCodigo: codigoLinea,
                    grupoCodigo: codigoGrupo),
              );
              partes.add("Subgrupo: ${subgrupo.descripcion}");
            }
          }
        }

        nombre = partes.isNotEmpty ? partes.join(' / ') : 'Todos los grupos';
        break;

      case 'producto':
        nombre = nombreProducto != null && nombreProducto.isNotEmpty
            ? "Busqueda producto: $nombreProducto"
            : "Buscar productos";
        break;

      case 'ubicacion':
        nombre = ubicacion != null && ubicacion.isNotEmpty
            ? "Busqueda ubicación: $ubicacion"
            : "Todas las ubicaciones";
        break;

      default:
        nombre = "Búsqueda de productos";
    }

    state = state.copyWith(nombreBusqueda: nombre);
  }

  Future<void> buscarProductos({
    required int codigoAlmacen,
    String? fecha,
    int? codigoLinea,
    int? codigoGrupo,
    int? codigoSubgrupo,
    String? ubicacion,
    String? nombreProducto,
    String? codigoBarra,
  }) async {
    if (state.strategy == null) {
      return;
    }

    final parametrosBase = <String, dynamic>{
      'codigoAlmacen': codigoAlmacen,
      'fecha': fecha,
      'codigoLinea': codigoLinea,
      'codigoGrupo': codigoGrupo,
      'codigoSubgrupo': codigoSubgrupo,
      'nombreProducto': nombreProducto,
      'ubicacion': ubicacion,
      'codigoBarra': codigoBarra,
    };

    parametrosBase.removeWhere((key, value) => value == null);
    final parametros = state.strategy!.obtenerParametros(parametrosBase);
    try {
      establecerCargando();
      try {
        await state.strategy!.buscarProductos(
          notifier: this,
          parametros: parametros,
          ref: ref,
        );
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final busquedaProductoProvider =
    StateNotifierProvider<BusquedaProductoNotifier, EstadoBusquedaProducto>(
  (ref) => BusquedaProductoNotifier(ref),
);

final lineaRepositoryProvider = Provider((ref) => LineaLocalRepositoryImpl());
final grupoRepositoryProvider = Provider((ref) => GrupoLocalRepositoryImpl());
final subgrupoRepositoryProvider =
    Provider((ref) => SubgrupoLocalRepositoryImpl());

final lineasProvider = FutureProvider<List<Linea>>((ref) async {
  final repository = ref.read(lineaRepositoryProvider);
  return await repository.obtenerLineas();
});

final gruposPorLineaProvider =
    FutureProvider.family<List<Grupo>, int>((ref, codigoLinea) async {
  final repository = ref.read(grupoRepositoryProvider);
  return await repository.obtenerGruposPorLinea(codigoLinea);
});

final subgruposPorGrupoProvider =
    FutureProvider.family<List<Subgrupo>, int>((ref, codigoGrupo) async {
  final repository = ref.read(subgrupoRepositoryProvider);
  return await repository.obtenerSubgruposPorGrupo(codigoGrupo);
});
