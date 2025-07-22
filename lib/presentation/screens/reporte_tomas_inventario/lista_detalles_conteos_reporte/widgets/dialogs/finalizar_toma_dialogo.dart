import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class ValidationResult {
  final int totalProductos;
  final int correctos;
  final int conDiferencia;
  final int sinConteo;
  final bool todosCorrectos;

  ValidationResult({
    required this.totalProductos,
    required this.correctos,
    required this.conDiferencia,
    required this.sinConteo,
    required this.todosCorrectos,
  });
}

class DialogoDetalleReporteHelper {
  static Future<bool> confirmarFinalizarToma(
    BuildContext context,
    WidgetRef ref,
  ) async {
    bool debeGuardar = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'FINALIZAR TOMA DE INVENTARIO',
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
            '¿Está seguro que desea finalizar esta toma de inventario?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Una vez finalizado, la toma inventario no podrá ser modificada y todos los conteos serán marcados como finalizados automáticamente.',
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

  static Future<void> mostrarErrorValidacion(
    BuildContext context,
    ValidationResult result,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'NO SE PUEDE FINALIZAR',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.warning_amber_rounded,
            size: 48,
            color: Colors.orange.shade600,
          ),
          const SizedBox(height: 20),
          const Text(
            'Para finalizar la toma de inventario, todos los productos deben estar en estado "Correcto".',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Revise los productos con diferencias o sin conteo antes de continuar.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          _buildEstadoResumen(result),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'ENTENDIDO',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.primary,
          onPressed: () {
            if (context.mounted) context.pop();
          },
        ),
      ],
    );
  }

  static Widget _buildEstadoResumen(ValidationResult result) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estado actual de productos:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 12),
          _buildEstadoItem(
            'Total de productos',
            result.totalProductos,
            Colors.blue,
            Icons.inventory_2,
          ),
          const SizedBox(height: 8),
          if (result.correctos > 0)
            _buildEstadoItem(
              'Correctos',
              result.correctos,
              Colors.green,
              Icons.check_circle,
            ),
          if (result.correctos > 0) const SizedBox(height: 8),
          if (result.conDiferencia > 0)
            _buildEstadoItem(
              'Con diferencia',
              result.conDiferencia,
              Colors.orange,
              Icons.warning,
            ),
          if (result.conDiferencia > 0) const SizedBox(height: 8),
          if (result.sinConteo > 0)
            _buildEstadoItem(
              'Sin conteo',
              result.sinConteo,
              Colors.blue,
              Icons.hourglass_empty,
            ),
        ],
      ),
    );
  }

  static Widget _buildEstadoItem(
      String label, int cantidad, Color color, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            cantidad.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
