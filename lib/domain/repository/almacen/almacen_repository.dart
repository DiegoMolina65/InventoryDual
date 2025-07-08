import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';


abstract class AlmacenRepository {
  Future<bool> sincronizarDatosAlmacen(int codigoLocal);
  Future<List<AlmacenXLocal>> obtenerAlmacenesPorLocal();

}
