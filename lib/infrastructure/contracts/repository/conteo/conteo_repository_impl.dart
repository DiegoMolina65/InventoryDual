import 'package:m_dual_inventario/domain/datasource/conteo/conteo_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/conteo/conteo_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';
import 'package:m_dual_inventario/domain/repository/conteo/conteo_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/conteo/conteo_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/conteo/conteo_local_datasource_impl.dart';

class ConteoRepositoryImpl extends ConteoRepository {
  final ConteoDatasource dataSource;
  final ConteoLocalDatasource dataSourceLocal;

  ConteoRepositoryImpl(
      {ConteoDatasource? dataSource, ConteoLocalDatasource? dataSourceLocal})
      : dataSource = dataSource ?? ConteoDatasourceImpl(),
        dataSourceLocal = dataSourceLocal ?? ConteoLocalDatasourceImpl();

  // Remoto
  @override
  Future<List<ConteoInventario>> listarConteosAsignados(
      {required int codigoAlmacen,
      required int codigoUsuario,
      required int codigoConteo,
      required DateTime fechaActualizacion}) {
    return dataSource.listarConteosAsignados(
      codigoAlmacen: codigoAlmacen,
      codigoUsuario: codigoUsuario,
      codigoConteo: codigoConteo,
      fechaActualizacion: fechaActualizacion,
    );
  }

  @override
  Future<List<ConteoInventario>> buscarConteoPorCodigoConteo(int codeTI) {
    return dataSource.buscarConteoPorCodigoConteo(codeTI);
  }

  @override
  Future<ConteoInventario> actualizarStockConteo(int codigoConteoInventario) {
    return dataSource.actualizarStockConteo(codigoConteoInventario);
  }

  @override
  Future<int> guardarConteoInventario(ConteoInventario conteoInventario) {
    return dataSource.guardarConteoInventario(conteoInventario);
  }

  // Db Local
  @override
  Future<bool> guardarRegistroConteoProductoLocal(
    RegistroConteoProducto registro,
  ) {
    return dataSourceLocal.guardarRegistroConteoProductoLocal(registro);
  }

  @override
  Future<List<RegistroConteoProducto>> obtenerRegistrosPendientes() {
    return dataSourceLocal.obtenerRegistrosPendientes();
  }

  @override
  Future<void> marcarSincronizado(List<int> codigos) {
    return dataSourceLocal.marcarSincronizado(codigos);
  }

  @override
  Future<RegistroConteoProducto?> obtenerRegistroConteoProductoPorLote(
      {required int codigoConteo,
      required String codigoProducto,
      required String codigoLote}) {
    return dataSourceLocal.obtenerRegistroConteoProductoPorLote(
        codigoConteo: codigoConteo,
        codigoProducto: codigoProducto,
        codigoLote: codigoLote);
  }
}
