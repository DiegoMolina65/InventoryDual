import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension DateTimeFormats on DateTime {
  String shortDate() {
    // final format = DateFormat.yMMMEd('es');
    final format = DateFormat('dd/MM/yyyy', 'es');
    return format.format(this);
  }

  String getNameDayWeek() {
    final format = DateFormat.EEEE('es');
    return format.format(this);
  }

  String getNameMonthAbr() {
    final format = DateFormat.MMM('es');
    return format.format(this);
  }

  String getTimeString() {
    final format = DateFormat.Hm('es');
    return format.format(this);
  }

  String getEEEEdMMMM() {
    final format = DateFormat("EEEE d 'de' MMMM", 'es');
    return format.format(this);
  }

  String getMMMMdyyyy() {
    final format = DateFormat("MMMM d',' yyyy", 'es');
    return format.format(this);
  }

  String getStringFormat(String patronFormat) {
    final format = DateFormat(patronFormat, 'es');
    return format.format(this);
  }
}

extension DateParserFormats on DateFormat {
  DateTime? tryParseLoose(String inputString, [bool utc = false]) {
    try {
      return parseLoose(inputString, utc);
    } catch (ex) {
      if (kDebugMode) {
        print('Debug error: Error tryParseLoose: $ex');
      }
      return null;
    }
  }
}

extension DateComparers on DateTime {
  /// Verifica si es la misma fecha sin tomar en cuenta el tiempo
  /// Verifica fecha, mes y dia sean iguales.
  bool esMismaFecha(DateTime otro) {
    final fecha1SinTiempo = DateTime(year, month, day);
    final fecha2SinTiempo = DateTime(otro.year, otro.month, otro.day);

    // return year == otro.year && month == otro.month && day == otro.day;
    return fecha1SinTiempo.compareTo(fecha2SinTiempo) == 0;
  }

  bool esSoloFechaAntes(DateTime otro) {
    final fecha1SinTiempo = DateTime(year, month, day);
    final fecha2SinTiempo = DateTime(otro.year, otro.month, otro.day);

    return fecha1SinTiempo.compareTo(fecha2SinTiempo) < 0;
    // bool esAnioAnterior = year < otro.year;
    // bool esSoloMesAnterior = year == otro.year && month < otro.month;
    // bool esSoloDiaAnterior =
    //     year == otro.year && month == otro.month && day < otro.day;

    // return esAnioAnterior || esSoloMesAnterior || esSoloDiaAnterior;
  }

  bool esSoloFechaDespues(DateTime otro) {
    final fecha1SinTiempo = DateTime(year, month, day);
    final fecha2SinTiempo = DateTime(otro.year, otro.month, otro.day);

    return fecha1SinTiempo.compareTo(fecha2SinTiempo) > 0;
    // bool esAnioDespues = year > otro.year;
    // bool esSoloMesDespues = year == otro.year && month > otro.month;
    // bool esSoloDiaDespues =
    //     year == otro.year && month == otro.month && day > otro.day;
    // return esAnioDespues || esSoloMesDespues || esSoloDiaDespues;
  }

  /// Verifica si la fecha esta dentro del rango entre la fecha inicial y la fecha final
  ///
  /// La función [betweenTo] retorna:
  ///  * true si la fecha estra entre la fecha inicial y la fecha final, caso contrario retorna false.
  ///  * El parámetro incluirFechaInicial valida que la fecha sea igual a la fecha inicial,
  ///  * el parámetro incluirFechaFinal valida que la fecha sea igual a la fecha final.
  ///
  /// ```
  bool betweenTo(DateTime fechaInicial, DateTime fechaFinal,
      {bool incluirFechaInicial = false, bool incluirFechaFinal = false}) {
    if (incluirFechaInicial && compareTo(fechaInicial) == 0) {
      return true;
    }

    if (incluirFechaFinal && compareTo(fechaFinal) == 0) {
      return true;
    }

    return fechaInicial.isBefore(this) && isBefore(fechaFinal);
  }
}

extension DateTimeUtilidad on DateTime {
  DateTime obtenerUltimaFechaDelMes() {
    DateTime fechaActual = this;

    // Obtener el mes siguiente, pero con el día 1
    DateTime primerDiaDelMesSiguiente =
        DateTime(fechaActual.year, fechaActual.month + 1, 1);

    // Restar un día para obtener el último día del mes actual
    DateTime ultimoDiaDelMesActual =
        primerDiaDelMesSiguiente.subtract(const Duration(days: 1));

    return ultimoDiaDelMesActual;
  }

  DateTime obtenerFechaSinTiempo() {
    DateTime fechaActual = this;

    // Obtener el mes siguiente, pero con el día 1
    DateTime fechaSinTiempo =
        DateTime(fechaActual.year, fechaActual.month, fechaActual.day);

    return fechaSinTiempo;
  }

  DateTime obtenerPrimerDiaDelAnio() {
    DateTime fechaActual = this;

    // Obtener el mes siguiente, pero con el día 1
    DateTime fechaSinTiempo = DateTime(fechaActual.year, 1, 1);

    return fechaSinTiempo;
  }
}
