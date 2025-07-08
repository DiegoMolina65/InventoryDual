import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/unit_measure_model/unit_measure_model.dart';

class UnitMeasureMapper {
  static UnidadMedida mapearUnitMeasure(
      UnitMeasureModel obtenerDatosModelUnitMeasure) {
    return UnidadMedida(
        codigo: obtenerDatosModelUnitMeasure.code,
        codigoProducto: obtenerDatosModelUnitMeasure.codeProduct,
        articulo: obtenerDatosModelUnitMeasure.item,
        relacion: obtenerDatosModelUnitMeasure.relation,
        descuento: obtenerDatosModelUnitMeasure.discount,
        descripcion: obtenerDatosModelUnitMeasure.description);
  }

  static UnitMeasureModel mapearAUnidadMedida(UnidadMedida unidadMedida) {
    return UnitMeasureModel(
      code: unidadMedida.codigo,
      codeProduct: unidadMedida.codigoProducto,
      item: unidadMedida.articulo,
      relation: unidadMedida.relacion,
      discount: unidadMedida.descuento,
      description: unidadMedida.descripcion,
    );
  }
}
