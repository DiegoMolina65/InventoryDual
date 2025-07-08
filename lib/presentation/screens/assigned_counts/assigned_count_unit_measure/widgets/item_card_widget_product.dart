import 'package:flutter/material.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class ItemCardWidgetProduct extends StatelessWidget {
  final DetalleRecuentoInventario detalleRecuentoInventario;
  const ItemCardWidgetProduct({
    super.key,
    required this.detalleRecuentoInventario,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(theme),
            const SizedBox(height: 5),
            CustomProductCard(
              producto: detalleRecuentoInventario.producto!,
              lote: detalleRecuentoInventario.codigoLote,
              showCheckbox: false,
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Icon(
          Icons.inventory_2_outlined,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 12),
        Text(
          'Información del Producto',
          style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              fontSize: 15),
        ),
      ],
    );
  }
}
