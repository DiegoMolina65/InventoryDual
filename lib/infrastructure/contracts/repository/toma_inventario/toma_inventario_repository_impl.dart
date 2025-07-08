import 'package:m_dual_inventario/domain/datasource/toma_inventario/toma_inventario_datasource.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/domain/repository/toma_inventario/toma_inventario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/toma_invetario/toma_inventario_datasource_impl.dart';

class TomaInventarioRepositoryImpl extends TomaInventarioRepository {
  final TomaInventarioDatasource dataSource;

  TomaInventarioRepositoryImpl({TomaInventarioDatasource? dataSource})
      : dataSource = dataSource ?? TomaInventarioDatasourceImpl();

  @override
  Future<List<TomasInventario>> obtenerUltimasTomas(int codigoAlmacen) {
    return dataSource.obtenerUltimasTomas(codigoAlmacen);
  }

  @override
  Future<TomasInventario> buscarTomaInventario(int codigoTomaInventario) {
    return dataSource.buscarTomaInventario(codigoTomaInventario);
  }

  @override
  Future<int> guardarTomaInventario(TomasInventario tomaInventario) {
    return dataSource.guardarTomaInventario(tomaInventario);
  }
}
