import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';

abstract class UsuarioLocalDatasource {
  Future<bool> guardarUsuario(Usuario usuario);
  Future<bool> vaciar();
  Future<Usuario?> obtenerUsuario(int codigoUsuario);
}
