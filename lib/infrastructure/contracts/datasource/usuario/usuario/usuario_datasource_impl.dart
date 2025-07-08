import 'package:m_dual_inventario/domain/datasource/usuario/usuario/usuario_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/infrastructure/services/api_client.dart';

class UsuarioDatasourceImpl extends UsuarioDatasource {
  // final dioService = DioApiExternoService();
  final apicliente = ApiCliente();

  @override
  Future<Usuario> loginUsuario(String usuario, String contrasena) async {
    return await apicliente.login(usuario, contrasena);
  }

  @override
  Future<ObtenerDatosApp> obtenerDatos(String codigoLocal) async {
    return await apicliente.obtenerDatosApp(codigoLocal);
  }

  @override
  Future<String> obtenerVersionDualInventario() async {
    return await apicliente.obtenerVersionDualInventario();
  }
  
  @override
  Future<List<Usuario>> listaUsuariosPorAlmacen(int codigoAlmacen) async {
    return await apicliente.listaUsuariosPorAlmacen(codigoAlmacen);
  }
}
