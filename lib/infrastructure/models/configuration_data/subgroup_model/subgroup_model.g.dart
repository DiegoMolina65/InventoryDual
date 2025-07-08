// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subgroup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubgroupModelImpl _$$SubgroupModelImplFromJson(Map<String, dynamic> json) =>
    _$SubgroupModelImpl(
      code: (json['code'] as num).toInt(),
      description: json['description'] as String,
      codeLine: (json['codeLine'] as num).toInt(),
      codeGroup: (json['codeGroup'] as num).toInt(),
    );

Map<String, dynamic> _$$SubgroupModelImplToJson(_$SubgroupModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'codeLine': instance.codeLine,
      'codeGroup': instance.codeGroup,
    };
