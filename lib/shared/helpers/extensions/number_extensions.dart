import 'dart:math' as math;

import 'package:intl/intl.dart';

extension VectorMath on int {
  double degreesToRadians() {
    return this * (math.pi / 180);
  }
}

extension LetterABC on int {
  String numberToLetter() {
    final int baseCode = 'A'.codeUnitAt(0) - 1;
    return String.fromCharCode(baseCode + this);
  }
}

extension LetterABC2 on String {
  int letraANumero() {
    final int baseCode = 'A'.codeUnitAt(0) - 1;
    return toUpperCase().codeUnitAt(0) - baseCode;
  }
}

extension Monetario on double {
  String toStringDecimal(String textoMoneda, {mostrarMonedaDer = false}) {
    String textoFormateado = '';
    if (this % 1 == 0) {
      // Si el número no tiene decimales, mostrarlo sin decimales
      // textoFormateado = '${toInt()}';
      textoFormateado = NumberFormat.currency(
        customPattern: '#,###',
        // symbol: textoMoneda,
        decimalDigits: 2,
        // locale: 'en_US',
      ).format(this);
    } else {
      textoFormateado = NumberFormat.currency(
        customPattern: '#,##0.00',
        // symbol: textoMoneda,
        decimalDigits: 2,
        // locale: 'en_US',
      ).format(this);
    }

    String strResultado =
        '${textoMoneda.isNotEmpty ? '$textoMoneda ' : ''}$textoFormateado';
    if (mostrarMonedaDer) {
      strResultado =
          '$textoFormateado ${textoMoneda.isNotEmpty ? textoMoneda : ''}';
    }

    return strResultado;
  }
}
