import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/unidad_medida/unidad_medida.dart';
import 'package:m_dual_inventario/infrastructure/mappers/batch/batch_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/configuration_data/unit_measure_mapper/unit_measure_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';

class ProductoMapper {
  static Producto mapearProducto(ProductModel productModel) {
    List<UnidadMedida> listaUnidadMedida = productModel.lstUnitMeasure
        .map((unitMeasure) => UnitMeasureMapper.mapearUnitMeasure(unitMeasure))
        .toList();

    List<LotesEntidad> listaLotes = productModel.lstBatch
            ?.map((batch) => BatchMapper.mapearLote(batch))
            .toList() ??
        [];

    return Producto(
        codigo: productModel.code,
        nombre: productModel.name,
        lote: productModel.lote ?? 'Sin lote',
        precio: productModel.price,
        codigoLinea: productModel.codeLine,
        codigoGrupo: productModel.codeGroup,
        codigoSubgrupo: productModel.codeSubgroup,
        codigoUnidadMedidaBase: productModel.codeBaseUnitMeasure,
        codigoMoneda: productModel.currencyCode,
        valorMoneda: productModel.currencyValue ?? '',
        descuento: productModel.discount,
        stock: productModel.stock,
        cantidadRequerida: productModel.quantityRequired,
        codigoBarra: productModel.barCode ?? 'Sin código de barra',
        costo: productModel.cost,
        ubicacion: productModel.ubication ?? 'Sin ubicación',
        pvfr: productModel.pvfr ?? false,
        listaUnidadMedida: listaUnidadMedida,
        listaLotes: listaLotes);
  }

  static ProductModel mapearAProducto(Producto producto) {
    final unidadesMedida = producto.listaUnidadMedida
        .map((unidad) => UnitMeasureMapper.mapearAUnidadMedida(unidad))
        .toList();

    final listaLotes = producto.listaLotes
            ?.map((lote) => BatchMapper.mapearALote(lote))
            .toList() ??
        [];

    return ProductModel(
        code: producto.codigo,
        name: producto.nombre,
        lote: producto.lote,
        price: producto.precio,
        codeLine: producto.codigoLinea,
        codeGroup: producto.codigoGrupo,
        codeSubgroup: producto.codigoSubgrupo,
        codeBaseUnitMeasure: producto.codigoUnidadMedidaBase,
        currencyCode: producto.codigoMoneda,
        currencyValue: producto.valorMoneda,
        discount: producto.descuento,
        stock: producto.stock,
        quantityRequired: producto.cantidadRequerida,
        barCode: producto.codigoBarra,
        cost: producto.costo,
        ubication: producto.ubicacion,
        pvfr: producto.pvfr,
        lstUnitMeasure: unidadesMedida,
        lstBatch: listaLotes);
  }
}
