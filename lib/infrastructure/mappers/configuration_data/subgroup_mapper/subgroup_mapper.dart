import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/subgroup_model/subgroup_model.dart';

class SubgroupMapper {
    static Subgrupo mapearListSubgroup(
      SubgroupModel obtenerDatosModelListSubGroup) {
    return Subgrupo(
        codigo: obtenerDatosModelListSubGroup.code,
        descripcion: obtenerDatosModelListSubGroup.description,
        lineaCodigo: obtenerDatosModelListSubGroup.codeLine,
        grupoCodigo: obtenerDatosModelListSubGroup.codeGroup);
  }
}
