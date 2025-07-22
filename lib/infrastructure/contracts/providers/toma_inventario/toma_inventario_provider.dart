import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/toma_inventario/toma_inventario_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/toma_inventario/toma_inventario_repository_impl.dart';

final tomaInventarioRepositoryProvider = Provider(
  (ref) {
    return TomaInventarioRepositoryImpl(dataSource: TomaInventarioDatasourceImpl());
  },
);
