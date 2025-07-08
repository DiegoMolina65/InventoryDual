import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/environment.dart';
import 'package:m_dual_inventario/config/router/app_router.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment();

  await initializeDateFormatting('es', null);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);

    return OverlayKit(
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', 'ES')],
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeApp(),
      ),
    );
  }
}
