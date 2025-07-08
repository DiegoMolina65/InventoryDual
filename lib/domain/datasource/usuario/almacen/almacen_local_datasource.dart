import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';

abstract class AlmacenLocalDatasource {
    Future<bool> guardarAlmacen(ObtenerDatosApp obtenerDatosApp);
}
