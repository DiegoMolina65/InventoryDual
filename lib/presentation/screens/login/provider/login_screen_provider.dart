import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/domain/repository/usuario/usuario/usuario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/usuario/usuario_provider.dart';
import 'package:m_dual_inventario/presentation/screens/login/provider/auth_provider.dart';

final loginScreenProvider =
    StateNotifierProvider.autoDispose<LoginScreenNotifier, LoginScreenState>(
  (ref) {
    final authRepository = ref.read(authProvider.notifier);
    final usuarioRepository = ref.read(usuarioRepositoryProvider);
    return LoginScreenNotifier(
        callbackLogin: authRepository.login,
        usuarioRepository: usuarioRepository);
  },
);

class LoginScreenNotifier extends StateNotifier<LoginScreenState> {
  LoginScreenNotifier(
      {required this.usuarioRepository, required this.callbackLogin})
      : super(LoginScreenState(usuario: "renzo", contrasenia: "renzo."));

  final Future<Usuario> Function(String, String) callbackLogin;
  final UsuarioRepository usuarioRepository;

  Future<bool> onClickLogin() async {
    try {
      state = state.copyWith(isLoading: true);

      Usuario usuario = await callbackLogin(state.usuario, state.contrasenia);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (ex) {
      state = state.copyWith(isLoading: false, error: ex.toString());
      return false;
    }
  }

  void onChangeUsuario(String usuario) {
    state = state.copyWith(usuario: usuario);
  }

  void onChangeContrasenia(String contrasenia) {
    state = state.copyWith(contrasenia: contrasenia);
  }
}

class LoginScreenState {
  LoginScreenState(
      {required this.usuario, required this.contrasenia, this.error});

  final String usuario;
  final String contrasenia;
  final String? error;

  LoginScreenState copyWith(
          {String? usuario,
          String? contrasenia,
          bool? isLoading,
          String? error,
          bool clearError = false}) =>
      LoginScreenState(
          usuario: usuario ?? this.usuario,
          contrasenia: contrasenia ?? this.contrasenia,
          error: clearError ? null : (error ?? this.error));
}
