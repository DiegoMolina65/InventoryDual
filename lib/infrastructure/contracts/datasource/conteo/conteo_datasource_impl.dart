import 'package:m_dual_inventario/domain/datasource/conteo/conteo_datasource.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/infrastructure/services/api_client.dart';

class ConteoDatasourceImpl extends ConteoDatasource {
  final apiClient = ApiCliente();

  @override
  Future<List<ConteoInventario>> listarConteosAsignados({
    required int codigoAlmacen,
    required int codigoUsuario,
    required int codigoConteo,
    required DateTime fechaActualizacion,
  }) async {
    return apiClient.listarConteosAsignados(
        codigoAlmacen: codigoAlmacen,
        codigoUsuario: codigoUsuario,
        codigoConteo: codigoConteo,
        fechaActualizacion: fechaActualizacion);
  }

  @override
  Future<List<ConteoInventario>> buscarConteoPorCodigoConteo(int codeTI) async {
    return apiClient.buscarConteoPorCodigoConteo(codeTI);
  }

  @override
  Future<int> guardarConteoInventario(ConteoInventario conteoInventario) async {
    return apiClient.guardarConteoInventario(conteoInventario);
  }

  @override
  Future<ConteoInventario> actualizarStockConteo(
      int codigoConteoInventario) async {
    return apiClient.actualizarStockConteo(codigoConteoInventario);
  }
}
