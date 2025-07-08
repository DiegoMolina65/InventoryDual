import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_unit_measure/assigned_count_unit_measure_screen.dart';
import 'package:m_dual_inventario/presentation/screens/login/provider/auth_provider.dart';
import 'package:m_dual_inventario/presentation/screens/screens_export.dart';
import 'package:m_dual_inventario/presentation/screens/settings/setting_screen.dart';
import 'package:m_dual_inventario/presentation/screens/splash/splash_screen.dart';
import 'package:m_dual_inventario/shared/widgets/custom_menu_navegacion/parent_scaffold_app.dart';

import 'app_router_notifier.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: SplashScreen.name,
    refreshListenable: goRouterNotifier,
    observers: [routeObserver],
    routes: [
      GoRoute(
        path: LoginScreen.name,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: SplashScreen.name,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: SettingScreen.name,
        builder: (context, state) => const SettingScreen(),
      ),

      // Rutas que no usan el ParentScaffoldApp
      GoRoute(
        path: '${TomasInventarioScreen.name}/detalle/:codigo',
        builder: (context, state) {
          final codigo = state.pathParameters['codigo'] ?? '0';
          final codigoTomaInventario = int.tryParse(codigo) ?? 0;

          final extra = state.extra as Map<String, dynamic>?;
          final nuevaToma = extra?['nuevaToma'];
          final esNuevaToma = extra?['esNuevaToma'] ?? false;

          return DetalleTomaInventarioScreen(
            codigoTomaInventario: codigoTomaInventario,
            nuevaTomaInventario: nuevaToma,
            esNuevaToma: esNuevaToma,
          );
        },
      ),
      GoRoute(
        path:
            '${TomasInventarioScreen.name}/editar-toma-inventario/:codigoTomaInventario',
        builder: (context, state) {
          final codigoTomaInventario = int.parse(
            state.pathParameters['codigoTomaInventario'] ?? '0',
          );
          return DetalleTomaInventarioScreen(
            codigoTomaInventario: codigoTomaInventario,
          );
        },
      ),

      // Ruta Stepper nueva toma inventario
      GoRoute(
        path: StepperCrearTomaInventarioScreen.name,
        builder: (context, state) => const StepperCrearTomaInventarioScreen(),
      ),

      // Ruta Producto Unidad Medida
      GoRoute(
        path: UnidadDeMedidadConteoAsignado.name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          final detalleProducto =
              extra['producto'] as DetalleRecuentoInventario;
          final cantidadActual = extra['cantidadActual'] as double;
          final unidadMedida = extra['unidadMedida'] as UnidadMedida;

          return UnidadDeMedidadConteoAsignado(
            detalleProducto: detalleProducto,
            cantidadActual: cantidadActual,
            unidadMedida: unidadMedida,
          );
        },
      ),

      // Ruta para detalle de conteo asignado
      GoRoute(
        path: DetalleConteoAsignadoScreen.name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return DetalleConteoAsignadoScreen(
            parametros: extra,
          );
        },
      ),

      // Ruta para búsqueda de productos
      GoRoute(
        path: BusquedaProductoScreen.name,
        builder: (context, state) {
          final params = state.uri.queryParameters;
          final tipoBusqueda = params['tipoBusqueda'] ?? 'producto';

          int codigoAlmacen = int.tryParse(params['codigoAlmacen'] ?? '0') ?? 0;
          int? codigoLinea = int.tryParse(params['codigoLinea'] ?? '');
          int? codigoGrupo = int.tryParse(params['codigoGrupo'] ?? '');
          int? codigoSubgrupo = int.tryParse(params['codigoSubgrupo'] ?? '');

          final nombreProducto = params['nombreProducto'];
          final ubicacion = params['ubicacion'];
          final codigoBarra = params['codigoBarra'];
          final fecha = params['fecha'];

          return BusquedaProductoScreen(
            tipoBusqueda: tipoBusqueda,
            codigoAlmacen: codigoAlmacen,
            fecha: fecha,
            codigoLinea: codigoLinea,
            codigoGrupo: codigoGrupo,
            codigoSubgrupo: codigoSubgrupo,
            ubicacion: ubicacion,
            nombreProducto: nombreProducto,
            codigoBarra: codigoBarra,
          );
        },
      ),

      // Rutas que usan el ParentScaffoldApp
      ShellRoute(
        builder: (context, state, child) {
          return ParentScaffoldApp(childwidget: child);
        },
        routes: [
          GoRoute(
            path: TomasInventarioScreen.name,
            builder: (context, state) => const TomasInventarioScreen(),
          ),
          GoRoute(
            path: ConteosAsignadosScreen.name,
            builder: (context, state) => const ConteosAsignadosScreen(),
          )
        ],
      ),
    ],
    redirect: (context, state) async {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == SplashScreen.name || authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == LoginScreen.name || isGoingTo == SettingScreen.name) return null;

        return LoginScreen.name;
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == LoginScreen.name /*|| isGoingTo == '/register'*/) {
          /// Si no es las anteriores mandamos al menu principal
          return TomasInventarioScreen.name;
        }
      }

      if (authStatus == AuthStatus.guest) {
        if (isGoingTo == '/splash' || isGoingTo == '/login'
            /*isGoingTo == '/register' ||*/
            ) {
          return '/home/0';
        }
      }

      return null;
    },
  );
});
