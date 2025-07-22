import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/conteo_inventario_mapper/conteo_inventario_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/lista_detalle_producto_mapper/lista_detalle_producto_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/inventory_take/tomas_inventario_model.dart';

class TomasInventarioMapper {
  static TomasInventario mapearListarUltimasToma(
      TomasInventarioModel listarUltimasTomasModel) {
    return TomasInventario(
      codigo: listarUltimasTomasModel.code,
      nombre: listarUltimasTomasModel.name,
      codigoAlmacen: listarUltimasTomasModel.codeWarehouse,
      codigoUsuarioCreador: listarUltimasTomasModel.codeCreator,
      fechaRegistro: listarUltimasTomasModel.dateCreation,
      estado: listarUltimasTomasModel.statusTI,
      tipo: listarUltimasTomasModel.typeTI,
      cantidadProducto: listarUltimasTomasModel.quantityProduct,
      cantidadConteo: listarUltimasTomasModel.quantityCount,
      cantidadConteoFinalizado: listarUltimasTomasModel.quantityCountFinished,
      listaDetalleProducto: listarUltimasTomasModel.listDetailProduct
          ?.map((e) => ListaDetalleProductoMapper.mapearListaDetalleProducto(e))
          .toList(),
      listaConteoInventario: listarUltimasTomasModel.listCountInventory
          ?.map((e) => ConteoInventarioMapper.mapearConteoInventario(e))
          .toList(),
    );
  }

  static TomasInventarioModel mapearAModelo(
      TomasInventario listarUltimasTomasModel) {
    return TomasInventarioModel(
      code: listarUltimasTomasModel.codigo,
      name: listarUltimasTomasModel.nombre,
      codeWarehouse: listarUltimasTomasModel.codigoAlmacen,
      codeCreator: listarUltimasTomasModel.codigoUsuarioCreador,
      dateCreation: listarUltimasTomasModel.fechaRegistro,
      statusTI: listarUltimasTomasModel.estado,
      typeTI: listarUltimasTomasModel.tipo,
      quantityProduct: listarUltimasTomasModel.cantidadProducto,
      quantityCount: listarUltimasTomasModel.cantidadConteo,
      quantityCountFinished: listarUltimasTomasModel.cantidadConteoFinalizado,
      listDetailProduct: listarUltimasTomasModel.listaDetalleProducto
          ?.map(
              (e) => ListaDetalleProductoMapper.mapearAListaDetalleProducto(e))
          .toList(),
      listCountInventory: listarUltimasTomasModel.listaConteoInventario
          ?.map((e) => ConteoInventarioMapper.mapearAConteoInventario(e))
          .toList(),
      
    );
  }
}
