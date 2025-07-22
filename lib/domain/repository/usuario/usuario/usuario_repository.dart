import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';

abstract class UsuarioRepository {
  Future<Usuario> loginUsuario(String usuario, String contrasena);
  Future<bool> guardarUsuarioLocal(Usuario usuario);
  Future<Usuario?> obtenerUsuarioLocal(int codigoUsuario);
  Future<bool> vaciaLocal();
  Future<bool> sincronizarDatosApp(String codigoLocal);
  Future<String> obtenerVersionDualInventario();
  Future<List<Usuario>> listaUsuariosPorAlmacen(int codigoAlmacen);
}
