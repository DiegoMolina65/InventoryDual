import 'package:flutter/material.dart';

class AppTheme {
  // Color principal app
  static const Color _primaryColor = Colors.blue;

  // Colores para botones de acciones, snackbars
  static const Color _successColor = Colors.green;
  static const Color _dangerColor = Colors.red;
  static const Color _warningColor = Colors.amber;

  // Getters para acceder a los colores desde otras clases
  static Color get primaryColor => _primaryColor;
  static Color get successColor => _successColor;
  static Color get dangerColor => _dangerColor;
  static Color get warningColor => _warningColor;

  static ThemeData themeApp() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _successColor,
        error: _dangerColor,
        tertiary: _warningColor,
      ),
    );
  }
}
