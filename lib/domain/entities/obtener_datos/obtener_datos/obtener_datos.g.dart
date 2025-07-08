// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obtener_datos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObtenerDatosAppImpl _$$ObtenerDatosAppImplFromJson(
        Map<String, dynamic> json) =>
    _$ObtenerDatosAppImpl(
      unidadmedida: (json['unidadmedida'] as List<dynamic>?)
          ?.map((e) => UnidadMedida.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineas: (json['lineas'] as List<dynamic>)
          .map((e) => Linea.fromJson(e as Map<String, dynamic>))
          .toList(),
      grupos: (json['grupos'] as List<dynamic>)
          .map((e) => Grupo.fromJson(e as Map<String, dynamic>))
          .toList(),
      subgrupos: (json['subgrupos'] as List<dynamic>)
          .map((e) => Subgrupo.fromJson(e as Map<String, dynamic>))
          .toList(),
      almacenes: (json['almacenes'] as List<dynamic>)
          .map((e) => Almacen.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ObtenerDatosAppImplToJson(
        _$ObtenerDatosAppImpl instance) =>
    <String, dynamic>{
      'unidadmedida': instance.unidadmedida,
      'lineas': instance.lineas,
      'grupos': instance.grupos,
      'subgrupos': instance.subgrupos,
      'almacenes': instance.almacenes,
    };
