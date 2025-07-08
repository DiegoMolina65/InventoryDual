import 'package:m_dual_inventario/domain/datasource/usuario/almacen/almacen_local_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/grupo/grupo_local_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/linea/linea_local_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/subgrupo/subgrupo_local_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/unidad_medida/unidad_medida__local_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/usuario/usuario_datasource.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/usuario/usuario_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/domain/repository/usuario/usuario/usuario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/almacen/almacen_local_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/grupo/grupo_local_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/linea/linea_local_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/subgrupo/subgrupo_local_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/unidad_medida/unidad_medida_local_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/usuario/usuario_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/usuario/usuario_local_datasource_impl.dart';

class UsuarioRepositoryImpl extends UsuarioRepository {
  final UsuarioDatasource dataSource;
  final UsuarioLocalDatasource dataSourcelocal;
  final LineaLocalDatasource datasourceLineaLocal;
  final GrupoLocalDatasource datasourceGrupoLocal;
  final SubgrupoLocalDatasource datasourceSubgrupoLocal;
  final AlmacenLocalDatasource datasourceAlmacenLocal;
  final UnidadMedidaLocalDatasource datasourceUnidadMedidaLocal;

  UsuarioRepositoryImpl(
      {UsuarioDatasource? dataSource,
      UsuarioLocalDatasource? dataSourcelocal,
      LineaLocalDatasource? datasourceLineaLocal,
      GrupoLocalDatasource? datasourceGrupoLocal,
      SubgrupoLocalDatasource? datasourceSubgrupoLocal,
      AlmacenLocalDatasource? datasourceAlmacenLocal,
      UnidadMedidaLocalDatasource? datasourceUnidadMedidaLocal})
      : dataSource = dataSource ?? UsuarioDatasourceImpl(),
        dataSourcelocal = dataSourcelocal ?? UsuarioLocalDatasourceImpl(),
        datasourceLineaLocal =
            datasourceLineaLocal ?? LineaLocalDatasourceImpl(),
        datasourceGrupoLocal =
            datasourceGrupoLocal ?? GrupoLocalDatasourceImpl(),
        datasourceSubgrupoLocal =
            datasourceSubgrupoLocal ?? SubgrupoLocalDatasourceImpl(),
        datasourceAlmacenLocal =
            datasourceAlmacenLocal ?? AlmacenLocalDatasourceImpl(),
        datasourceUnidadMedidaLocal =
            datasourceUnidadMedidaLocal ?? UnidadMedidaLocalDatasourceImpl();

  @override
  Future<Usuario> loginUsuario(String usuario, String contrasena) {
    return dataSource.loginUsuario(usuario, contrasena);
  }

  @override
  Future<bool> guardarUsuarioLocal(Usuario usuario) {
    return dataSourcelocal.guardarUsuario(usuario);
  }

  @override
  Future<bool> vaciaLocal() {
    return dataSourcelocal.vaciar();
  }

  @override
  Future<Usuario?> obtenerUsuarioLocal(int codigoUsuario) {
    return dataSourcelocal.obtenerUsuario(codigoUsuario);
  }

  @override
  Future<bool> sincronizarDatosApp(String codigoLocal) async {
    try {
      // Obtener los datos desde la API
      final obtenerDatos = await dataSource.obtenerDatos(codigoLocal);

      // Guardar los datos en la base local
      await datasourceLineaLocal.guardarLinea(obtenerDatos);
      await datasourceGrupoLocal.guardarGrupo(obtenerDatos);
      await datasourceSubgrupoLocal.guardarSubgrupo(obtenerDatos);
      await datasourceAlmacenLocal.guardarAlmacen(obtenerDatos);
      // await datasourceUnidadMedidaLocal.guardarUnidadMedida(obtenerDatos);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> obtenerVersionDualInventario() {
    return dataSource.obtenerVersionDualInventario();
  }

  @override
  Future<List<Usuario>> listaUsuariosPorAlmacen(int codigoAlmacen) {
    return dataSource.listaUsuariosPorAlmacen(codigoAlmacen);
  }
}
