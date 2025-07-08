import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/provider/product_search_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/widgets/dialog/product_search_helper_dialog.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/widgets/search_header_widget.dart';

import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

final busquedaProductosBuscadorProvider = localSearchProviderFamily<Producto>(
    'busqueda_productos', customFilter: (String texto, Producto producto) {
  return producto.nombre.toUpperCase().contains(texto) ||
      producto.codigo.toString().contains(texto) ||
      (producto.ubicacion.toUpperCase().contains(texto)) ||
      (producto.codigoBarra.toUpperCase().contains(texto));
});

class BusquedaProductoScreen extends ConsumerStatefulWidget {
  static const String name = '/busqueda-producto';

  final String tipoBusqueda;
  final int codigoAlmacen;
  final String? fecha;
  final int? codigoLinea;
  final int? codigoGrupo;
  final int? codigoSubgrupo;
  final String? ubicacion;
  final String? nombreProducto;
  final String? codigoBarra;

  const BusquedaProductoScreen({
    Key? key,
    required this.tipoBusqueda,
    required this.codigoAlmacen,
    this.fecha,
    this.codigoLinea,
    this.codigoGrupo,
    this.codigoSubgrupo,
    this.ubicacion,
    this.nombreProducto,
    this.codigoBarra,
  }) : super(key: key);

  @override
  ConsumerState<BusquedaProductoScreen> createState() =>
      _BusquedaProductoScreenState();
}

class _BusquedaProductoScreenState
    extends ConsumerState<BusquedaProductoScreen> {
  bool _showOnlySelected = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final notifier = ref.read(busquedaProductoProvider.notifier);
      notifier.establecerEstrategia(widget.tipoBusqueda);

      notifier.inicializarBusqueda(
        tipoBusqueda: widget.tipoBusqueda,
        codigoAlmacen: widget.codigoAlmacen,
        fecha: widget.fecha,
        codigoLinea: widget.codigoLinea,
        codigoGrupo: widget.codigoGrupo,
        codigoSubgrupo: widget.codigoSubgrupo,
        ubicacion: widget.ubicacion,
        nombreProducto: widget.nombreProducto,
        codigoBarra: widget.codigoBarra,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _salirSinGuardar() async {
    final confirmar =
        await DialogoBusquedaProductoHelper.confirmarSalida(context);
    if (!mounted || !confirmar) return;

    ref.read(busquedaProductoProvider.notifier).resetearBusqueda();
    context.pop();
  }

  Future<void> _agregarProductosSeleccionados() async {
    final state = ref.read(busquedaProductoProvider);

    if (state.productosSeleccionados.isEmpty) {
      CustomSnackBar.show(
        context,
        message: 'No hay productos seleccionados.',
        type: SnackBarType.warning,
      );
      return;
    }

    final confirmar =
        await DialogoBusquedaProductoHelper.confirmarAgregarProductos(
      context,
      state.productosSeleccionados.length,
    );

    if (!mounted || !confirmar) return;

    final productosSeleccionados = List.from(state.productosSeleccionados);
    context.pop(productosSeleccionados);
  }

  void _toggleShowOnlySelected() {
    setState(() {
      _showOnlySelected = !_showOnlySelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final state = ref.watch(busquedaProductoProvider);
    final notifier = ref.read(busquedaProductoProvider.notifier);
    ref.listen(busquedaProductoProvider, (previous, current) {
      if (previous?.productos != current.productos) {
        ref
            .read(busquedaProductosBuscadorProvider.notifier)
            .updateOriginalList(current.productos);
      }
    });

    final appBar = AppBar(
      backgroundColor: primaryColor,
      title: const Text(
        'Seleccionar productos',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 25),
        onPressed: _salirSinGuardar,
      ),
    );

    if (state.strategy == null) {
      return Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
      );
    }

    final buscadorState = ref.watch(busquedaProductosBuscadorProvider);
    final productosFiltrados = buscadorState.filteredList;

    final productosAMostrar = _showOnlySelected
        ? productosFiltrados
            .where((producto) => state.productosSeleccionados
                .any((p) => p.codigo == producto.codigo))
            .toList()
        : productosFiltrados;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: EncabezadoBusquedaWidget(
                        strategy: state.strategy!,
                        encontrados: productosFiltrados.length,
                        seleccionados: state.productosSeleccionados.length,
                        onSelectAll: () =>
                            notifier.seleccionarTodosLosProductos(),
                        onDeselectAll: () =>
                            notifier.deseleccionarTodosLosProductos(),
                        allSelected: state.todosSeleccionados,
                        nombreBusqueda: state.nombreBusqueda,
                        showOnlySelected: _showOnlySelected,
                        onToggleView: _toggleShowOnlySelected,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 3.0),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: primaryColor),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Buscador en la lista de productos:',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: BuscadorLocalWidget<Producto>(
                        provider: busquedaProductosBuscadorProvider,
                        hintText: 'Buscar por nombre, código o ubicación.',
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Flexible(
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: primaryColor,
                        ),
                      )
                    : productosAMostrar.isEmpty
                        ? const Center(
                            child: Text(
                              'No se encontraron productos',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(8.0),
                            itemCount: productosAMostrar.length,
                            itemBuilder: (context, index) {
                              final producto = productosAMostrar[index];
                              final isSelected = state.productosSeleccionados
                                  .contains(producto);
                              return CustomProductCard(
                                key: ObjectKey(producto),
                                producto: producto,
                                isSelected: isSelected,
                                onTap: (tieneLotes) async {
                                  if (tieneLotes) {
                                    final lotes = producto.listaLotes!;

                                    final lotesSeleccionados =
                                        notifier.obtenerLotesSeleccionado(
                                            producto.codigo);

                                    final resultado =
                                        await DialogoBusquedaProductoHelper
                                            .seleccionarLotes(context, lotes,
                                                lotesSeleccionados:
                                                    lotesSeleccionados);

                                    notifier.toggleSeleccionProductoConLotes(
                                        producto, resultado);
                                    return;
                                  } 
                                  notifier.toggleSeleccionProducto(producto);
                                },
                                // onTap: () =>
                                //     notifier.toggleSeleccionProducto(producto),
                                // onTapLotes: () async {
                                //   final lotes = producto.listaLotes!;

                                //   final lotesSeleccionados =
                                //       notifier.obtenerLotesSeleccionado(
                                //           producto.codigo);

                                //   final resultado =
                                //       await DialogoBusquedaProductoHelper
                                //           .seleccionarLotes(context, lotes,
                                //               lotesSeleccionados:
                                //                   lotesSeleccionados);

                                //   notifier.toggleSeleccionProductoConLotes(
                                //       producto, resultado);
                                // },
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          icon: Icons.check,
          backgroundColor: primaryColor,
          withContainer: true,
          onPressed: _agregarProductosSeleccionados,
        ),
      ),
    );
  }
}
