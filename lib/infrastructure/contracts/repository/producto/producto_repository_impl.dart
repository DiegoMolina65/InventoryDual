import 'package:m_dual_inventario/domain/datasource/producto/producto_datasource.dart';
import 'package:m_dual_inventario/domain/repository/producto/producto_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/datasource/producto/producto_datasource_impl.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';

class ProductoRepositoryImpl extends ProductoRepository {
  final ProductoDatasource dataSource;

  ProductoRepositoryImpl({ProductoDatasource? dataSource})
      : dataSource = dataSource ?? ProductoDatasourceImpl();

  @override
  Future<List<ProductModel>> buscarProductosPorAlmacen(
      {required int codigoAlmacen,
      required int codigoLinea,
      required int codigoGrupo,
      required int codigoSubgrupo,
      required String nombreProducto,
      String? ubicacion,
      String? codigoBarra}) {
    return dataSource.buscarProductosPorAlmacen(
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
      String? codigoBarra}) {
    return dataSource.buscarProductosPorAlmacenXFecha(
        codigoAlmacen: codigoAlmacen,
        fecha: fecha,
        codigoLinea: codigoLinea,
        codigoGrupo: codigoGrupo,
        codigoSubgrupo: codigoSubgrupo,
        nombreProducto: nombreProducto,
        ubicacion: ubicacion,
        codigoBarra: codigoBarra);
  }
}
