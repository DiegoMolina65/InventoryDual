import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/provider/assigned_count_details_provider.dart';
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

    final tieneLotes = detalleConteo.producto != null &&
        detalleConteo.producto!.listaLotes != null &&
        detalleConteo.producto!.listaLotes!.isNotEmpty;

    if (!context.mounted) return;
    final colorScheme = Theme.of(context).colorScheme;

    if (tieneLotes) {
      await _mostrarContarProductoConLotes(
        context: context,
        ref: ref,
        detalleConteo: detalleConteo,
        colorScheme: colorScheme,
        puedeEditar: puedeEditar,
      );
    } else {
      await _mostrarContarProductoSinLotes(
        context: context,
        ref: ref,
        detalleConteo: detalleConteo,
        colorScheme: colorScheme,
        puedeEditar: puedeEditar,
      );
    }
  }

  static Future<void> _mostrarContarProductoSinLotes({
    required BuildContext context,
    required WidgetRef ref,
    required DetalleRecuentoInventario detalleConteo,
    required ColorScheme colorScheme,
    required bool puedeEditar,
  }) async {
    final cantidadController = TextEditingController(
      text: detalleConteo.cantidadConteo > 0
          ? detalleConteo.cantidadConteo.toString()
          : '',
    );

    final descripcionNotifier = ValueNotifier<String>('');
    final formKey = GlobalKey<FormState>();

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
                    label: 'Ingrese la cantidad',
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

  static Future<void> _mostrarContarProductoConLotes({
    required BuildContext context,
    required WidgetRef ref,
    required DetalleRecuentoInventario detalleConteo,
    required ColorScheme colorScheme,
    required bool puedeEditar,
  }) async {
    final formKey = GlobalKey<FormState>();
    final lotes = detalleConteo.producto?.listaLotes ?? [];

    final Map<String, TextEditingController> controladores = {};
    final Map<String, ValueNotifier<String>> descripcionNotifiers = {};
    final Map<String, DetalleRecuentoInventario> estadoLotes = {};

    for (final lote in lotes) {
      final codigoLote = lote.codigo;

      final cantidadExistente = lote.cantidad;

      controladores[codigoLote] = TextEditingController(
        text: cantidadExistente > 0 ? cantidadExistente.toString() : '',
      );
      descripcionNotifiers[codigoLote] = ValueNotifier<String>('');

      estadoLotes[codigoLote] = detalleConteo.copyWith(
        codigoLote: codigoLote,
        cantidadConteo: cantidadExistente,
      );
    }

    await CustomShowDialogHelper.show(
      context: context,
      title: 'CONTAR PRODUCTO CON LOTES',
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
            const SizedBox(height: 16),
            Text(
              'Lotes disponibles:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            // Lista de lotes
            Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: SingleChildScrollView(
                child: Column(
                  children: lotes.map((lote) {
                    final codigoLote = lote.codigo;
                    final controller = controladores[codigoLote]!;
                    final descripcionNotifier =
                        descripcionNotifiers[codigoLote]!;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Información del lote
                          Row(
                            children: [
                              Icon(Icons.label,
                                  color: colorScheme.primary, size: 18),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'Lote: ${lote.codigo}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.orange, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                'Venc: ${DateFormat('dd/MM/yyyy').format(lote.fechaExpiracion)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ValueListenableBuilder<String>(
                            valueListenable: descripcionNotifier,
                            builder: (context, descripcionConteo, child) {
                              if (descripcionConteo.isNotEmpty) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Colors.blue.shade200,
                                            width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.info_outline,
                                              color: Colors.blue.shade600,
                                              size: 16),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              'Detalle: $descripcionConteo',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue.shade800,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
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
                                  controller: controller,
                                  label: 'Ingrese la cantidad',
                                  prefixIcon:
                                      const Icon(Icons.numbers, size: 18),
                                  validator:
                                      ValidatorsInputs.validatePositiveNumber,
                                  readOnly: !puedeEditar,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d{0,2}')),
                                  ],
                                  onChanged: (value) {
                                    final cantidad =
                                        double.tryParse(value) ?? 0;
                                    estadoLotes[codigoLote] =
                                        estadoLotes[codigoLote]!.copyWith(
                                      cantidadConteo: cantidad,
                                      fechaConteo: DateTime.now(),
                                    );
                                    ref
                                        .read(detalleConteoAsignadoProvider
                                            .notifier)
                                        .actualizarCantidadLoteProducto(
                                          codigoConteo: ref
                                              .read(
                                                  detalleConteoAsignadoProvider)
                                              .conteoInventario!
                                              .codigo,
                                          codigoProducto:
                                              detalleConteo.codigoProducto,
                                          codigoLote: codigoLote,
                                          nuevaCantidad: cantidad,
                                          confirmar: false,
                                        );
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
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: colorScheme.primary),
                                  ),
                                  child: Center(
                                    child: Text(
                                      detalleConteo.producto?.listaUnidadMedida
                                              .firstWhere(
                                                (um) =>
                                                    um.codigo ==
                                                    detalleConteo
                                                        .codigoUnidadMedida,
                                                orElse: () => detalleConteo
                                                    .producto!
                                                    .listaUnidadMedida
                                                    .first,
                                              )
                                              .descripcion ??
                                          'Vacio',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
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
                                                  detalleConteo
                                                      .codigoUnidadMedida,
                                              orElse: () => detalleConteo
                                                  .producto!
                                                  .listaUnidadMedida
                                                  .first,
                                            );
                                            final cantidadActual = controller
                                                    .text.isEmpty
                                                ? 0.0
                                                : double.parse(controller.text);
                                            final result = await context.push(
                                                '/assigned-count-unit-measure',
                                                extra: {
                                                  'producto':
                                                      estadoLotes[codigoLote]!,
                                                  'cantidadActual':
                                                      cantidadActual,
                                                  'unidadMedida': unidadMedida
                                                });

                                            if (result != null &&
                                                result
                                                    is Map<String, dynamic>) {
                                              final cantidad =
                                                  result['cantidad'] as double;
                                              final descripcion =
                                                  result['descripcion']
                                                      as String;

                                              controller.text =
                                                  cantidad.toString();
                                              descripcionNotifier.value =
                                                  descripcion;
                                              estadoLotes[codigoLote] =
                                                  estadoLotes[codigoLote]!
                                                      .copyWith(
                                                cantidadConteo: cantidad,
                                                fechaConteo: DateTime.now(),
                                              );
                                            }
                                          }
                                        : null,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: colorScheme.primary),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'MÁS',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
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
            for (final notifier in descripcionNotifiers.values) {
              notifier.dispose();
            }
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
                // Procesar cada lote usando su estado específico
                for (final lote in lotes) {
                  final codigoLote = lote.codigo;
                  final controller = controladores[codigoLote]!;
                  final cantidad = double.tryParse(controller.text) ?? 0;

                  await ref
                      .read(detalleConteoAsignadoProvider.notifier)
                      .actualizarCantidadLoteProducto(
                        codigoConteo: ref
                            .read(detalleConteoAsignadoProvider)
                            .conteoInventario!
                            .codigo,
                        codigoProducto: detalleConteo.codigoProducto,
                        codigoLote: codigoLote,
                        nuevaCantidad: cantidad,
                        confirmar: true,
                      );
                }

                if (context.mounted) {
                  for (final notifier in descripcionNotifiers.values) {
                    notifier.dispose();
                  }
                  context.pop();
                }
              }
            },
          ),
      ],
    );
  }

  static void _mostrarConteoFinalizado(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        CustomSnackBar.show(context,
            message: 'El conteo ya está finalizado y no puede ser modificado',
            type: SnackBarType.info);
      }
    });
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
}
