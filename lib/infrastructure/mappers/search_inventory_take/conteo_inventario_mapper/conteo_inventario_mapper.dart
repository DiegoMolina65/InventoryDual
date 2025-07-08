import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/detalle_recuento_inventario_mapper/detalle_recuento_inventario_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_detail_model/count_inventory_detail_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_model/count_inventory_model.dart';

class ConteoInventarioMapper {
  static ConteoInventario mapearConteoInventario(
      CountInventoryModel countInventoryModel) {
    List<DetalleRecuentoInventario> listaDetalleRecuentoInventario =
        countInventoryModel.lstCountInventoryDetail
            .map((detail) =>
                DetalleRecuentoInventarioMapper.mapearDetalleRecuentoInventario(
                    detail))
            .toList();

    return ConteoInventario(
      codigo: countInventoryModel.code,
      numeroConteo: countInventoryModel.numberCount,
      codigoTI: countInventoryModel.codeTI,
      codigoAlmacen: countInventoryModel.codeWarehouse,
      codigoUsuarioAsignado: countInventoryModel.codeUserAsigned,
      fechaCreacion: countInventoryModel.dateCreation,
      fechaInicio: countInventoryModel.dateStart,
      fechaFin: countInventoryModel.dateEnd,
      estadoConteo: countInventoryModel.statusCount,
      tipo: countInventoryModel.type,
      nombreTomaInventario: countInventoryModel.nameTakeInventory,
      turnoTrabajo: countInventoryModel.workShift,
      listaDetalleRecuentoInventario: listaDetalleRecuentoInventario,
      usuarioAsignado: countInventoryModel.usuarioAsignado,
    );
  }

  static CountInventoryModel mapearAConteoInventario(
      ConteoInventario conteoInventario) {
    List<CountInventoryDetailModel> listaCountInventoryDetail = conteoInventario
        .listaDetalleRecuentoInventario
        .map((detalle) =>
            DetalleRecuentoInventarioMapper.mapearAConteoInventarioDetalle(
                detalle))
        .toList();

    return CountInventoryModel(
      code: conteoInventario.codigo,
      numberCount: conteoInventario.numeroConteo,
      codeTI: conteoInventario.codigoTI,
      codeWarehouse: conteoInventario.codigoAlmacen,
      codeUserAsigned: conteoInventario.codigoUsuarioAsignado,
      dateCreation: conteoInventario.fechaCreacion,
      dateStart: conteoInventario.fechaInicio,
      dateEnd: conteoInventario.fechaFin,
      statusCount: conteoInventario.estadoConteo,
      type: conteoInventario.tipo,
      nameTakeInventory: conteoInventario.nombreTomaInventario,
      workShift: conteoInventario.turnoTrabajo,
      lstCountInventoryDetail: listaCountInventoryDetail,
      usuarioAsignado: conteoInventario.usuarioAsignado,
    );
  }
}
