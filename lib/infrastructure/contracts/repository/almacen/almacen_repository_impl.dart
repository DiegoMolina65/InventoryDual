import 'package:m_dual_inventario/domain/datasource/almacen/almacen_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/almacen/almacen_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/repository/almacen/almacen_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/almacen/almacen_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/almacen/almacen_local_datasource_impl.dart';

class AlmacenRepositoryImpl extends AlmacenRepository {
  final AlmacenDatasource dataSource;
  final AlmacenLocalDatasource dataSourcelocal;

  AlmacenRepositoryImpl(
      {AlmacenDatasource? dataSource, AlmacenLocalDatasource? dataSourcelocal})
      : dataSource = dataSource ?? AlmacenDatasourceImpl(),
        dataSourcelocal = dataSourcelocal ?? AlmacenLocalDatasourceImpl();

// sincronizar guardar y obtener enpoint /Almacen/listarActivosPorLocal
  @override
  Future<bool> sincronizarDatosAlmacen(int codigoLocal) async {
    try {
      // Obtener los datos desde la API
      final obtenerDatos = await dataSource.obtenerDatosAlmacen(codigoLocal);

      // Guardar los datos en la base local
      return await dataSourcelocal.guardarDatosAlmacen(obtenerDatos);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AlmacenXLocal>> obtenerAlmacenesPorLocal() async {
    try {
      return await dataSourcelocal.obtenerAlmacenesPorLocal();
    } catch (e) {
      rethrow;
    }
  }
}
