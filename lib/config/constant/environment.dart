import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

class Environment {
  static String urlApi = '';

  static Future<void> initEnvironment() async {
    await dotenv.load(fileName: '.env');

    final urlCacheada =
        await AppPreference.getValue<String>(KeyAppPreferences.apiUrl);

    urlApi = (urlCacheada != null && urlCacheada.isNotEmpty)
        ? urlCacheada
        : dotenv.env['API_URL'] ??
            'No está configurada la URL del servicio API';
  }

  static String urlApiServiceRRHH = dotenv.env['API_SERVICES_RRHH_URL'] ??
      'No está configurado la Url del servicio ApiService de RRHH';
  static String urlRRHH = dotenv.env['API_RRHH_URL'] ??
      'No está configurado la Url del servicio ApiService de RRHH';
  static String urlBaseAssets = dotenv.env['ASSETS_WEB_URL'] ??
      'No está configurado la Url de las assets';
  static String urlBaseFotos =
      dotenv.env['FOTOS_WEB_URL'] ?? 'No está configurado la Url de las assets';
}
