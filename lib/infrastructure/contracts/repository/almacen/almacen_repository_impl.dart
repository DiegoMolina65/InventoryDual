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

  @override
  Future<bool> sincronizarDatosAlmacen(
      int codigoLocal, int codigoUsuario) async {
    try {
      // Obtener los datos desde la API
      final obtenerDatos =
          await dataSource.obtenerDatosAlmacen(codigoLocal, codigoUsuario);

      // Guardar los datos en la base local
      return await dataSourcelocal.guardarDatosAlmacen(obtenerDatos);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AlmacenXLocal>> obtenerAlmacenesPorLocal(
      {bool incluirOpcionTodos = false}) async {
    try {
      List<AlmacenXLocal> listaAlmacenes =
          await dataSourcelocal.obtenerAlmacenesPorLocal();

      listaAlmacenes = [
        if (incluirOpcionTodos) AlmacenXLocal(codigo: 0, nombre: 'TODOS'),
        ...listaAlmacenes
      ];

      return listaAlmacenes;
    } catch (e) {
      rethrow;
    }
  }
}
