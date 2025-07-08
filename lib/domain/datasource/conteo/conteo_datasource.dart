import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';

abstract class ConteoDatasource {
  Future<List<ConteoInventario>> listarConteosAsignados({
    required int codigoAlmacen,
    required int codigoUsuario,
    required int codigoConteo,
    required DateTime fechaActualizacion,
  });

  Future<List<ConteoInventario>> buscarConteoPorCodigoConteo(int codeTI);
  Future<ConteoInventario> actualizarStockConteo(int codigoConteoInventario);
  Future<int> guardarConteoInventario(ConteoInventario conteoInventario);
}
