import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/assigned_counts_screen.dart';
import 'package:m_dual_inventario/presentation/screens/login/provider/auth_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_screen/inventory_take_screen.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_tomas_inventario_reporte/reporte_tomas_inventario_screen.dart';
import 'package:m_dual_inventario/shared/logs/logs_dlbz.dart';
import 'package:m_dual_inventario/shared/widgets/custom_showdialog/custom_showdialog_widget.dart';

import 'package:share/share.dart';

class CustomAppDrawer extends ConsumerWidget {
  final VoidCallback onDrawerClosed;
  final GlobalKey<NavigatorState> dialogKey = GlobalKey<NavigatorState>();

  CustomAppDrawer({super.key, required this.onDrawerClosed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).usuario;
    final version = ref.watch(authProvider.select((state) => state.version));
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user?.nombre ?? 'Cargando...',
              textAlign: TextAlign.center,
            ),
            accountEmail: Text(
              user != null ? '${user.nombreLocal} - App: $version' : '1.0',
              textAlign: TextAlign.center,
            ),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final currentLocation = GoRouterState.of(context).uri.toString();

              return Column(
                children: [
                  (user?.esSupervisor ?? false)
                      ? ListTile(
                          leading: const Icon(Icons.inventory),
                          title: const Text(
                            'Tomas de inventario',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          tileColor:
                              currentLocation == TomasInventarioScreen.name
                                  ? primaryColor.withOpacity(0.2)
                                  : null,
                          onTap: () {
                            context.pop();
                            context.go(TomasInventarioScreen.name);
                          },
                        )
                      : const SizedBox.shrink(),
                  ListTile(
                    leading: const Icon(Icons.list),
                    title: const Text(
                      'Conteo Asignados',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    tileColor: currentLocation == ConteosAsignadosScreen.name
                        ? primaryColor.withOpacity(0.2)
                        : null,
                    onTap: () {
                      context.pop();
                      context.go(ConteosAsignadosScreen.name);
                    },
                  ),
                  (user?.esSupervisor ?? false)
                      ? ListTile(
                          leading: const Icon(Icons.report),
                          title: const Text(
                            'Reporte Tomas de inventario',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          tileColor: currentLocation ==
                                  ReporteTomasInventarioScreen.name
                              ? primaryColor.withOpacity(0.2)
                              : null,
                          onTap: () {
                            context.pop();
                            context.go(ReporteTomasInventarioScreen.name);
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 22),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Configuraciones',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Cerrar Sesión',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              context.pop();
              _mostrarModalCerrarSesion(context, ref);
            },
          ),
          (user?.esSupervisor ?? false)
              ? ListTile(
                  leading: const Icon(Icons.article_outlined),
                  title: const Text(
                    'Ver Logs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  onTap: () async {
                    try {
                      //Obtén el archivo de hoy
                      final fileLog =
                          await LogsDlbz.obtenerArchivoLog(DateTime.now());

                      // 2) Lée su contenido
                      final contenido = await fileLog.readAsString();

                      // 3) Muéstralo en un AlertDialog
                      if (contenido.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('El log está vacío')),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logs del día'),
                            content: SingleChildScrollView(
                              child: Text(contenido),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cerrar'),
                              ),
                              // Opcional: botón para compartir el texto
                              TextButton(
                                onPressed: () {
                                  Share.share(contenido,
                                      subject: 'Logs de la aplicación');
                                },
                                child: const Text('Compartir'),
                              ),
                            ],
                          ),
                        );
                      }
                    } catch (e) {
                      debugPrint('Error leyendo log: $e');
                    }
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  void _mostrarModalCerrarSesion(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomShowDialog(
          title: 'Cerrar sesión',
          content: const Text(
            '¿Está seguro de que desea cerrar sesión?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          actions: [
            CustomShowDialogHelper.createButtonShowDialog(
              text: 'NO',
              onPressed: () {
                CustomShowDialogHelper.closeShowDialogo(context);
              },
            ),
            CustomShowDialogHelper.createButtonShowDialog(
              text: 'SÍ',
              onPressed: () {
                CustomShowDialogHelper.closeShowDialogo(context);
                Future.microtask(() {
                  authNotifier.logout();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
