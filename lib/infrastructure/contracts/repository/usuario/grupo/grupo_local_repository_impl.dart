import 'package:m_dual_inventario/domain/datasource/usuario/grupo/grupo_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';
import 'package:m_dual_inventario/domain/repository/usuario/grupo/grupo_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/grupo/grupo_local_datasource_impl.dart';

class GrupoLocalRepositoryImpl extends GrupoRepository {
  final GrupoLocalDatasource dataSource;

  GrupoLocalRepositoryImpl({GrupoLocalDatasource? dataSource})
      : dataSource = dataSource ?? GrupoLocalDatasourceImpl();

  @override
  Future<List<Grupo>> obtenerGrupos() async {
    return await dataSource.obtenerGrupos();
  }

  @override
  Future<List<Grupo>> obtenerGruposPorLinea(int codigoLinea) async {
    return await dataSource.obtenerGruposPorLinea(codigoLinea);
  }
}
