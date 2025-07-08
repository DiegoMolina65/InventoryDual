import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/widgets/dialogs/inventory_take_details_helper_dialog.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class DetalleProductoItemWidget extends ConsumerWidget {
  final ListaDetalleProducto detalleTomaInventario;
  final VoidCallback? onEliminar;

  const DetalleProductoItemWidget(
      {super.key, required this.detalleTomaInventario, this.onEliminar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomProductCard(
      producto: detalleTomaInventario.producto,
      lote: detalleTomaInventario.codigoLote,
      showCheckbox: false,
      onDelete: () async {
        final confirmado =
            await DialogoDetalleTomaInventarioHelper.confirmarEliminarProducto(
                context, detalleTomaInventario.producto.nombre);
        if (confirmado) {
          onEliminar?.call();
        }
      },
      // onTapLotes: () async {
      //   final List<LotesEntidad>? lotesAsociadosAEsteProducto =
      //       detalleTomaInventario.producto.listaLotes;
      //   final String nombreDelProducto = detalleTomaInventario.producto.nombre;

      //   if (lotesAsociadosAEsteProducto == null ||
      //       lotesAsociadosAEsteProducto.isEmpty) {
      //     return;
      //   }

      //   await DialogoDetalleTomaInventarioHelper.mostrarLotesDeProducto(
      //     context,
      //     lotesAsociadosAEsteProducto,
      //     nombreDelProducto,
      //   );
      // },
    );
  }
}
