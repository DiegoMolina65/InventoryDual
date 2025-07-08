import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';

abstract class ConteoLocalDatasource {
  Future<bool> guardarRegistroConteoProductoLocal(
    RegistroConteoProducto registro,
  );

  Future<List<RegistroConteoProducto>> obtenerRegistrosPendientes();
  Future<void> marcarSincronizado(List<int> codigos);

  Future<RegistroConteoProducto?> obtenerRegistroConteoProductoPorLote({
    required int codigoConteo,
    required String codigoProducto,
    required String codigoLote,
  });
}
