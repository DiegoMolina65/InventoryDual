import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';

abstract class ConteoRepository {
  // Remoto
  Future<List<ConteoInventario>> listarConteosAsignados({
    required int codigoAlmacen,
    required int codigoUsuario,
    required int codigoConteo,
    required DateTime fechaActualizacion,
  });

  Future<List<ConteoInventario>> buscarConteoPorCodigoConteo(int codeTI);
  Future<ConteoInventario> actualizarStockConteo(int codigoConteoInventario);
  Future<int> guardarConteoInventario(ConteoInventario conteoInventario);

  // Db local
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
