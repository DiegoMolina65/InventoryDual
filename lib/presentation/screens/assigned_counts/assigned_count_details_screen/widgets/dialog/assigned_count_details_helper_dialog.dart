import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/provider/assigned_count_details_provider.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/widgets/dialog/item_detalle_conteo_contar_view.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/validators_inputs.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class DialogoDetalleConteoHelper {
  static Future<bool> mostrarConfirmacionIniciarConteo(
    BuildContext context,
    String nombreToma,
    WidgetRef ref,
  ) async {
    if (!context.mounted) return false;
    bool iniciarConteo = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'INICIAR CONTEO',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.inventory_2_outlined,
            size: 48,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          Text(
            '¿Está seguro que desea iniciar el conteo para "$nombreToma"?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Una vez iniciado, podrá registrar las cantidades de los productos en el inventario.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () {
            iniciarConteo = false;
            if (context.mounted) context.pop();
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CONFIRMAR',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () async {
            iniciarConteo = true;
            if (context.mounted) context.pop();
            await ref
                .read(detalleConteoAsignadoProvider.notifier)
                .iniciarConteoInventario();
          },
        ),
      ],
    );

    return iniciarConteo;
  }

  static Future<void> mostrarContarProducto({
    required BuildContext context,
    required WidgetRef ref,
    required DetalleRecuentoInventario detalleConteo,
  }) async {
    final conteoNotifier = ref.read(detalleConteoAsignadoProvider.notifier);
    final puedeEditar = conteoNotifier.puedeEditarConteo();

    if (!puedeEditar) {
      _mostrarConteoFinalizado(context);
    }

    final conteoIniciado = conteoNotifier.verificarEstadoConteo();
    if (!conteoIniciado && puedeEditar) {
      final nombreToma = ref
              .read(detalleConteoAsignadoProvider)
              .conteoInventario
              ?.nombreTomaInventario ??
          '';

      final confirmar =
          await mostrarConfirmacionIniciarConteo(context, nombreToma, ref);
      if (!confirmar || !conteoNotifier.verificarEstadoConteo()) return;
    }

    final cantidadController = TextEditingController(
      text: detalleConteo.cantidadConteo > 0
          ? detalleConteo.cantidadConteo.toString()
          : '',
    );

    final descripcionNotifier = ValueNotifier<String>('');

    final formKey = GlobalKey<FormState>();
    if (!context.mounted) return;
    final colorScheme = Theme.of(context).colorScheme;

    if (!context.mounted) return;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'CONTAR PRODUCTO',
      content: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              detalleConteo.nombreProducto,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.qr_code, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Código: ${detalleConteo.codigoProducto}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            // TODO LRA: continua Lemuel
            // ItemDetalleConteoContarView(),
            ValueListenableBuilder<String>(
              valueListenable: descripcionNotifier,
              builder: (context, descripcionConteo, child) {
                if (descripcionConteo.isNotEmpty) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.blue.shade200, width: 1),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline,
                                color: Colors.blue.shade600, size: 18),
                            Expanded(
                              child: Text(
                                'Detalle: $descripcionConteo',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomTextformfield(
                    controller: cantidadController,
                    label: 'Cantidad contada',
                    hintText: 'Ingrese la cantidad',
                    prefixIcon: const Icon(Icons.numbers),
                    validator: ValidatorsInputs.validatePositiveNumber,
                    readOnly: !puedeEditar,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                    onChanged: (value) {
                      final cantidad = double.tryParse(value) ?? 0;

                      final productoActualizado = detalleConteo.copyWith(
                          cantidadConteo: cantidad,
                          fechaConteo: DateTime.now());

                      ref
                          .read(detalleConteoAsignadoProvider.notifier)
                          .actualizarProducto(productoActualizado);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorScheme.primary),
                    ),
                    child: Center(
                      child: Text(
                        detalleConteo.producto?.listaUnidadMedida
                                .firstWhere(
                                  (um) =>
                                      um.codigo ==
                                      detalleConteo.codigoUnidadMedida,
                                  orElse: () => detalleConteo
                                      .producto!.listaUnidadMedida.first,
                                )
                                .descripcion ??
                            'Vacio',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 58,
                    child: InkWell(
                      onTap: puedeEditar
                          ? () async {
                              final unidadMedida = detalleConteo
                                  .producto?.listaUnidadMedida
                                  .firstWhere(
                                (um) =>
                                    um.codigo ==
                                    detalleConteo.codigoUnidadMedida,
                                orElse: () => detalleConteo
                                    .producto!.listaUnidadMedida.first,
                              );
                              final cantidadActual =
                                  cantidadController.text.isEmpty
                                      ? 0.0
                                      : double.parse(cantidadController.text);
                              final result = await context
                                  .push('/assigned-count-unit-measure', extra: {
                                'producto': detalleConteo,
                                'cantidadActual': cantidadActual,
                                'unidadMedida': unidadMedida
                              });

                              if (result != null &&
                                  result is Map<String, dynamic>) {
                                final cantidad = result['cantidad'] as double;
                                final descripcion =
                                    result['descripcion'] as String;

                                cantidadController.text = cantidad.toString();
                                descripcionNotifier.value = descripcion;
                              }
                            }
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorScheme.primary),
                        ),
                        child: const Center(
                          child: Text(
                            'MÁS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () {
            descripcionNotifier.dispose();
            context.pop();
          },
        ),
        if (puedeEditar)
          CustomShowDialogHelper.createButtonShowDialog(
            text: 'CONFIRMAR',
            icon: Icons.check_rounded,
            backgroundColor: colorScheme.secondary,
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                final cantidad = double.tryParse(cantidadController.text) ?? 0;
                final productoActualizado = detalleConteo.copyWith(
                  cantidadConteo: cantidad,
                  fechaConteo: DateTime.now(),
                );

                await ref
                    .read(detalleConteoAsignadoProvider.notifier)
                    .actualizarProducto(
                      productoActualizado,
                      confirmar: true,
                    );

                if (context.mounted) {
                  descripcionNotifier.dispose();
                  context.pop();
                }
              }
            },
          ),
      ],
    );
  }

  static void _mostrarConteoFinalizado(BuildContext context) {
    CustomSnackBar.show(context,
        message: 'El conteo ya está finalizado y no puede ser modificado',
        type: SnackBarType.info);
  }

  static Future<bool> confirmarSalida(BuildContext context) async {
    if (!context.mounted) return false;

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
            '¿Seguro de salir del conteo?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'No se perderán sus cambios.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () {
            salir = false;
            if (context.mounted) {
              CustomShowDialogHelper.closeShowDialogo(context);
            }
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'VOLVER',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () {
            salir = true;
            if (context.mounted) {
              CustomShowDialogHelper.closeShowDialogo(context);
            }
          },
        ),
      ],
    );
    return salir;
  }

  static Future<bool> confirmarFinalizarConteo(
    BuildContext context,
    WidgetRef ref,
  ) async {
    bool debeGuardar = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'FINALIZAR CONTEO',
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Icon(
            Icons.check_circle_outline,
            size: 48,
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Text(
            '¿Está seguro que desea finalizar este conteo?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Una vez finalizado, el conteo no podrá ser modificado y todos los productos pendientes serán marcados como contados automáticamente.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () {
            debeGuardar = false;
            if (context.mounted) context.pop();
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CONFIRMAR',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () {
            debeGuardar = true;
            if (context.mounted) context.pop();
          },
        ),
      ],
    );

    return debeGuardar;
  }

  // static Future<List<LotesEntidad>?> seleccionarLotesConConteo(
  //     BuildContext context,
  //     List<LotesEntidad> lotes,
  //     DetalleRecuentoInventario detalleProducto,
  //     WidgetRef ref,
  //     {List<LotesEntidad>? lotesSeleccionados}) async {
  //   List<bool> seleccion = List<bool>.generate(
  //     lotes.length,
  //     (i) =>
  //         lotesSeleccionados?.any((l) => l.codigo == lotes[i].codigo) ?? false,
  //   );

  //   List<LotesEntidad>? resultado;

  //   final cantidadController = TextEditingController(
  //     text: detalleProducto.cantidadConteo > 0
  //         ? detalleProducto.cantidadConteo.toString()
  //         : '',
  //   );

  //   final descripcionNotifier = ValueNotifier<String>('');
  //   final formKey = GlobalKey<FormState>();

  //   String formatearFecha(dynamic fechaCompleta) {
  //     try {
  //       DateTime fecha;
  //       if (fechaCompleta is DateTime) {
  //         fecha = fechaCompleta;
  //       } else if (fechaCompleta is String) {
  //         fecha = DateTime.parse(fechaCompleta);
  //       } else {
  //         return fechaCompleta.toString();
  //       }
  //       return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  //     } catch (e) {
  //       return fechaCompleta.toString().split(' ')[0];
  //     }
  //   }

  //   final conteoNotifier = ref.read(detalleConteoAsignadoProvider.notifier);
  //   final puedeEditar = conteoNotifier.puedeEditarConteo();

  //   if (!context.mounted) return null;
  //   final colorScheme = Theme.of(context).colorScheme;

  //   await CustomShowDialogHelper.show(
  //     context: context,
  //     title: 'SELECCIONAR LOTES Y CONTAR',
  //     content: StatefulBuilder(
  //       builder: (ctx, setState) {
  //         return Form(
  //           key: formKey,
  //           child: Container(
  //             width: double.maxFinite,
  //             constraints: const BoxConstraints(maxHeight: 600),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 // Información del producto
  //                 Text(
  //                   detalleProducto.nombreProducto,
  //                   textAlign: TextAlign.center,
  //                   style: const TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black87,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 16),

  //                 // Código del producto
  //                 Container(
  //                   padding: const EdgeInsets.symmetric(
  //                       vertical: 12, horizontal: 16),
  //                   decoration: BoxDecoration(
  //                     color: Colors.grey.shade100,
  //                     borderRadius: BorderRadius.circular(8),
  //                     border: Border.all(color: Colors.grey.shade300, width: 1),
  //                   ),
  //                   child: Row(
  //                     children: [
  //                       Icon(Icons.qr_code, color: colorScheme.primary),
  //                       const SizedBox(width: 8),
  //                       Expanded(
  //                         child: Text(
  //                           'Código: ${detalleProducto.codigoProducto}',
  //                           style: const TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w600,
  //                             color: Colors.black87,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(height: 16),

  //                 // Descripción del conteo (si existe)
  //                 ValueListenableBuilder<String>(
  //                   valueListenable: descripcionNotifier,
  //                   builder: (context, descripcionConteo, child) {
  //                     if (descripcionConteo.isNotEmpty) {
  //                       return Column(
  //                         children: [
  //                           Container(
  //                             padding: const EdgeInsets.symmetric(
  //                                 vertical: 8, horizontal: 12),
  //                             decoration: BoxDecoration(
  //                               color: Colors.blue.shade50,
  //                               borderRadius: BorderRadius.circular(8),
  //                               border: Border.all(
  //                                   color: Colors.blue.shade200, width: 1),
  //                             ),
  //                             child: Row(
  //                               children: [
  //                                 Icon(Icons.info_outline,
  //                                     color: Colors.blue.shade600, size: 18),
  //                                 const SizedBox(width: 8),
  //                                 Expanded(
  //                                   child: Text(
  //                                     'Detalle: $descripcionConteo',
  //                                     style: TextStyle(
  //                                       fontSize: 14,
  //                                       color: Colors.blue.shade800,
  //                                       fontWeight: FontWeight.w500,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           const SizedBox(height: 16),
  //                         ],
  //                       );
  //                     }
  //                     return const SizedBox.shrink();
  //                   },
  //                 ),

  //                 // Input de cantidad con unidad de medida y botón MÁS
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Expanded(
  //                       flex: 3,
  //                       child: CustomTextformfield(
  //                         controller: cantidadController,
  //                         label: 'Cantidad contada',
  //                         hintText: 'Ingrese la cantidad',
  //                         prefixIcon: const Icon(Icons.numbers),
  //                         validator: ValidatorsInputs.validatePositiveNumber,
  //                         readOnly: !puedeEditar,
  //                         inputFormatters: [
  //                           FilteringTextInputFormatter.allow(
  //                               RegExp(r'^\d*\.?\d{0,2}')),
  //                         ],
  //                         onChanged: (value) {
  //                           final cantidad = double.tryParse(value) ?? 0;
  //                           final productoActualizado =
  //                               detalleProducto.copyWith(
  //                             cantidadConteo: cantidad,
  //                             fechaConteo: DateTime.now(),
  //                           );
  //                           ref
  //                               .read(detalleConteoAsignadoProvider.notifier)
  //                               .actualizarProducto(productoActualizado);
  //                         },
  //                       ),
  //                     ),
  //                     const SizedBox(width: 8),
  //                     Expanded(
  //                       flex: 1,
  //                       child: Container(
  //                         height: 58,
  //                         decoration: BoxDecoration(
  //                           color: colorScheme.primary,
  //                           borderRadius: BorderRadius.circular(10),
  //                           border: Border.all(color: colorScheme.primary),
  //                         ),
  //                         child: Center(
  //                           child: Text(
  //                             detalleProducto.producto?.listaUnidadMedida
  //                                     .firstWhere(
  //                                       (um) =>
  //                                           um.codigo ==
  //                                           detalleProducto.codigoUnidadMedida,
  //                                       orElse: () => detalleProducto
  //                                           .producto!.listaUnidadMedida.first,
  //                                     )
  //                                     .descripcion ??
  //                                 'Vacio',
  //                             style: const TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.white,
  //                               fontSize: 12,
  //                             ),
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 8),
  //                     Flexible(
  //                       flex: 1,
  //                       child: SizedBox(
  //                         height: 58,
  //                         child: InkWell(
  //                           onTap: puedeEditar
  //                               ? () async {
  //                                   final unidadMedida = detalleProducto
  //                                       .producto?.listaUnidadMedida
  //                                       .firstWhere(
  //                                     (um) =>
  //                                         um.codigo ==
  //                                         detalleProducto.codigoUnidadMedida,
  //                                     orElse: () => detalleProducto
  //                                         .producto!.listaUnidadMedida.first,
  //                                   );
  //                                   final cantidadActual = cantidadController
  //                                           .text.isEmpty
  //                                       ? 0.0
  //                                       : double.parse(cantidadController.text);
  //                                   final result = await context.push(
  //                                       '/assigned-count-unit-measure',
  //                                       extra: {
  //                                         'producto': detalleProducto,
  //                                         'cantidadActual': cantidadActual,
  //                                         'unidadMedida': unidadMedida
  //                                       });

  //                                   if (result != null &&
  //                                       result is Map<String, dynamic>) {
  //                                     final cantidad =
  //                                         result['cantidad'] as double;
  //                                     final descripcion =
  //                                         result['descripcion'] as String;
  //                                     cantidadController.text =
  //                                         cantidad.toString();
  //                                     descripcionNotifier.value = descripcion;
  //                                   }
  //                                 }
  //                               : null,
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               color: Colors.green,
  //                               borderRadius: BorderRadius.circular(10),
  //                               border: Border.all(color: colorScheme.primary),
  //                             ),
  //                             child: const Center(
  //                               child: Text(
  //                                 'MÁS',
  //                                 style: TextStyle(
  //                                   fontWeight: FontWeight.bold,
  //                                   color: Colors.white,
  //                                   fontSize: 12,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 16),

  //                 // Botones de selección todo/ninguno
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: ElevatedButton.icon(
  //                         onPressed: () {
  //                           setState(() {
  //                             seleccion = List<bool>.filled(lotes.length, true);
  //                           });
  //                         },
  //                         icon: const Icon(Icons.done_all, size: 18),
  //                         label: const Text('Todo',
  //                             style: TextStyle(fontWeight: FontWeight.w600)),
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: AppTheme.primaryColor,
  //                           foregroundColor: Colors.white,
  //                           padding: const EdgeInsets.symmetric(vertical: 12),
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(8)),
  //                           elevation: 2,
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 8),
  //                     Expanded(
  //                       child: OutlinedButton.icon(
  //                         onPressed: () {
  //                           setState(() {
  //                             seleccion =
  //                                 List<bool>.filled(lotes.length, false);
  //                           });
  //                         },
  //                         icon: const Icon(Icons.clear_all, size: 18),
  //                         label: const Text('Ninguno',
  //                             style: TextStyle(fontWeight: FontWeight.w600)),
  //                         style: OutlinedButton.styleFrom(
  //                           foregroundColor: AppTheme.primaryColor,
  //                           padding: const EdgeInsets.symmetric(vertical: 12),
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(8)),
  //                           side: BorderSide(color: AppTheme.primaryColor),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 12),

  //                 // Contador de selección
  //                 Container(
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //                   decoration: BoxDecoration(
  //                     color: AppTheme.successColor.withOpacity(0.1),
  //                     borderRadius: BorderRadius.circular(8),
  //                     border: Border.all(
  //                         color: AppTheme.successColor.withOpacity(0.3)),
  //                   ),
  //                   child: Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Icon(Icons.check_circle,
  //                           size: 16, color: AppTheme.successColor),
  //                       const SizedBox(width: 8),
  //                       Text(
  //                         '${seleccion.where((s) => s).length} de ${lotes.length} lotes seleccionados',
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           fontWeight: FontWeight.w600,
  //                           color: AppTheme.successColor,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(height: 12),

  //                 // Lista de lotes
  //                 Flexible(
  //                   child: ListView.builder(
  //                     shrinkWrap: true,
  //                     itemCount: lotes.length,
  //                     itemBuilder: (_, i) {
  //                       final lote = lotes[i];
  //                       return Card(
  //                         margin: const EdgeInsets.only(bottom: 8),
  //                         elevation: seleccion[i] ? 3 : 1,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(12),
  //                           side: BorderSide(
  //                             color: seleccion[i]
  //                                 ? AppTheme.primaryColor.withOpacity(0.5)
  //                                 : Colors.grey.shade200,
  //                             width: seleccion[i] ? 2 : 1,
  //                           ),
  //                         ),
  //                         child: InkWell(
  //                           onTap: () =>
  //                               setState(() => seleccion[i] = !seleccion[i]),
  //                           borderRadius: BorderRadius.circular(12),
  //                           child: Container(
  //                             padding: const EdgeInsets.all(16),
  //                             decoration: BoxDecoration(
  //                               color: seleccion[i]
  //                                   ? AppTheme.primaryColor.withOpacity(0.05)
  //                                   : Colors.transparent,
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Row(
  //                                   children: [
  //                                     Expanded(
  //                                       child: Text(
  //                                         'Lote: ${lote.codigo}',
  //                                         style: TextStyle(
  //                                           fontWeight: FontWeight.bold,
  //                                           fontSize: 16,
  //                                           color: seleccion[i]
  //                                               ? AppTheme.primaryColor
  //                                               : Colors.black87,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                     if (seleccion[i])
  //                                       Container(
  //                                         padding: const EdgeInsets.all(4),
  //                                         decoration: BoxDecoration(
  //                                           color: AppTheme.primaryColor,
  //                                           borderRadius:
  //                                               BorderRadius.circular(12),
  //                                         ),
  //                                         child: const Icon(
  //                                           Icons.check,
  //                                           color: Colors.white,
  //                                           size: 16,
  //                                         ),
  //                                       ),
  //                                   ],
  //                                 ),
  //                                 const SizedBox(height: 8),
  //                                 Row(
  //                                   children: [
  //                                     Icon(Icons.calendar_today,
  //                                         size: 16,
  //                                         color: Colors.grey.shade600),
  //                                     const SizedBox(width: 8),
  //                                     Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         const Text(
  //                                           'Fecha de Expiración',
  //                                           style: TextStyle(
  //                                             fontSize: 11,
  //                                             color: Colors.grey,
  //                                             fontWeight: FontWeight.w500,
  //                                           ),
  //                                         ),
  //                                         Text(
  //                                           formatearFecha(
  //                                               lote.fechaExpiracion),
  //                                           style: const TextStyle(
  //                                             fontSize: 14,
  //                                             fontWeight: FontWeight.w600,
  //                                             color: Colors.black87,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     const Spacer(),
  //                                     Icon(Icons.inventory_2,
  //                                         size: 16,
  //                                         color: AppTheme.primaryColor),
  //                                     const SizedBox(width: 8),
  //                                     Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         const Text(
  //                                           'Stock Disponible',
  //                                           style: TextStyle(
  //                                             fontSize: 11,
  //                                             color: Colors.grey,
  //                                             fontWeight: FontWeight.w500,
  //                                           ),
  //                                         ),
  //                                         Text(
  //                                           '${lote.stock.toStringAsFixed(2)} UND',
  //                                           style: const TextStyle(
  //                                             fontSize: 14,
  //                                             fontWeight: FontWeight.bold,
  //                                             color: Colors.black87,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //     actions: [
  //       CustomShowDialogHelper.createButtonShowDialog(
  //         text: 'CANCELAR',
  //         isOutlined: true,
  //         icon: Icons.close_rounded,
  //         backgroundColor: AppTheme.dangerColor,
  //         onPressed: () {
  //           descripcionNotifier.dispose();
  //           resultado = null;
  //           CustomShowDialogHelper.closeShowDialogo(context);
  //         },
  //       ),
  //       if (puedeEditar)
  //         CustomShowDialogHelper.createButtonShowDialog(
  //           text: 'CONFIRMAR',
  //           icon: Icons.check_rounded,
  //           backgroundColor: AppTheme.successColor,
  //           onPressed: () async {
  //             if (formKey.currentState?.validate() ?? false) {
  //               final cantidad = double.tryParse(cantidadController.text) ?? 0;
  //               final productoActualizado = detalleProducto.copyWith(
  //                 cantidadConteo: cantidad,
  //                 fechaConteo: DateTime.now(),
  //               );

  //               await ref
  //                   .read(detalleConteoAsignadoProvider.notifier)
  //                   .actualizarProducto(productoActualizado, confirmar: true);

  //               resultado = [
  //                 for (var i = 0; i < lotes.length; i++)
  //                   if (seleccion[i]) lotes[i]
  //               ];

  //               if (context.mounted) {
  //                 descripcionNotifier.dispose();
  //                 CustomShowDialogHelper.closeShowDialogo(context);
  //               }
  //             }
  //           },
  //         ),
  //     ],
  //   );

  //   return resultado;
  // }
}
