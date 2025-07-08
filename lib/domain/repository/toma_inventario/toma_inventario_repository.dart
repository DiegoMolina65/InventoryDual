import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';

abstract class TomaInventarioRepository {
  Future<List<TomasInventario>> obtenerUltimasTomas(int codigoAlmacen);

  Future<TomasInventario> buscarTomaInventario(int codigoTomaInventario);

  Future<int> guardarTomaInventario(TomasInventario tomaInventario);
}
