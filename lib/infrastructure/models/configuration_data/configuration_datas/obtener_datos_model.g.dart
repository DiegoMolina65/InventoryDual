// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obtener_datos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObtenerDatosModelImpl _$$ObtenerDatosModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ObtenerDatosModelImpl(
      listUnitMeasure: (json['listUnitMeasure'] as List<dynamic>?)
          ?.map((e) => UnitMeasureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listLine: (json['listLine'] as List<dynamic>)
          .map((e) => LineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listGroup: (json['listGroup'] as List<dynamic>)
          .map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listSubGroup: (json['listSubGroup'] as List<dynamic>)
          .map((e) => SubgroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listWarehouse: (json['listWarehouse'] as List<dynamic>)
          .map((e) => WarehouseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ObtenerDatosModelImplToJson(
        _$ObtenerDatosModelImpl instance) =>
    <String, dynamic>{
      'listUnitMeasure': instance.listUnitMeasure,
      'listLine': instance.listLine,
      'listGroup': instance.listGroup,
      'listSubGroup': instance.listSubGroup,
      'listWarehouse': instance.listWarehouse,
    };
