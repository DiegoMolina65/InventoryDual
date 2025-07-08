import 'package:flutter/material.dart';
import 'package:m_dual_inventario/shared/widgets/custom_showdialog/custom_showdialog_widget.dart';

class DialogoStepperHelper {
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
            '¿Seguro de salir de la creación de una nueva Toma de Inventario?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Si no guarda se perderán sus cambios.',
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
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'VOLVER',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () {
            salir = true;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
      ],
    );

    return salir;
  }

  static Future<bool> crearNuevaTomaInventarioDialogo(
      BuildContext context) async {
    bool guardar = false;
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'CREAR NUEVA TOMA DE INVENTARIO',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.add_circle_outline_rounded,
            size: 48,
            color: colorScheme.secondary,
          ),
          const SizedBox(height: 20),
          const Text(
            '¿Está seguro que desea crear la Nueva Toma de Inventario?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
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
}
