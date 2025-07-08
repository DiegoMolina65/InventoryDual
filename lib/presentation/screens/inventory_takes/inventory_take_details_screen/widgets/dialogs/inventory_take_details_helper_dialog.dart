import 'package:flutter/material.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class DialogoDetalleTomaInventarioHelper {
  static Future<bool> confirmarSalida(BuildContext context) async {
    bool salir = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'SALIR',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.warning_amber_rounded,
            size: 48,
            color: Colors.amber[700],
          ),
          const SizedBox(height: 20),
          const Text(
            '¿Seguro de salir de la Toma de Inventario?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Si no guarda se perderán sus cambios.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () async {
            salir = false;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'VOLVER',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () async {
            salir = true;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
      ],
    );

    return salir;
  }

  static Future<bool> confirmarGuardarTomaInventario(
      BuildContext context) async {
    bool guardar = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'GUARDAR CAMBIOS',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.save_rounded,
            size: 48,
            color: colorScheme.secondary,
          ),
          const SizedBox(height: 20),
          const Text(
            '¿Seguro de guardar los cambios?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Se guardaran los cambios en la toma de inventario.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'NO',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () {
            guardar = false;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'SÍ',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () {
            guardar = true;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
      ],
    );

    return guardar;
  }

  static Future<bool> confirmarEliminarProducto(
      BuildContext context, String nombreProducto) async {
    bool confirmar = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'ELIMINAR PRODUCTO',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.delete_forever_rounded,
            size: 48,
            color: colorScheme.error,
          ),
          const SizedBox(height: 20),
          const Text(
            '¿Está seguro de eliminar el producto?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Text(
              nombreProducto,
              // listaDetalleProducto.producto.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'El producto será eliminado de la toma de inventario actual.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          const Text(
            'Esta acción no se puede deshacer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          backgroundColor: colorScheme.error,
          onPressed: () {
            confirmar = false;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
          isOutlined: true,
          icon: Icons.close_rounded,
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'ELIMINAR',
          backgroundColor: colorScheme.secondary,
          onPressed: () {
            confirmar = true;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
          icon: Icons.delete_outline_rounded,
        ),
      ],
    );

    return confirmar;
  }

  static Future<void> mostrarLotesDeProducto(
    BuildContext context,
    List<LotesEntidad> lotes,
    String nombreProducto,
  ) async {
    String formatearFecha(dynamic fechaCompleta) {
      try {
        DateTime fecha;
        if (fechaCompleta is DateTime) {
          fecha = fechaCompleta;
        } else if (fechaCompleta is String) {
          fecha = DateTime.parse(fechaCompleta);
        } else {
          return fechaCompleta.toString();
        }
        return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
      } catch (e) {
        return fechaCompleta.toString().split(' ')[0];
      }
    }

    bool isProximoVencer(DateTime fecha) {
      final dias = fecha.difference(DateTime.now()).inDays;
      return dias <= 30 && dias >= 0;
    }

    bool isVencido(DateTime fecha) => fecha.isBefore(DateTime.now());

    Color statusColor(DateTime fecha) {
      if (isVencido(fecha)) return Colors.red;
      if (isProximoVencer(fecha)) return Colors.orange;
      return Colors.green;
    }

    await CustomShowDialogHelper.show(
      context: context,
      title: 'Lotes de $nombreProducto',
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(maxHeight: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            lotes.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 48,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No hay lotes asociados a este producto.',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  )
                : Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: lotes.length,
                      itemBuilder: (_, i) {
                        final lote = lotes[i];
                        final fecha = lote.fechaExpiracion;
                        final color = statusColor(fecha);
                        return Card(
                          margin: const EdgeInsets.only(bottom: 6),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Lote: ${lote.codigo}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black87)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: color.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: color.withOpacity(0.3)),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: color,
                                                  shape: BoxShape.circle)),
                                          const SizedBox(width: 5),
                                          Text(
                                            isVencido(fecha)
                                                ? 'Vencido'
                                                : isProximoVencer(fecha)
                                                    ? 'Próximo'
                                                    : 'Vigente',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: color),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today,
                                        size: 16, color: color),
                                    const SizedBox(width: 6),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Fecha de Expiración',
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            formatearFecha(
                                                lote.fechaExpiracion),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: color)),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.inventory_2,
                                        size: 16, color: AppTheme.primaryColor),
                                    const SizedBox(width: 6),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Stock Disponible',
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            '${lote.stock.toStringAsFixed(2)} UND',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CERRAR',
          backgroundColor: Colors.red,
          onPressed: () {
            CustomShowDialogHelper.closeShowDialogo(context);
          },
          icon: Icons.check_circle_outline,
        ),
      ],
    );
  }
}
