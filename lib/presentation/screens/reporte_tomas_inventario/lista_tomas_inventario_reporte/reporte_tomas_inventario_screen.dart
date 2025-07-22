import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_tomas_inventario_reporte/provider/reporte_tomas_inventario_provider.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_tomas_inventario_reporte/widgets/lista_tomas_inventario_reporte_widget.dart';
import 'package:m_dual_inventario/shared/widgets/custom_filters/custom_filters_widget.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class ReporteTomasInventarioScreen extends ConsumerStatefulWidget {
  const ReporteTomasInventarioScreen({super.key});
  static const name = '/reporte-tomas-inventario';

  @override
  ConsumerState<ReporteTomasInventarioScreen> createState() =>
      _ReporteTomasInventarioScreenState();
}

class _ReporteTomasInventarioScreenState
    extends ConsumerState<ReporteTomasInventarioScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reporteTomasInventarioProvider.notifier).cargarAlmacenes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final reportesTomaInventarioState =
        ref.watch(reporteTomasInventarioProvider);
    final reportesTomaInventarioNotifier =
        ref.read(reporteTomasInventarioProvider.notifier);
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
                    value: reportesTomaInventarioState.almacenSeleccionado,
                    items: reportesTomaInventarioState.almacenes,
                    getLabel: (almacen) => almacen.nombre,
                    onChanged: (almacen) {
                      if (almacen != null) {
                        reportesTomaInventarioNotifier
                            .seleccionarAlmacen(almacen);
                      }
                    },
                    primaryColor: primaryColor,
                    prefixIcon: Icon(
                      Icons.warehouse_outlined,
                      color: primaryColor,
                      size: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomFiltersWidget(showStatusFilter: false),
                ],
              ),
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: ListaTomasInventarioReporteWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
