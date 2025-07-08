// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      lote: json['lote'] as String?,
      price: (json['price'] as num).toDouble(),
      codeLine: (json['codeLine'] as num).toInt(),
      codeGroup: (json['codeGroup'] as num).toInt(),
      codeSubgroup: (json['codeSubgroup'] as num).toInt(),
      codeBaseUnitMeasure: (json['codeBaseUnitMeasure'] as num).toInt(),
      currencyCode: (json['currencyCode'] as num).toInt(),
      currencyValue: json['currencyValue'] as String?,
      discount: (json['discount'] as num).toDouble(),
      stock: (json['stock'] as num).toDouble(),
      quantityRequired: (json['quantityRequired'] as num).toDouble(),
      barCode: json['barCode'] as String?,
      cost: (json['cost'] as num).toDouble(),
      ubication: json['ubication'] as String?,
      pvfr: json['pvfr'] as bool?,
      lstUnitMeasure: (json['lstUnitMeasure'] as List<dynamic>)
          .map((e) => UnitMeasureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lstBatch: (json['lstBatch'] as List<dynamic>?)
          ?.map((e) => BatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'lote': instance.lote,
      'price': instance.price,
      'codeLine': instance.codeLine,
      'codeGroup': instance.codeGroup,
      'codeSubgroup': instance.codeSubgroup,
      'codeBaseUnitMeasure': instance.codeBaseUnitMeasure,
      'currencyCode': instance.currencyCode,
      'currencyValue': instance.currencyValue,
      'discount': instance.discount,
      'stock': instance.stock,
      'quantityRequired': instance.quantityRequired,
      'barCode': instance.barCode,
      'cost': instance.cost,
      'ubication': instance.ubication,
      'pvfr': instance.pvfr,
      'lstUnitMeasure': instance.lstUnitMeasure,
      'lstBatch': instance.lstBatch,
    };
