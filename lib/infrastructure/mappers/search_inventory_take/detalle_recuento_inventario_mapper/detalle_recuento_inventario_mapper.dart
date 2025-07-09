import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/conteo/conteo_detalle/conteo_detalle.dart';
import 'package:m_dual_inventario/domain/entities/conteo/conteo_imagen/conteo_imagen.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/producto_mapper/producto_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/count/conteo_detalle_mapper/conteo_detalle_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/count/conteo_imagen_mapper/conteo_imagen_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_detail_model/count_inventory_detail_model.dart';
import 'package:m_dual_inventario/infrastructure/models/count/detail_count/detail_count_model.dart';
import 'package:m_dual_inventario/infrastructure/models/count/image_count/image_count_model.dart';

class DetalleRecuentoInventarioMapper {
  static DetalleRecuentoInventario mapearDetalleRecuentoInventario(
      CountInventoryDetailModel detailModel) {
    Producto? producto;
    if (detailModel.product != null) {
      producto = ProductoMapper.mapearProducto(detailModel.product!);
    }

    // Convertir lista de imágenes
    List<ConteoImagen>? listaImagenConteo;
    if (detailModel.listImageCount != null) {
      listaImagenConteo = detailModel.listImageCount!
          .map((image) => ConteoImagenMapper.mapearConteoImagen(image))
          .toList();
    }

    // Convertir lista de detalles
    List<ConteoDetalle>? listaDetalleConteo;
    if (detailModel.listDetailCount != null) {
      listaDetalleConteo = detailModel.listDetailCount!
          .map((detail) => ConteoDetalleMapper.mapearConteoDetalle(detail))
          .toList();
    }

    // List<LotesEntidad> listaLotes = detailModel.lstBatch
    //         ?.map((batch) => BatchMapper.mapearLote(batch))
    //         .toList() ??
    //     [];

    return DetalleRecuentoInventario(
      codigoConteoInventario: detailModel.codeCountInventory,
      codigoProducto: detailModel.codeProduct,
      nombreProducto: detailModel.nameProduct,
      cantidadStock: detailModel.quantityStock,
      cantidadStockInicial: detailModel.quantityStockInitial,
      cantidadConteo: detailModel.quantityCount,
      codigoUnidadMedida: detailModel.codeUnitMeasure ?? 0,
      observaciones: detailModel.observations,
      verificarUbicacion: detailModel.checkUbication,
      ubicacionCorrecta: detailModel.correctUbication,
      jsonDetalleConteo: detailModel.jsonDetailCount,
      fechaConteo: detailModel.dateCount,
      codigoLote: detailModel.codeBatch,
      producto: producto,
      listaImagenConteo: listaImagenConteo,
      // listaLotes: listaLotes,
      listaDetalleConteo: listaDetalleConteo,
      umBase: detailModel.umBase,
      umLow: detailModel.umLow,
      numeroConteo: detailModel.numberCount,
    );
  }

  static CountInventoryDetailModel mapearAConteoInventarioDetalle(
      DetalleRecuentoInventario detalleRecuentoInventario) {
    Producto? producto = detalleRecuentoInventario.producto;

    // Convertir lista de imágenes
    List<ImageCountModel>? listaConteoImagen;
    if (detalleRecuentoInventario.listaImagenConteo != null) {
      listaConteoImagen = detalleRecuentoInventario.listaImagenConteo!
          .map((imagen) => ConteoImagenMapper.mapearAConteoImagen(imagen))
          .toList();
    }

    // Convertir lista de detalles
    List<DetailCountModel>? listaConteoDetalle;
    if (detalleRecuentoInventario.listaDetalleConteo != null) {
      listaConteoDetalle = detalleRecuentoInventario.listaDetalleConteo!
          .map((detalle) => ConteoDetalleMapper.mapearAConteoDetalle(detalle))
          .toList();
    }

    // final listaLotes = detalleRecuentoInventario.listaLotes
    //         ?.map((lote) => BatchMapper.mapearALote(lote))
    //         .toList() ??
    //     [];

    return CountInventoryDetailModel(
      codeCountInventory: detalleRecuentoInventario.codigoConteoInventario,
      codeProduct: detalleRecuentoInventario.codigoProducto,
      nameProduct: detalleRecuentoInventario.nombreProducto,
      quantityStock: detalleRecuentoInventario.cantidadStock,
      quantityStockInitial: detalleRecuentoInventario.cantidadStockInicial,
      quantityCount: detalleRecuentoInventario.cantidadConteo,
      codeUnitMeasure: detalleRecuentoInventario.codigoUnidadMedida,
      observations: detalleRecuentoInventario.observaciones,
      checkUbication: detalleRecuentoInventario.verificarUbicacion,
      correctUbication: detalleRecuentoInventario.ubicacionCorrecta,
      jsonDetailCount: detalleRecuentoInventario.jsonDetalleConteo,
      dateCount: detalleRecuentoInventario.fechaConteo,
      codeBatch: detalleRecuentoInventario.codigoLote,
      product:
          producto != null ? ProductoMapper.mapearAProducto(producto) : null,
      // lstBatch: listaLotes,
      listImageCount: listaConteoImagen,
      listDetailCount: listaConteoDetalle,
      umBase: detalleRecuentoInventario.umBase,
      umLow: detalleRecuentoInventario.umLow,
      numberCount: detalleRecuentoInventario.numeroConteo,
    );
  }
}
