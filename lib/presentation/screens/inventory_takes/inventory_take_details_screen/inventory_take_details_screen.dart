import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/provider/inventory_take_details_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/widgets/search_action_buttons_widget.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/widgets/dialogs/inventory_take_details_helper_dialog.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/widgets/header_info_widget.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/widgets/list_product_item_widget.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/provider/inventory_screen_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/inventory_take_screen.dart';

import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';

final detalleTomaProductosBuscadorProvider =
    localSearchProviderFamily<ListaDetalleProducto>('detalle_toma_productos',
        customFilter: (String texto, ListaDetalleProducto detalle) {
  final producto = detalle.producto;

  return producto.nombre.toUpperCase().contains(texto) ||
      producto.codigo.toString().contains(texto) ||
      (producto.ubicacion.toUpperCase().contains(texto)) ||
      (producto.codigoBarra.toUpperCase().contains(texto));
});

class DetalleTomaInventarioScreen extends ConsumerStatefulWidget {
  static const name = '/detalle-toma-inventario';
  final int codigoTomaInventario;
  final TomasInventario? nuevaTomaInventario;
  final bool esNuevaToma;
  final bool mostrarFloatingButton;
  final bool mostrarAppBar;

  const DetalleTomaInventarioScreen({
    Key? key,
    this.codigoTomaInventario = 0,
    this.nuevaTomaInventario,
    this.esNuevaToma = false,
    this.mostrarFloatingButton = true,
    this.mostrarAppBar = true,
  }) : super(key: key);

  @override
  ConsumerState<DetalleTomaInventarioScreen> createState() =>
      _DetalleTomaInventarioScreenState();
}

class _DetalleTomaInventarioScreenState
    extends ConsumerState<DetalleTomaInventarioScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _cargarDatos().ejecutar());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _cargarDatos() async {
    await Future.delayed(Duration.zero);
    final notifierDetalleTomaInventario =
        ref.read(detalleTomaInventarioProvider.notifier);

    if (widget.nuevaTomaInventario != null) {
      notifierDetalleTomaInventario
          .inicializarConNuevaToma(widget.nuevaTomaInventario!);

      if (!widget.esNuevaToma) {
        await notifierDetalleTomaInventario.cargarDatosIniciales();
      }
    } else if (widget.codigoTomaInventario > 0) {
      await notifierDetalleTomaInventario
          .cargarDatos(widget.codigoTomaInventario);

      await notifierDetalleTomaInventario.cargarDatosIniciales();
    }

    final productos =
        ref.read(detalleTomaInventarioProvider).listaDetalleProducto;
    ref
        .read(detalleTomaProductosBuscadorProvider.notifier)
        .updateOriginalList(productos);
  }

  Future<void> _guardarCambios() async {
    final state = ref.read(detalleTomaInventarioProvider);
    final detalleNotifier = ref.read(detalleTomaInventarioProvider.notifier);

    if (state.listaDetalleProducto.isEmpty) {
      CustomSnackBar.show(
        context,
        message:
            'Debe agregar al menos 1 producto para guardar la toma de inventario',
        type: SnackBarType.warning,
      );
      return;
    }

    final guardar =
        await DialogoDetalleTomaInventarioHelper.confirmarGuardarTomaInventario(
            context);

    if (guardar) {
      await detalleNotifier.guardarCambiosTomaInventario();

      await ref
          .read(tomasInventarioScreenProvider.notifier)
          .refrescarTomasInventario()
          .ejecutar();

      if (!mounted) return;
      context.go(TomasInventarioScreen.name, extra: {'refresh': true});

      detalleNotifier.resetDetalleTomaInventario();
    }
  }

  Future<void> _salirSinGuardar() async {
    final salir =
        await DialogoDetalleTomaInventarioHelper.confirmarSalida(context);
    
    if (!mounted || !salir) return;
    ref
        .read(detalleTomaInventarioProvider.notifier)
        .resetDetalleTomaInventario();
    context.go(TomasInventarioScreen.name, extra: {'refresh': true});
  }

  @override
  Widget build(BuildContext context) {
    final detalleState = ref.watch(detalleTomaInventarioProvider);
    final primaryColor = Theme.of(context).colorScheme.primary;

    ref.listen(detalleTomaInventarioProvider, (previous, current) {
      if (previous?.listaDetalleProducto != current.listaDetalleProducto) {
        ref
            .read(detalleTomaProductosBuscadorProvider.notifier)
            .updateOriginalList(current.listaDetalleProducto);
      }
    });

    final estadoBuscador = ref.watch(detalleTomaProductosBuscadorProvider);
    final listaDetalleProducto = estadoBuscador.filteredList;

    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: widget.mostrarAppBar
              ? AppBar(
                  backgroundColor: primaryColor,
                  title: const Text(
                    "Detalle de la Toma de Inventario",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                    onPressed: () {
                      _salirSinGuardar();
                    },
                  ),
                )
              : null,
          backgroundColor: Colors.grey[50],
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeaderInfoWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 1.0),
                      child: Row(children: [
                        Icon(Icons.playlist_add, color: primaryColor),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Añadir productos a la toma de inventario:',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: AccionBotonesWidget(),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    BuscadorLocalWidget<ListaDetalleProducto>(
                      provider: detalleTomaProductosBuscadorProvider,
                      hintText: 'Buscar por nombre, código o ubicación.',
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                Flexible(
                  child: detalleState.isLoadingDatos
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: primaryColor,
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.only(bottom: 80),
                          itemCount: listaDetalleProducto.length,
                          itemBuilder: (context, index) {
                            final detalle = listaDetalleProducto[index];
                            return DetalleProductoItemWidget(
                              detalleTomaInventario: detalle,
                              onEliminar: () {
                                ref
                                    .read(
                                        detalleTomaInventarioProvider.notifier)
                                    .eliminarProducto(detalle);
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          floatingActionButton: widget.mostrarFloatingButton
              ? CustomFloatingActionButton(
                  onPressed: _guardarCambios,
                  icon: Icons.save,
                  withContainer: true,
                )
              : null,
        ),
      ),
    );
  }
}
