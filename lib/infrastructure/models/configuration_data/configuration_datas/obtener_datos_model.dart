import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/group_model/group_model.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/line_model/line_model.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/subgroup_model/subgroup_model.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/unit_measure_model/unit_measure_model.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/warehouse_model/warehouse_model.dart';

part 'obtener_datos_model.freezed.dart';
part 'obtener_datos_model.g.dart';

@freezed
class ObtenerDatosModel with _$ObtenerDatosModel {
  factory ObtenerDatosModel({
    List<UnitMeasureModel>? listUnitMeasure,
    required List<LineModel> listLine,
    required List<GroupModel> listGroup,
    required List<SubgroupModel> listSubGroup,
    required List<WarehouseModel> listWarehouse,
  }) = _ObtenerDatosModel;

  factory ObtenerDatosModel.fromJson(Map<String, Object?> json) =>
      _$ObtenerDatosModelFromJson(json);
}