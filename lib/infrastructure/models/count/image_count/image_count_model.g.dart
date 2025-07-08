// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageCountModelImpl _$$ImageCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageCountModelImpl(
      codeProduct: json['codeProduct'] as String,
      codeCountInventory: (json['codeCountInventory'] as num).toInt(),
      image: json['image'] as String,
      observation: json['observation'] as String,
    );

Map<String, dynamic> _$$ImageCountModelImplToJson(
        _$ImageCountModelImpl instance) =>
    <String, dynamic>{
      'codeProduct': instance.codeProduct,
      'codeCountInventory': instance.codeCountInventory,
      'image': instance.image,
      'observation': instance.observation,
    };
