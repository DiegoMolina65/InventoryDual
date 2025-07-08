import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/provider/inventory_take_details_provider.dart';

class HeaderInfoWidget extends ConsumerWidget {
  const HeaderInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detalleTomaInventarioProvider);
    final tomaInventario = state.tomaInventario;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;

    final isTablet = screenWidth > 600;

    final titleFontSize = isTablet ? 18.0 : 16.0;
    final labelFontSize = isTablet ? 12.0 : 11.0;
    final valueFontSize = isTablet ? 14.0 : 12.0;
    final iconSize = isTablet ? 18.0 : 16.0;
    final smallIconSize = isTablet ? 16.0 : 14.0;
    final cardPadding = isTablet ? 12.0 : 8.0;
    final cardMargin = isTablet ? 6.0 : 4.0;

    if (tomaInventario == null) {
      return const SizedBox.shrink();
    }

    final fecha = state.fechaFormateada;
    final cantidadTotal = state.listaDetalleProducto.length;

    return Card(
      margin: EdgeInsets.all(cardMargin),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Icon(Icons.inventory_2,
                      color: primaryColor, size: iconSize),
                ),
                SizedBox(width: isTablet ? 6 : 4),
                Expanded(
                  child: Text(
                    'Toma de Inventario: ${tomaInventario.codigo}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: titleFontSize,
                      color: primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),

            Divider(height: isTablet ? 12 : 8, thickness: 0.5),

            isTablet
                ? _buildTabletLayout(tomaInventario, fecha, cantidadTotal,
                    labelFontSize, valueFontSize, smallIconSize)
                : _buildPhoneLayout(tomaInventario, fecha, cantidadTotal,
                    labelFontSize, valueFontSize, smallIconSize),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(
    dynamic tomaInventario,
    String fecha,
    int cantidadTotal,
    double labelFontSize,
    double valueFontSize,
    double iconSize,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('NOMBRE:', tomaInventario.nombre, Icons.store,
                  labelFontSize, valueFontSize, iconSize),
              const SizedBox(height: 8),
              _buildInfoRow('FECHA:', fecha, Icons.calendar_today,
                  labelFontSize, valueFontSize, iconSize),
              const SizedBox(height: 8),
              _buildInfoRow('PRODUCTOS:', cantidadTotal.toString(),
                  Icons.shopping_cart, labelFontSize, valueFontSize, iconSize),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                  'TIPO:',
                  tomaInventario.tipo,
                  Icons.type_specimen_rounded,
                  labelFontSize,
                  valueFontSize,
                  iconSize),
              const SizedBox(height: 8),
              _buildInfoRow('ESTADO:', tomaInventario.estado,
                  Icons.check_circle, labelFontSize, valueFontSize, iconSize),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneLayout(
    dynamic tomaInventario,
    String fecha,
    int cantidadTotal,
    double labelFontSize,
    double valueFontSize,
    double iconSize,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('NOMBRE:', tomaInventario.nombre, Icons.store,
            labelFontSize, valueFontSize, iconSize),
        const SizedBox(height: 6),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInfoRow('FECHA:', fecha, Icons.calendar_today,
                    labelFontSize, valueFontSize, iconSize),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoRow(
                    'PRODUCTOS:',
                    cantidadTotal.toString(),
                    Icons.shopping_cart,
                    labelFontSize,
                    valueFontSize,
                    iconSize),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInfoRow(
                    'TIPO:',
                    tomaInventario.tipo,
                    Icons.type_specimen_rounded,
                    labelFontSize,
                    valueFontSize,
                    iconSize),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoRow('ESTADO:', tomaInventario.estado,
                    Icons.check_circle, labelFontSize, valueFontSize, iconSize),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    IconData icon,
    double labelFontSize,
    double valueFontSize,
    double iconSize,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Icon(icon, size: iconSize, color: Colors.grey[600]),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: labelFontSize,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
