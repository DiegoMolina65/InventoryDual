import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/screens_export.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/provider/create_inventory_stepper_provider.dart';

class StepSegundoPasoAnadirProducto extends ConsumerWidget {
  const StepSegundoPasoAnadirProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.9,
      child: DetalleTomaInventarioScreen(
        nuevaTomaInventario:
            ref.read(stepperCrearTomaInventarioProvider).nuevaTomaInventario,
        esNuevaToma: true,
        mostrarFloatingButton: false,
        mostrarAppBar: false,
      ),
    );
  }
}
