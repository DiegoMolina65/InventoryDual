// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subgrupo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubgrupoImpl _$$SubgrupoImplFromJson(Map<String, dynamic> json) =>
    _$SubgrupoImpl(
      codigo: (json['codigo'] as num).toInt(),
      descripcion: json['descripcion'] as String,
      lineaCodigo: (json['linea_codigo'] as num).toInt(),
      grupoCodigo: (json['grupo_codigo'] as num).toInt(),
    );

Map<String, dynamic> _$$SubgrupoImplToJson(_$SubgrupoImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'descripcion': instance.descripcion,
      'linea_codigo': instance.lineaCodigo,
      'grupo_codigo': instance.grupoCodigo,
    };
