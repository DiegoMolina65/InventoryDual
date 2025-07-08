import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/producto/producto_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/producto/producto_repository_impl.dart';

final productoRepositoryProvider = Provider(
  (ref) {
    return ProductoRepositoryImpl(dataSource: ProductoDatasourceImpl());
  },
);
