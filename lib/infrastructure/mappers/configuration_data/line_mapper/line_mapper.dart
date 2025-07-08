import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/line_model/line_model.dart';

class LineMapper {
    static Linea mapearListLine(
      LineModel obtenerDatosModelListLine) {
    return Linea(
        codigo: obtenerDatosModelListLine.code,
        descripcion: obtenerDatosModelListLine.description);
  }
}
