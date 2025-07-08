import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/usuario/usuario/usuario_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/usuario/usuario_repository_impl.dart';

final usuarioRepositoryProvider = Provider(
  (ref) {
    return UsuarioRepositoryImpl(dataSource: UsuarioDatasourceImpl());
  },
);
