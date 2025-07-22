import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/create_inventory_stepper_screen.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/provider/inventory_screen_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/widgets/inventory_list_widget.dart';
import 'package:m_dual_inventario/shared/widgets/custom_filters/custom_filters_provider.dart';
import 'package:m_dual_inventario/shared/widgets/custom_filters/custom_filters_widget.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class TomasInventarioScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extra;

  const TomasInventarioScreen({super.key, this.extra});
  static const name = '/tomas-inventario';

  @override
  ConsumerState<TomasInventarioScreen> createState() =>
      _TomasInventarioScreenState();
}

class _TomasInventarioScreenState extends ConsumerState<TomasInventarioScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inicializarPantalla();
    });
  }

  void _inicializarPantalla() async {
    try {
      final tomasProviderNotifier =
          ref.read(tomasInventarioScreenProvider.notifier);

      int? codigoAlmacenSeleccionado;
      if (widget.extra != null &&
          widget.extra!['refresh'] == true &&
          widget.extra!['almacenCodigo'] != null) {
        codigoAlmacenSeleccionado = widget.extra!['almacenCodigo'] as int;
      }

      await tomasProviderNotifier
          .inicialiarAlmacenes(codigoAlmacenSeleccionado);
      ref.read(customFiltersProvider.notifier).clearAll();
    } catch (e) {
      print('Error al inicializar pantalla: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(tomasInventarioScreenProvider);
    final tomasProvider = ref.read(tomasInventarioScreenProvider.notifier);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  CustomDropdownField(
                    label: 'Seleccionar Almacén:',
                    value: viewState.resumenSeleccionado,
                    items: viewState.listaResumenes,
                    getLabel: (resumen) => resumen.almacen.nombre,
                    onChanged: (resumen) {
                      if (resumen != null) {
                        tomasProvider.seleccionarResumen(resumen);
                        tomasProvider.seleccionarAlmacen(resumen.almacen);
                      }
                    },
                    primaryColor: primaryColor,
                    prefixIcon: Icon(
                      Icons.warehouse_outlined,
                      color: primaryColor,
                      size: 25,
                    ),
                    showInfoColumns: true,
                    infoColumns: [
                      ColumnInfo(
                        title: 'Pendientes',
                        getValue: (resumen) => resumen.pendientes,
                        getColor: (resumen) => Colors.orange,
                      ),
                      ColumnInfo(
                        title: 'Contando',
                        getValue: (resumen) => resumen.contando,
                        getColor: (resumen) => Colors.blue,
                      ),
                      ColumnInfo(
                        title: 'Finalizados',
                        getValue: (resumen) => resumen.finalizados,
                        getColor: (resumen) => Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomFiltersWidget(),
                ],
              ),
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: ListaTomasInventarioWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icons.add,
        withContainer: true,
        onPressed: () {
          context.go(StepperCrearTomaInventarioScreen.name);
        },
      ),
    );
  }
}
