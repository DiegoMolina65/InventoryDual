// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchModelImpl _$$BatchModelImplFromJson(Map<String, dynamic> json) =>
    _$BatchModelImpl(
      code: json['code'] as String,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      stock: (json['stock'] as num).toDouble(),
    );

Map<String, dynamic> _$$BatchModelImplToJson(_$BatchModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'stock': instance.stock,
    };
