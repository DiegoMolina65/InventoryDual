import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/provider/assigned_counts_provider.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/widgets/count_item_card_widget.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/assigned_count_details_screen.dart';
import 'package:m_dual_inventario/shared/widgets/custom_filters/custom_filters_provider.dart';

class ListaConteosWidget extends ConsumerWidget {
  final Function(Map<String, dynamic>)? onConteoTap;

  const ListaConteosWidget({
    Key? key,
    this.onConteoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(conteosAsignadosProvider);
    final filters = ref.watch(customFiltersProvider);
    final primaryColor = Theme.of(context).colorScheme.primary;

    var filtered = viewState.conteosAsignados.where((c) {
      if (filters.status == FilterStatus.all) return true;
      return c.estadoConteo.toLowerCase() == filters.status.name;
    });

    if (filters.startDate != null && filters.endDate != null) {
      filtered = filtered.where((c) =>
          c.fechaCreacion.isAfter(filters.startDate!) &&
          c.fechaCreacion
              .isBefore(filters.endDate!.add(const Duration(days: 1))));
    }

    if (filters.name.isNotEmpty) {
      final lower = filters.name.toLowerCase();
      filtered = filtered
          .where((c) => c.nombreTomaInventario.toLowerCase().contains(lower));
    }

    final lista = filtered.toList();

    if (viewState.isLoadingConteos) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: primaryColor,
        ),
      );
    }
    if (lista.isEmpty) {
      return const Center(
        child: Text(
          'No hay conteos asignados',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final conteo = lista[index];
        return ConteoCard(
          codigo: conteo.codigo,
          fechaCreacion: conteo.fechaCreacion,
          estadoConteo: conteo.estadoConteo,
          nombreToma: conteo.nombreTomaInventario,
          tipo: conteo.tipo,
          cantidadProductos: conteo.listaDetalleRecuentoInventario.length,
          cantidadContados: _calcularProductosContados(conteo),
          onTap: () {
            final parametros = {
              'tdi': conteo.codigoTI,
              'nombre': conteo.nombreTomaInventario,
              'nroConteo': conteo.numeroConteo,
              'productos': conteo.listaDetalleRecuentoInventario,
              'codigo': conteo.codigo,
              'estadoConteo': conteo.estadoConteo,
            };
            print(parametros);

            if (onConteoTap != null) {
              onConteoTap!(parametros);
            } else {
              context.push(
                DetalleConteoAsignadoScreen.name,
                extra: parametros,
              );
            }
          },
        );
      },
    );
  }

  int _calcularProductosContados(ConteoInventario conteo) {
    return conteo.listaDetalleRecuentoInventario
        .where((detalle) => detalle.cantidadConteo > 0)
        .length;
  }
}
