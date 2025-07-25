import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/lista_detalles_conteos_reporte_screen.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_tomas_inventario_reporte/provider/reporte_tomas_inventario_provider.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/shared/widgets/custom_filters/custom_filters_provider.dart';

class ListaTomasInventarioReporteWidget extends ConsumerWidget {
  const ListaTomasInventarioReporteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref
        .watch(reporteTomasInventarioProvider.select((s) => s.isLoadingTomas));
    final filtros = ref.watch(customFiltersProvider);
    final primaryColor = Theme.of(context).colorScheme.primary;
    final baseList = ref
        .read(reporteTomasInventarioProvider.notifier)
        .obtenerTomasPorAlmacenSeleccionado();

    final filtradas = baseList.where((toma) {
      if (filtros.name.isNotEmpty) {
        if (!toma.nombre.toLowerCase().contains(filtros.name.toLowerCase())) {
          return false;
        }
      }
      if (filtros.startDate != null && filtros.endDate != null) {
        final fecha = DateTime(
          toma.fechaRegistro.year,
          toma.fechaRegistro.month,
          toma.fechaRegistro.day,
        );
        final start = DateTime(
          filtros.startDate!.year,
          filtros.startDate!.month,
          filtros.startDate!.day,
        );
        final end = DateTime(
          filtros.endDate!.year,
          filtros.endDate!.month,
          filtros.endDate!.day,
        );

        if (fecha.isBefore(start) || fecha.isAfter(end)) {
          return false;
        }
      }

      return true;
    }).toList();

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: primaryColor,
        ),
      );
    }

    if (filtradas.isEmpty) {
      return const Center(
        child: Text(
          'No hay tomas de inventario para mostrar',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: filtradas.length,
      cacheExtent: 200,
      itemBuilder: (context, index) {
        final tomaInventario = filtradas[index];
        return InkWell(
          // TODO: Editar el onTap para redigir a ListaDetallesConteosReporteScreen
          onTap: () {
            context.push(ListaDetallesConteosReporteScreen.name,
                extra: {'codigoTomaInventario': tomaInventario.codigo});
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 8),
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabecera: código, fecha y chip de estado
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'NRO TOMA: ${tomaInventario.codigo}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '/ FECHA DE CREACIÓN: ${tomaInventario.fechaRegistro.shortDate()}',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Tipo y nombre
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      children: [
                        const TextSpan(
                          text: 'TIPO: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: tomaInventario.tipo.toUpperCase()),
                        const TextSpan(text: ' / '),
                        const TextSpan(
                          text: 'NOMBRE: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: tomaInventario.nombre),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Contadores
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContadorItem(
                        tomaInventario.cantidadProducto,
                        Colors.blue,
                        'Cantidad de Productos',
                        Icons.inventory_2_outlined,
                      ),
                      _buildContadorItem(
                        tomaInventario.cantidadConteo,
                        Colors.orange,
                        'Conteos Asignados',
                        Icons.discount_outlined,
                      ),
                      _buildContadorItem(
                        tomaInventario.cantidadConteoFinalizado,
                        Colors.green,
                        'Conteos Finalizados',
                        Icons.check_circle_outline,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContadorItem(
      int cantidad, Color color, String label, IconData icon) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 20, color: color),
                  const SizedBox(width: 4),
                  Text(
                    cantidad.toString(),
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Text(
                label,
                style: TextStyle(color: color, fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
