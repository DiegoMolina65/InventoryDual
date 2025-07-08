import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/login/login_screen.dart';
import 'package:m_dual_inventario/presentation/screens/settings/provider/setting_provider.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});
  static const name = '/setting-screen';

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _modoEdicion = false;
  String _ultimoValorProvider = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _activarEdicion() => setState(() => _modoEdicion = true);

  void _cancelarEdicion() {
    setState(() {
      _modoEdicion = false;
      _controller.text = _ultimoValorProvider;
    });
  }

  Future<void> _guardarConfiguracion() async {
    final url = _controller.text.trim();
    if (url.isEmpty) {
      CustomSnackBar.show(
        context,
        message: 'La URL no puede estar vacía',
        type: SnackBarType.warning,
      );
      return;
    }
    try {
      await ref.read(settingProvider.notifier).guardarUrl(url);
      setState(() => _modoEdicion = false);
      CustomSnackBar.show(
        context,
        message: 'URL guardada correctamente',
        type: SnackBarType.success,
      );
    } catch (e) {
      CustomSnackBar.show(
        context,
        message: 'Error: ${e.toString()}',
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final viewState = ref.watch(settingProvider);

    if (!_modoEdicion && viewState != _ultimoValorProvider) {
      _ultimoValorProvider = viewState;
      _controller.text = viewState;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Servicios'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(LoginScreen.name),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'SERVICIOS WEB',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextformfield(
              controller: _controller,
              enabled: _modoEdicion,
              hintText: 'https://dualbiz.com/api',
              prefixIcon: const Icon(Icons.link),
            ),
            const SizedBox(height: 24),
            if (_modoEdicion)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _cancelarEdicion,
                        icon: const Icon(Icons.cancel),
                        label: const Text(
                          'CANCELAR',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _guardarConfiguracion,
                        icon: const Icon(Icons.save_alt_rounded),
                        label: const Text(
                          'GUARDAR',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40,
                  child: TextButton.icon(
                    onPressed: _activarEdicion,
                    icon: const Icon(Icons.edit),
                    label: const Text('EDITAR'),
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
