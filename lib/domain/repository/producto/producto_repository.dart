import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';

abstract class ProductoRepository {
  Future<List<ProductModel>> buscarProductosPorAlmacen({
    required int codigoAlmacen,
    required int codigoLinea,
    required int codigoGrupo,
    required int codigoSubgrupo,
    required String nombreProducto,
    String? ubicacion,
    String? codigoBarra,
  });

  Future<List<ProductModel>> buscarProductosPorAlmacenXFecha({
    required int codigoAlmacen,
    DateTime? fecha,
    required int codigoLinea,
    required int codigoGrupo,
    required int codigoSubgrupo,
    required String nombreProducto,
    String? ubicacion,
    String? codigoBarra,
  });
}
