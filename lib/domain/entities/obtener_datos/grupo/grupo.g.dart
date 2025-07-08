// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrupoImpl _$$GrupoImplFromJson(Map<String, dynamic> json) => _$GrupoImpl(
      codigo: (json['codigo'] as num).toInt(),
      descripcion: json['descripcion'] as String,
      lineaCodigo: (json['linea_codigo'] as num).toInt(),
    );

Map<String, dynamic> _$$GrupoImplToJson(_$GrupoImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'descripcion': instance.descripcion,
      'linea_codigo': instance.lineaCodigo,
    };
