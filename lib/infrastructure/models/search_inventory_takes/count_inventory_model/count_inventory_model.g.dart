// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountInventoryModelImpl _$$CountInventoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountInventoryModelImpl(
      code: (json['code'] as num).toInt(),
      numberCount: (json['numberCount'] as num).toInt(),
      codeTI: (json['codeTI'] as num).toInt(),
      codeWarehouse: (json['codeWarehouse'] as num).toInt(),
      codeUserAsigned: (json['codeUserAsigned'] as num).toInt(),
      dateCreation: DateTime.parse(json['dateCreation'] as String),
      dateStart: DateTime.parse(json['dateStart'] as String),
      dateEnd: DateTime.parse(json['dateEnd'] as String),
      statusCount: json['statusCount'] as String,
      type: json['type'] as String,
      nameTakeInventory: json['nameTakeInventory'] as String,
      workShift: json['workShift'] as String?,
      lstCountInventoryDetail:
          (json['lstCountInventoryDetail'] as List<dynamic>)
              .map((e) =>
                  CountInventoryDetailModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      usuarioAsignado: json['usuarioAsignado'] == null
          ? null
          : Usuario.fromJson(json['usuarioAsignado'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CountInventoryModelImplToJson(
        _$CountInventoryModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'numberCount': instance.numberCount,
      'codeTI': instance.codeTI,
      'codeWarehouse': instance.codeWarehouse,
      'codeUserAsigned': instance.codeUserAsigned,
      'dateCreation': instance.dateCreation.toIso8601String(),
      'dateStart': instance.dateStart.toIso8601String(),
      'dateEnd': instance.dateEnd.toIso8601String(),
      'statusCount': instance.statusCount,
      'type': instance.type,
      'nameTakeInventory': instance.nameTakeInventory,
      'workShift': instance.workShift,
      'lstCountInventoryDetail': instance.lstCountInventoryDetail,
      'usuarioAsignado': instance.usuarioAsignado,
    };
