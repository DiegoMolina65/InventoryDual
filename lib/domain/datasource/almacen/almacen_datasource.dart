import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';


abstract class AlmacenDatasource {
  Future<List<AlmacenXLocal>> obtenerDatosAlmacen(int codigoLocal, int codigoUsuario);

}