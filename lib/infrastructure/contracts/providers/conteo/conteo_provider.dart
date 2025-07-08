import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/conteo/conteo_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/conteo/conteo_repository_impl.dart';

final conteoRepositoryProvider = Provider(
  (ref) {
    return ConteoRepositoryImpl(dataSource: ConteoDatasourceImpl());
  },
);
