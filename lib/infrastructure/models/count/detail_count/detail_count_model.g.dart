// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailCountModelImpl _$$DetailCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCountModelImpl(
      codeUnitMeasure: (json['codeUnitMeasure'] as num).toInt(),
      nameUnitMeasure: json['nameUnitMeasure'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      quantityBase: (json['quantityBase'] as num).toDouble(),
      timeCount: DateTime.parse(json['timeCount'] as String),
    );

Map<String, dynamic> _$$DetailCountModelImplToJson(
        _$DetailCountModelImpl instance) =>
    <String, dynamic>{
      'codeUnitMeasure': instance.codeUnitMeasure,
      'nameUnitMeasure': instance.nameUnitMeasure,
      'quantity': instance.quantity,
      'quantityBase': instance.quantityBase,
      'timeCount': instance.timeCount.toIso8601String(),
    };
