import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';

abstract class AlmacenRepository {
  Future<bool> sincronizarDatosAlmacen(int codigoLocal, int codigoUsuario);
  Future<List<AlmacenXLocal>> obtenerAlmacenesPorLocal( {bool incluirOpcionTodos = false});
}
