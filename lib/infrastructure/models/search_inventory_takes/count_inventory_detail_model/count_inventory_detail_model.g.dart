// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_inventory_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountInventoryDetailModelImpl _$$CountInventoryDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountInventoryDetailModelImpl(
      codeCountInventory: (json['codeCountInventory'] as num).toInt(),
      codeProduct: json['codeProduct'] as String,
      nameProduct: json['nameProduct'] as String,
      quantityStock: (json['quantityStock'] as num).toDouble(),
      quantityStockInitial: (json['quantityStockInitial'] as num).toDouble(),
      quantityCount: (json['quantityCount'] as num).toDouble(),
      codeUnitMeasure: (json['codeUnitMeasure'] as num?)?.toInt(),
      observations: json['observations'] as String,
      checkUbication: json['checkUbication'] as bool,
      correctUbication: json['correctUbication'] as String,
      jsonDetailCount: json['jsonDetailCount'] as String,
      dateCount: DateTime.parse(json['dateCount'] as String),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      codeBatch: json['codeBatch'] as String?,
      lstBatch: (json['lstBatch'] as List<dynamic>?)
          ?.map((e) => BatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listImageCount: (json['listImageCount'] as List<dynamic>?)
          ?.map((e) => ImageCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listDetailCount: (json['listDetailCount'] as List<dynamic>?)
          ?.map((e) => DetailCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberCount: (json['numberCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CountInventoryDetailModelImplToJson(
        _$CountInventoryDetailModelImpl instance) =>
    <String, dynamic>{
      'codeCountInventory': instance.codeCountInventory,
      'codeProduct': instance.codeProduct,
      'nameProduct': instance.nameProduct,
      'quantityStock': instance.quantityStock,
      'quantityStockInitial': instance.quantityStockInitial,
      'quantityCount': instance.quantityCount,
      'codeUnitMeasure': instance.codeUnitMeasure,
      'observations': instance.observations,
      'checkUbication': instance.checkUbication,
      'correctUbication': instance.correctUbication,
      'jsonDetailCount': instance.jsonDetailCount,
      'dateCount': instance.dateCount.toIso8601String(),
      'product': instance.product,
      'codeBatch': instance.codeBatch,
      'lstBatch': instance.lstBatch,
      'listImageCount': instance.listImageCount,
      'listDetailCount': instance.listDetailCount,
      'numberCount': instance.numberCount,
    };
