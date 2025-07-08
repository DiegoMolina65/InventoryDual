import 'package:m_dual_inventario/domain/datasource/almacen/almacen_datasource.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/infrastructure/services/api_client.dart';

class AlmacenDatasourceImpl extends AlmacenDatasource {
  final apicliente = ApiCliente();


  @override
  Future<List<AlmacenXLocal>> obtenerDatosAlmacen(int codigoLocal) async {
    return await apicliente.obtenerDatosAlmacen(codigoLocal);
  }
}
