import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/domain/repository/almacen/almacen_repository.dart';
import 'package:m_dual_inventario/domain/repository/usuario/usuario/usuario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/almacen/almacen_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/toma_inventario/toma_inventario_provider.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/usuario/usuario_provider.dart';
import 'package:m_dual_inventario/domain/repository/toma_inventario/toma_inventario_repository.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final usuarioRepository = ref.read(usuarioRepositoryProvider);
  final almacenRepository = ref.read(almacenRepositoryProvider);
  final tomaInventarioRepository = ref.read(tomaInventarioRepositoryProvider);

  return AuthNotifier(
      usuarioRepository: usuarioRepository,
      almacenRepository: almacenRepository,
      tomaInventarioRepository: tomaInventarioRepository);
});

typedef LoadConfigurationCallback = Future<void> Function();

class AuthNotifier extends StateNotifier<AuthState> {
  final UsuarioRepository usuarioRepository;
  final AlmacenRepository almacenRepository;
  final TomaInventarioRepository tomaInventarioRepository;

  AuthNotifier({
    required this.tomaInventarioRepository,
    required this.almacenRepository,
    required this.usuarioRepository,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  void checkAuthStatus() async {
    try {
      final codigoUsuario =
          await AppPreference.getValue<int>(KeyAppPreferences.codigoUsuario);

      final versionGuardada =
          await AppPreference.getValue<String>(KeyAppPreferences.versionApp);

      if (versionGuardada != null) {
        state = state.copyWith(version: versionGuardada);
      }

      if (codigoUsuario == null) {
        return logout();
      }

      final usuario =
          await usuarioRepository.obtenerUsuarioLocal(codigoUsuario);
      if (usuario == null) {
        // Cerrar sesion
        return logout();
      }

      await _setLoggedUser(usuario);
    } catch (e) {
      if (kDebugMode) {
        print('Debug error check empleado: $e');
      }
      await logout();
    }
  }

  Future<Usuario> login(String nickUsuario, String contrasena) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      await Future.delayed(const Duration(seconds: 3));
      // Iniciar sesion (login)
      final usuario =
          await usuarioRepository.loginUsuario(nickUsuario, contrasena);

      // Guardar usuario
      await usuarioRepository.guardarUsuarioLocal(usuario);

      // Sincronizar datosApp
      await usuarioRepository
          .sincronizarDatosApp(usuario.codigoLocal.toString());

      // Sincronizar almacenesLocal
      await almacenRepository.sincronizarDatosAlmacen(
          usuario.codigoLocal, usuario.codigo);

      // Obtener version app dual inventario
      final version = await usuarioRepository.obtenerVersionDualInventario();
      await AppPreference.setKeyValue<String>(
          KeyAppPreferences.versionApp, version);
      state = state.copyWith(version: version);

      await _setLoggedUser(usuario);

      return usuario;
    } /*on CustomError catch (e) {
      await logout(e.message, e);
      return null;
    }*/
    catch (e) {
      rethrow;
    }
  }

  Future<void> _setLoggedUser(Usuario usuario) async {
    await AppPreference.setKeyValue<int>(
        KeyAppPreferences.codigoUsuario, usuario.codigo);

    await AppPreference.setKeyValue<String>(
        KeyAppPreferences.nickUsuario, usuario.usuario);
    await AppPreference.setKeyValue<String>(
        KeyAppPreferences.clave, usuario.contrasenia);

    state = state.copyWith(
      usuario: usuario,
      authStatus: AuthStatus.authenticated,
    );
  }

  Future<void> logout() async {
    await AppPreference.removeKey(KeyAppPreferences.codigoUsuario);
    await AppPreference.removeKey(KeyAppPreferences.nickUsuario);
    await AppPreference.removeKey(KeyAppPreferences.clave);
    await AppPreference.removeKey(KeyAppPreferences.token);
    await AppPreference.removeKey(KeyAppPreferences.versionApp);

    // limpiar base de datos
    await usuarioRepository.vaciaLocal();

    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      usuario: null,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated, guest }

class AuthState {
  final AuthStatus authStatus;
  final Usuario? usuario;
  final String? version;

  AuthState(
      {this.authStatus = AuthStatus.checking, this.usuario, this.version});

  AuthState copyWith(
          {AuthStatus? authStatus, Usuario? usuario, String? version}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          usuario: usuario ?? this.usuario,
          version: version ?? this.version);
}
