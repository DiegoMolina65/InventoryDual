import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/assigned_counts_screen.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/provider/assigned_counts_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/provider/inventory_screen_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/inventory_take_screen.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_tomas_inventario_reporte/reporte_tomas_inventario_screen.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.isDrawerOpen,
  });

  final bool isDrawerOpen;

  String _getTitle(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(TomasInventarioScreen.name)) {
      return 'Listado de Tomas de Inventario';
    } else if (location.startsWith(ConteosAsignadosScreen.name)) {
      return 'Listado de Conteos Asignados';
    } else if (location.startsWith(ReporteTomasInventarioScreen.name)) {
      return 'Reporte Tomas de inventario';
    }

    return 'M_DUAL_INVENTARIO';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final primaryColor = Theme.of(context).colorScheme.primary;

    return AppBar(
      title: Text(
        _getTitle(context),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: primaryColor,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              isDrawerOpen ? Icons.menu_open : Icons.menu,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            _handleRefresh(context, ref, currentLocation);
          },
        ),
      ],
    );
  }

  void _handleRefresh(
      BuildContext context, WidgetRef ref, String currentLocation) async {
    try {
      if (currentLocation.startsWith(TomasInventarioScreen.name)) {
        final tomasProvider = ref.read(tomasInventarioScreenProvider.notifier);
        final almacenSeleccionado =
            ref.read(tomasInventarioScreenProvider).almacenSeleccionado;

        if (almacenSeleccionado != null) {
          tomasProvider.cargarTomasInventario(almacenSeleccionado.codigo);
        } else {
          tomasProvider.inicialiarAlmacenes();
        }
      } else if (currentLocation.startsWith(ConteosAsignadosScreen.name)) {
        final conteosProvider = ref.read(conteosAsignadosProvider.notifier);
        final almacenSeleccionado =
            ref.read(conteosAsignadosProvider).almacenSeleccionado;

        if (almacenSeleccionado != null) {
          await conteosProvider
              .cargarTodosLosConteos(almacenSeleccionado.codigo);
        } else {
          conteosProvider.inicializarDatos();
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
