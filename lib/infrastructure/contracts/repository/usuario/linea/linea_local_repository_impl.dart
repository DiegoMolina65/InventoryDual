import 'package:m_dual_inventario/domain/datasource/usuario/linea/linea_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/linea/linea.dart';
import 'package:m_dual_inventario/domain/repository/usuario/linea/linea_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/linea/linea_local_datasource_impl.dart';

class LineaLocalRepositoryImpl extends LineaRepository {
  final LineaLocalDatasource dataSource;

  LineaLocalRepositoryImpl({LineaLocalDatasource? dataSource})
      : dataSource = dataSource ?? LineaLocalDatasourceImpl();

  @override
  Future<List<Linea>> obtenerLineas() async {
    return await dataSource.obtenerLineas();
  }
}
