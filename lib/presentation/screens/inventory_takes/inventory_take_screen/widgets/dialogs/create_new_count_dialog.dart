import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/provider/inventory_screen_provider.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class DialogoCrearNuevoConteo {
  static Future<void> mostrarDialogo(
    BuildContext context,
    int codigoToma,
  ) async {
    final container = ProviderScope.containerOf(context);
    final notifier = container.read(tomasInventarioScreenProvider.notifier);

    final resultado = await notifier.prepararNuevoConteo(codigoToma).ejecutar();
    if (!context.mounted) return;

    final tomaInventario = resultado['tomaInventario'];
    final usuarios = resultado['usuarios'] as List<Usuario>;
    Usuario? usuarioSeleccionado = usuarios.first;

    final seleccion = await _mostrarDialogoCrearNuevoConteo(
      context,
      usuarios,
      usuarioSeleccionado,
      tomaInventario.listaDetalleProducto?.length ?? 0,
    );

    if (seleccion != null &&
        seleccion['confirmar'] == true &&
        context.mounted) {
      final usuarioAsignado = seleccion['usuario'] as Usuario;

      await notifier
          .crearNuevoConteo(
            codigoTomaInventario: codigoToma,
            codigoAlmacen: tomaInventario.codigoAlmacen,
            codigoUsuarioAsignado: usuarioAsignado.codigo,
          )
          .ejecutar();

      notifier.refrescarTomasInventario();
    }
  }

  static Future<Map<String, dynamic>?> _mostrarDialogoCrearNuevoConteo(
    BuildContext context,
    List<Usuario> usuarios,
    Usuario? usuarioSeleccionado,
    int cantidadProductos,
  ) async {
    Map<String, dynamic>? resultado;
    final colorScheme = Theme.of(context).colorScheme;
    await CustomShowDialogHelper.show(
      context: context,
      title: 'ASIGNAR NUEVO CONTEO',
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Icon(
                Icons.assignment_turned_in_rounded,
                size: 48,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 20),
              const Text(
                'Asignar un nuevo conteo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Seleccione el responsable del conteo de inventario.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              CustomDropdownField<Usuario>(
                label: 'Responsable del conteo',
                value: usuarioSeleccionado,
                items: usuarios,
                getLabel: (usuario) => usuario.nombre,
                onChanged: (value) {
                  setState(() {
                    usuarioSeleccionado = value;
                  });
                },
                primaryColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.inventory_2_rounded, color: colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Productos a contar: $cantidadProductos',
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
              const SizedBox(height: 12),
              const Text(
                'Se asignará el conteo de todos los productos al usuario seleccionado.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () {
            resultado = null;
            CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CONFIRMAR',
          icon: Icons.check_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () {
            if (usuarioSeleccionado != null) {
              resultado = {
                'confirmar': true,
                'usuario': usuarioSeleccionado,
              };
              CustomShowDialogHelper.closeShowDialogo(context);
            }
          },
        ),
      ],
    );

    return resultado;
  }
}
