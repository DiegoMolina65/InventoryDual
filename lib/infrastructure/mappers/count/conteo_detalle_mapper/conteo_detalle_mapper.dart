import 'package:m_dual_inventario/domain/entities/conteo/conteo_detalle/conteo_detalle.dart';
import 'package:m_dual_inventario/infrastructure/models/count/detail_count/detail_count_model.dart';

class ConteoDetalleMapper {
  static ConteoDetalle mapearConteoDetalle(DetailCountModel model) {
    return ConteoDetalle(
      codigoUnidadMedida: model.codeUnitMeasure,
      nombreUnidadMedida: model.nameUnitMeasure,
      cantidad: model.quantity,
      cantidadBase: model.quantityBase,
      fechaConteo: model.timeCount,
    );
  }

  static DetailCountModel mapearAConteoDetalle(ConteoDetalle entity) {
    return DetailCountModel(
      codeUnitMeasure: entity.codigoUnidadMedida,
      nameUnitMeasure: entity.nombreUnidadMedida,
      quantity: entity.cantidad,
      quantityBase: entity.cantidadBase,
      timeCount: entity.fechaConteo,
    );
  }
}
