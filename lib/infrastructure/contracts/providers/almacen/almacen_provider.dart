import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/almacen/almacen_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/almacen/almacen_repository_impl.dart';

final almacenRepositoryProvider = Provider(
  (ref) {
    return AlmacenRepositoryImpl(dataSource: AlmacenDatasourceImpl());
  },
);
