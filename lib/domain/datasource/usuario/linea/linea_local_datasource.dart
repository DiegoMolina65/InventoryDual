import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/linea/linea.dart';

abstract class LineaLocalDatasource {
  Future<bool> guardarLinea(ObtenerDatosApp obtenerDatosApp);

  Future<List<Linea>> obtenerLineas();
}
