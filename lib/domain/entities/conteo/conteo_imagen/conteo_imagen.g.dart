// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conteo_imagen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConteoImagenImpl _$$ConteoImagenImplFromJson(Map<String, dynamic> json) =>
    _$ConteoImagenImpl(
      codigoProducto: json['codigo_producto'] as String,
      codigoConteoInventario: (json['codigo_conteo_inventario'] as num).toInt(),
      imagen: json['imagen'] as String,
      observacion: json['observacion'] as String,
    );

Map<String, dynamic> _$$ConteoImagenImplToJson(_$ConteoImagenImpl instance) =>
    <String, dynamic>{
      'codigo_producto': instance.codigoProducto,
      'codigo_conteo_inventario': instance.codigoConteoInventario,
      'imagen': instance.imagen,
      'observacion': instance.observacion,
    };
