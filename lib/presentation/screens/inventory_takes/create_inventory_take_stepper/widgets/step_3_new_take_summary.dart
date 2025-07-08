import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/screens_export.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/provider/inventory_take_details_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/provider/create_inventory_stepper_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/widgets/dialogs/stepper_dialogs.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/provider/inventory_screen_provider.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class StepTercerPasoResumenNuevaToma extends ConsumerWidget {
  const StepTercerPasoResumenNuevaToma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detalleState = ref.watch(detalleTomaInventarioProvider);
    final stepperState = ref.watch(stepperCrearTomaInventarioProvider);
    final count = detalleState.listaDetalleProducto.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumen de la Toma de Inventario',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoCard(context, [
            _buildInfoRow('Nombre', stepperState.nombreToma,
                Icons.description_outlined, context),
            const Divider(height: 24),
            _buildInfoRow(
                'Almacén',
                stepperState.almacenSeleccionado?.nombre ?? 'No seleccionado',
                Icons.warehouse_outlined,
                context),
            const Divider(height: 24),
            _buildInfoRow('Productos agregados', count.toString(),
                Icons.inventory_2_outlined, context),
          ]),
          const SizedBox(height: 40),
          _buildCreateButton(context, ref, count),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      String label, String value, IconData icon, BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: primaryColor),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context, WidgetRef ref, int count) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () => _crearTomaInventario(context, ref, count),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, size: 20),
              SizedBox(width: 10),
              Text(
                'CREAR NUEVA TOMA DE INVENTARIO',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _crearTomaInventario(
      BuildContext context, WidgetRef ref, int count) async {
    if (count <= 0) {
      CustomSnackBar.show(context,
          message:
              'Debe agregar al menos 1 producto para guardar la toma de inventario',
          type: SnackBarType.warning);
      return;
    }

    final detalleProvider = ref.read(detalleTomaInventarioProvider);
    final stepperNotifier =
        ref.read(stepperCrearTomaInventarioProvider.notifier);

    stepperNotifier.sincronizarProductos(detalleProvider.listaDetalleProducto);

    final guardar =
        await DialogoStepperHelper.crearNuevaTomaInventarioDialogo(context);
    if (guardar) {
      await stepperNotifier.guardarCambiosStepper();
      await ref
          .read(tomasInventarioScreenProvider.notifier)
          .refrescarTomasInventario()
          .ejecutar();

      if (context.mounted) {
        context.go(TomasInventarioScreen.name, extra: {'refresh': true});
      }
      stepperNotifier.resetStepper();
    }
  }
}
