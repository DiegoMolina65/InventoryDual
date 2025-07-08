// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_measure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitMeasureModelImpl _$$UnitMeasureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitMeasureModelImpl(
      code: (json['code'] as num).toInt(),
      codeProduct: json['codeProduct'] as String,
      item: (json['item'] as num).toInt(),
      relation: (json['relation'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$UnitMeasureModelImplToJson(
        _$UnitMeasureModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'codeProduct': instance.codeProduct,
      'item': instance.item,
      'relation': instance.relation,
      'discount': instance.discount,
      'description': instance.description,
    };
