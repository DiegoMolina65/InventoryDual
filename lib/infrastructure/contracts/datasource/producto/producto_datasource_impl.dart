import 'package:m_dual_inventario/domain/datasource/producto/producto_datasource.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';
import 'package:m_dual_inventario/infrastructure/services/api_client.dart';

class ProductoDatasourceImpl extends ProductoDatasource {
  final apiClient = ApiCliente();

  @override
  Future<List<ProductModel>> buscarProductosPorAlmacen(
      {required int codigoAlmacen,
      required int codigoLinea,
      required int codigoGrupo,
      required int codigoSubgrupo,
      required String nombreProducto,
      String? ubicacion,
      String? codigoBarra}) async {
    return await apiClient.buscarProductos(
        codigoAlmacen: codigoAlmacen,
        codigoLinea: codigoLinea,
        codigoGrupo: codigoGrupo,
        codigoSubgrupo: codigoSubgrupo,
        nombreProducto: nombreProducto,
        ubicacion: ubicacion,
        codigoBarra: codigoBarra);
  }

  @override
  Future<List<ProductModel>> buscarProductosPorAlmacenXFecha(
      {required int codigoAlmacen,
      DateTime? fecha,
      required int codigoLinea,
      required int codigoGrupo,
      required int codigoSubgrupo,
      required String nombreProducto,
      String? ubicacion,
      String? codigoBarra}) async {
    return await apiClient.buscarProductos(
      codigoAlmacen: codigoAlmacen,
      fechaToma: fecha,
      codigoLinea: codigoLinea,
      codigoGrupo: codigoGrupo,
      codigoSubgrupo: codigoSubgrupo,
      nombreProducto: nombreProducto,
      ubicacion: ubicacion,
      codigoBarra : codigoBarra,
    );
  }
}
