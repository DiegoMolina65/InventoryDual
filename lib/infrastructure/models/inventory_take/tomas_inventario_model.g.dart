// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tomas_inventario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TomasInventarioModelImpl _$$TomasInventarioModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TomasInventarioModelImpl(
      code: (json['code'] as num).toInt(),
      name: json['name'] as String,
      codeWarehouse: (json['codeWarehouse'] as num).toInt(),
      nameWarehouse: json['nameWarehouse'] as String?,
      codeCreator: (json['codeCreator'] as num).toInt(),
      dateCreation: DateTime.parse(json['dateCreation'] as String),
      statusTI: json['statusTI'] as String,
      typeTI: json['typeTI'] as String,
      quantityProduct: (json['quantityProduct'] as num).toInt(),
      quantityCount: (json['quantityCount'] as num).toInt(),
      quantityCountFinished: (json['quantityCountFinished'] as num).toInt(),
      listDetailProduct: (json['listDetailProduct'] as List<dynamic>?)
          ?.map(
              (e) => ListDetailProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listCountInventory: (json['listCountInventory'] as List<dynamic>?)
          ?.map((e) => CountInventoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TomasInventarioModelImplToJson(
        _$TomasInventarioModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'codeWarehouse': instance.codeWarehouse,
      'nameWarehouse': instance.nameWarehouse,
      'codeCreator': instance.codeCreator,
      'dateCreation': instance.dateCreation.toIso8601String(),
      'statusTI': instance.statusTI,
      'typeTI': instance.typeTI,
      'quantityProduct': instance.quantityProduct,
      'quantityCount': instance.quantityCount,
      'quantityCountFinished': instance.quantityCountFinished,
      'listDetailProduct': instance.listDetailProduct,
      'listCountInventory': instance.listCountInventory,
    };
