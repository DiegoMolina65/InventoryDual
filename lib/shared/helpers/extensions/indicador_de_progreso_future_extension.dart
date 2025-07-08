import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'package:m_dual_inventario/shared/widgets/custom_progress_loading/custom_progress_loading_widget.dart';
import 'dart:async';

extension IndicadorDeProgresoFutureExtension<T> on Future<T> {
  Future<T> ejecutar({
    Duration minimumDuration = const Duration(milliseconds: 0),
    String message = 'Procesando...',
    Color? primaryColor,
  }) async {
    primaryColor ??= AppTheme.primaryColor;

    OverlayLoadingProgress.start(
      widget: CustomProgressOverlay(
        message: message,
        primaryColor: primaryColor,
      ),
    );

    try {
      final startTime = DateTime.now();
      final result = await this;
      final elapsedTime = DateTime.now().difference(startTime);

      if (elapsedTime < minimumDuration) {
        await Future.delayed(minimumDuration - elapsedTime);
      }

      return result;
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
