import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/provider/product_search_provider.dart';
import 'package:m_dual_inventario/presentation/screens/login/provider/auth_provider.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/number_extensions.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class DialogoBusquedaProductoHelper {
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
            '¿Seguro de salir de Agregar Producto?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Si no guarda, se perderán los productos seleccionados.',
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

  static Future<bool> confirmarAgregarProductos(
    BuildContext context,
    int cantidadSeleccionados,
  ) async {
    if (cantidadSeleccionados == 0) return false;

    bool confirmar = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'CONFIRMAR',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.add_shopping_cart_rounded,
            size: 48,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          Text(
            '¿Desea agregar los $cantidadSeleccionados productos seleccionados?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Estos productos se agregarán a la toma actual.',
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
          onPressed: () async {
            confirmar = false;
            await CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'SÍ',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () async {
            confirmar = true;
            await CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
      ],
    );

    return confirmar;
  }

  static Future<List<LotesEntidad>?> seleccionarLotes(
      BuildContext context, WidgetRef ref, List<LotesEntidad> lotes,
      {List<LotesEntidad>? lotesSeleccionados}) async {
    final filtrarStockCero =
        ref.read(busquedaProductoProvider).filtrarStockCero;

    final lotesAMostrar = filtrarStockCero
        ? lotes.where((lote) => lote.stock > 0.00).toList()
        : lotes;

    List<bool> seleccion = List<bool>.generate(
      lotesAMostrar.length,
      (i) =>
          lotesSeleccionados?.any((l) => l.codigo == lotesAMostrar[i].codigo) ??
          true,
    );

    List<LotesEntidad>? resultado;
    final user = ref.watch(authProvider).usuario;

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
      title: 'Seleccionar Lotes',
      content: StatefulBuilder(
        builder: (ctx, setState) {
          return Container(
            width: double.maxFinite,
            constraints: const BoxConstraints(maxHeight: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            seleccion = List<bool>.filled(lotes.length, true);
                          });
                        },
                        icon: const Icon(Icons.done_all, size: 18),
                        label: const Text('Todo',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            seleccion = List<bool>.filled(lotes.length, false);
                          });
                        },
                        icon: const Icon(Icons.clear_all, size: 18),
                        label: const Text('Ninguno',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: AppTheme.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: AppTheme.successColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle,
                          size: 16, color: AppTheme.successColor),
                      const SizedBox(width: 8),
                      Text(
                        '${seleccion.where((s) => s).length} de ${lotes.length} lotes seleccionados',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.successColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: lotesAMostrar.length,
                    itemBuilder: (_, i) {
                      final lote = lotesAMostrar[i];
                      final fecha = lote.fechaExpiracion;
                      final color = statusColor(fecha);
                      return Card(
                        margin: const EdgeInsets.only(bottom: 6),
                        elevation: seleccion[i] ? 3 : 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: seleccion[i]
                                ? AppTheme.primaryColor.withOpacity(0.5)
                                : Colors.grey.shade200,
                            width: seleccion[i] ? 2 : 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () =>
                              setState(() => seleccion[i] = !seleccion[i]),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: seleccion[i]
                                            ? AppTheme.primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: seleccion[i]
                                              ? AppTheme.primaryColor
                                              : Colors.grey.shade400,
                                          width: 2,
                                        ),
                                      ),
                                      child: seleccion[i]
                                          ? const Icon(Icons.check,
                                              color: Colors.white, size: 16)
                                          : null,
                                    ),
                                    const SizedBox(width: 5),
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
                                (user?.esSupervisor ?? false)
                                    ? Row(
                                        children: [
                                          Icon(Icons.inventory_2,
                                              size: 16,
                                              color: AppTheme.primaryColor),
                                          const SizedBox(width: 6),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Stock Disponible',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text(
                                                  lote.stock
                                                      .toStringDecimal('UND'),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: AppTheme.dangerColor,
          onPressed: () {
            resultado = null;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CONFIRMAR',
          icon: Icons.check_rounded,
          backgroundColor: AppTheme.successColor,
          onPressed: () {
            resultado = [
              for (var i = 0; i < lotesAMostrar.length; i++)
                if (seleccion[i]) lotesAMostrar[i]
            ];
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
      ],
    );
    return resultado;
  }
}
