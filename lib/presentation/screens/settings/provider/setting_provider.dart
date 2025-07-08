import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/environment.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

final settingProvider = StateNotifierProvider.autoDispose<SettingController, String>((ref) {
  return SettingController();
});

class SettingController extends StateNotifier<String> {
  SettingController() : super('') {
    _cargarUrl();
  }

  Future<void> _cargarUrl() async {
    final url = await AppPreference.getValue<String>(KeyAppPreferences.apiUrl);

    if (url != null && url.isNotEmpty) {
      state = url;
    } else {
      state = Environment.urlApi;
    }
  }

  Future<void> guardarUrl(String nuevaUrl) async {
    final url = nuevaUrl.trim();

    if (url.isEmpty) {
      throw Exception('La URL no puede estar vacía');
    }

    // Guardar en SharedPreferences
    await AppPreference.setKeyValue<String>(KeyAppPreferences.apiUrl, url);

    // Modificar la variable global
    Environment.urlApi = url;

    // Actualizar el estado del provider
    state = url;
  }
}
