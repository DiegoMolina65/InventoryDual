import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/login/provider/login_screen_provider.dart';
import 'package:m_dual_inventario/presentation/screens/settings/setting_screen.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  static const name = '/login-screen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).colorScheme.primary;
    ref.watch(loginScreenProvider);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              primaryColor.withOpacity(0.9),
              primaryColor.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculamos si estamos en orientación horizontal
              final isLandscape = size.width > size.height;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    // En landscape usamos la altura mínima de los constraints
                    // En portrait usamos la altura total disponible
                    minHeight: isLandscape
                        ? constraints.maxHeight
                        : constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(isLandscape ? 16.0 : 24.0),
                      child: Column(
                        children: [
                          // Espaciado flexible adaptativo
                          SizedBox(height: isLandscape ? 10 : 20),

                          const LogoWidget(),
                          const SizedBox(height: 8),

                          Text(
                            'Sistema de Inventario',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: isLandscape ? 18 : 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),

                          SizedBox(height: isLandscape ? 15 : 30),

                          // Card del formulario
                          Card(
                            elevation: 8,
                            shadowColor: Colors.black38,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(isLandscape ? 20.0 : 24.0),
                              child: Form(
                                key: _formKey,
                                child: const CredentialsFields(),
                              ),
                            ),
                          ),

                          SizedBox(height: isLandscape ? 16 : 24),

                          LoginActions(formKey: _formKey),

                          // Espaciado flexible que se adapta
                          SizedBox(height: isLandscape ? 20 : 40),

                          // Footer - siempre al final
                          Text(
                            '© ${DateTime.now().year} Dualbiz. Todos los derechos reservados.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  int _tapCount = 0;

  void _handleTap(BuildContext context) {
    setState(() {
      _tapCount++;
      debugPrint('Contador: $_tapCount');
    });

    if (_tapCount >= 10) {
      _tapCount = 0;
      context.go(SettingScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Container(
        padding: EdgeInsets.all(isLandscape ? 12 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Image.asset(
          'assets/images/logodualbiz.png',
          height: isLandscape ? 80 : 100,
        ),
      ),
    );
  }
}

class CredentialsFields extends ConsumerWidget {
  const CredentialsFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final viewState = ref.watch(loginScreenProvider);
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Iniciar Sesión',
          style: TextStyle(
            color: primaryColor,
            fontSize: isLandscape ? 20 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isLandscape ? 15 : 20),
        const Text(
          'Usuario',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextformfield(
          prefixIcon: Icon(Icons.person_outline, color: primaryColor),
          validator: ValidatorsInputs.validateGeneralField,
          hintText: 'Ingrese su usuario',
          initialValue: viewState.usuario,
          onChanged: ref.read(loginScreenProvider.notifier).onChangeUsuario,
        ),
        SizedBox(height: isLandscape ? 12 : 18),
        const Text(
          'Contraseña',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextformfield(
          prefixIcon: Icon(Icons.lock_outline, color: primaryColor),
          obscureText: true,
          initialValue: viewState.contrasenia,
          validator: ValidatorsInputs.validateGeneralField,
          hintText: 'Ingrese su contraseña',
          onChanged: ref.read(loginScreenProvider.notifier).onChangeContrasenia,
        ),
      ],
    );
  }
}

class LoginActions extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const LoginActions({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    ref.listen<LoginScreenState>(loginScreenProvider, (previous, current) {
      if (current.error != null && current.error != previous?.error) {
        CustomSnackBar.show(
          context,
          message: "Error al iniciar sesión",
          type: SnackBarType.error,
        );
      }
    });

    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            final result = await ref
                .read(loginScreenProvider.notifier)
                .onClickLogin()
                .ejecutar();

            if (result) {
              CustomSnackBar.show(
                context,
                message: "Inicio de sesión exitoso",
                type: SnackBarType.success,
              );
            }
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.login_rounded, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
