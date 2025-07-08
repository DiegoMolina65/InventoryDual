import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/provider/inventory_screen_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/inventory_take_screen.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/widgets/dialogs/create_new_count_dialog.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class DialogoOpcionesTomaInventario {
  static Future<void> mostrar(BuildContext context, String codigoToma,
      String estado, String nombreToma) async {
    final colorScheme = Theme.of(context).colorScheme;

    await CustomShowDialogHelper.show(
      context: context,
      title: 'OPCIONES DE TOMA DE INVENTARIO',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.assignment_rounded,
            size: 48,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          Text(
            'CODIGO / #$codigoToma',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 5),
          Text(
            'NOMBRE / $nombreToma',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: estado.toUpperCase() == 'PENDIENTE'
                  ? const Color(0xFFF8D7DA)
                  : const Color(0xFFD4EDDA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'ESTADO / ${estado.toUpperCase()}',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: estado.toUpperCase() == 'PENDIENTE'
                      ? const Color(0xFF721C24)
                      : Colors.green),
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            'Seleccione una opción para continuar:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          // Opciones
          if (estado.toUpperCase() == 'PENDIENTE')
            _buildOpcion(
              context: context,
              icon: Icons.edit_rounded,
              title: 'EDITAR TOMA DE INVENTARIO',
              subtitle: 'Modifique los detalles de esta toma',
              onTap: () async {
                CustomShowDialogHelper.closeShowDialogo(context);
                Future.microtask(() {
                  navegarAEditarToma(context, codigoToma);
                });
              },
            ),
          _buildOpcion(
            context: context,
            icon: Icons.add_chart,
            title: 'ASIGNAR UN NUEVO CONTEO',
            subtitle: 'Agregue un conteo adicional a esta toma',
            onTap: () async {
              CustomShowDialogHelper.closeShowDialogo(context);
              if (!context.mounted) return;
              DialogoCrearNuevoConteo.mostrarDialogo(
                context,
                int.parse(codigoToma),
              );
            },
          ),
          _buildOpcion(
            context: context,
            icon: Icons.content_copy_rounded,
            title: 'NUEVA TOMA DE INVENTARIO',
            subtitle: 'Cree una nueva toma basada en esta',
            onTap: () async {
              CustomShowDialogHelper.closeShowDialogo(context);
              if (!context.mounted) return;
              crearNuevaTomaAPartirDeEsta(context, int.parse(codigoToma));
            },
          ),
        ],
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CERRAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () async {
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
      ],
    );
  }

  static Widget _buildOpcion({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
    Color? color,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Icon(icon, color: color ?? primaryColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color ?? Colors.black87,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  static void navegarAEditarToma(BuildContext context, String codigoToma) {
    Future(() {
      return int.parse(codigoToma);
    }).then((_) {
      if (context.mounted) {
        context.go(
          '${TomasInventarioScreen.name}/editar-toma-inventario/$codigoToma',
        );
      }
    });
  }

  static void crearNuevaTomaAPartirDeEsta(
      BuildContext context, int codigoToma) async {
    final ref = ProviderScope.containerOf(context);
    final tomasProvider = ref.read(tomasInventarioScreenProvider.notifier);

    final nuevaToma = await tomasProvider
        .nuevaTomaInventarioAPartirDeTomaExistente(codigoToma)
        .ejecutar();

    if (context.mounted) {
      context.go('${TomasInventarioScreen.name}/detalle/0',
          extra: {'nuevaToma': nuevaToma, 'esNuevaToma': true});
    }
  }
}
