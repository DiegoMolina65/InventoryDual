import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';

abstract class UsuarioDatasource {
  Future<Usuario> loginUsuario(String usuario, String contrasena);
  Future<ObtenerDatosApp> obtenerDatos(String codigoLocal);
  Future<String> obtenerVersionDualInventario();
  Future<List<Usuario>> listaUsuariosPorAlmacen(int codigoAlmacen);
}
