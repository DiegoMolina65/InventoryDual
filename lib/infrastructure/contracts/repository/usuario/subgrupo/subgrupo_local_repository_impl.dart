import 'package:m_dual_inventario/domain/datasource/usuario/subgrupo/subgrupo_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';
import 'package:m_dual_inventario/domain/repository/usuario/sub_grupo/sub_grupo_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/subgrupo/subgrupo_local_datasource_impl.dart';

class SubgrupoLocalRepositoryImpl extends SubGrupoRepository {
  final SubgrupoLocalDatasource dataSource;

  SubgrupoLocalRepositoryImpl({SubgrupoLocalDatasource? dataSource})
      : dataSource = dataSource ?? SubgrupoLocalDatasourceImpl();
  @override
  Future<List<Subgrupo>> obtenerSubgruposPorGrupo(int codigoGrupo) async {
    return await dataSource.obtenerSubgruposPorGrupo(codigoGrupo);
  }
  
  @override
  Future<List<Subgrupo>> obtenerSubgrupos() async {
    return await dataSource.obtenerSubgrupos();
  }
}
