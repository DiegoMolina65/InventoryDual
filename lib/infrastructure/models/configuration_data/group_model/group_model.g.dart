// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      code: (json['code'] as num).toInt(),
      description: json['description'] as String,
      codeLine: (json['codeLine'] as num).toInt(),
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'codeLine': instance.codeLine,
    };
