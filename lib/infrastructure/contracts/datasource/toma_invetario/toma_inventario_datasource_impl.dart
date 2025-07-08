import 'package:m_dual_inventario/domain/datasource/toma_inventario/toma_inventario_datasource.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/infrastructure/services/api_client.dart';

class TomaInventarioDatasourceImpl extends TomaInventarioDatasource {
  final apicliente = ApiCliente();

  @override
  Future<List<TomasInventario>> obtenerUltimasTomas(int codigoAlmacen) async {
    return await apicliente.obtenerUltimasTomas(codigoAlmacen);
  }

  @override
  Future<TomasInventario> buscarTomaInventario(int codigoTomaInventario) async {
    return await apicliente.buscarTomaInventario(codigoTomaInventario);
  }

  @override
  Future<int> guardarTomaInventario(TomasInventario tomaInventario) async {
    return await apicliente.guardarTomaInventario(tomaInventario);
  }
}
