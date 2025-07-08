import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/group_model/group_model.dart';

class GroupMapper {
  static Grupo mapearListGroup(GroupModel obtenerDatosModelListGroup) {
    return Grupo(
        codigo: obtenerDatosModelListGroup.code,
        descripcion: obtenerDatosModelListGroup.description,
        lineaCodigo: obtenerDatosModelListGroup.codeLine);
  }
}
