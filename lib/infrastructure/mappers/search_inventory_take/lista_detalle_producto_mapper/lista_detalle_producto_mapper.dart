import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/producto_mapper/producto_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/list_detail_product_model/list_detail_product_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';

class ListaDetalleProductoMapper {
  static ListaDetalleProducto mapearListaDetalleProducto(
      ListDetailProductModel productDetailModel) {
    Producto producto =
        ProductoMapper.mapearProducto(productDetailModel.product);

    return ListaDetalleProducto(
      codigoTomaInventario: productDetailModel.codeTI,
      codigoProducto: productDetailModel.codeProduct,
      codigoUnidadMedida: productDetailModel.codeUnitMeasure,
      stock: productDetailModel.stock,
      verificado: productDetailModel.verified,
      codigoLote: productDetailModel.codeBatch,
      cantidadVerificada: productDetailModel.quantityVerified,
      producto: producto,
    );
  }

  static ListDetailProductModel mapearAListaDetalleProducto(
      ListaDetalleProducto listaDetalleProducto) {
    ProductModel producto =
        ProductoMapper.mapearAProducto(listaDetalleProducto.producto);

    return ListDetailProductModel(
      codeTI: listaDetalleProducto.codigoTomaInventario,
      codeProduct: listaDetalleProducto.codigoProducto,
      codeUnitMeasure: listaDetalleProducto.codigoUnidadMedida,
      stock: listaDetalleProducto.stock,
      verified: listaDetalleProducto.verificado,
      codeBatch: listaDetalleProducto.codigoLote,
      quantityVerified: listaDetalleProducto.cantidadVerificada,
      product: producto,
    );
  }
}
