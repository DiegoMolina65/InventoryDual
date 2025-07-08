// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conteo_detalle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConteoDetalleImpl _$$ConteoDetalleImplFromJson(Map<String, dynamic> json) =>
    _$ConteoDetalleImpl(
      codigoUnidadMedida: (json['codigo_unidad_medida'] as num).toInt(),
      nombreUnidadMedida: json['nombre_unidad_medida'] as String,
      cantidad: (json['cantidad'] as num).toDouble(),
      cantidadBase: (json['cantidad_base'] as num).toDouble(),
      fechaConteo: DateTime.parse(json['fecha_conteo'] as String),
    );

Map<String, dynamic> _$$ConteoDetalleImplToJson(_$ConteoDetalleImpl instance) =>
    <String, dynamic>{
      'codigo_unidad_medida': instance.codigoUnidadMedida,
      'nombre_unidad_medida': instance.nombreUnidadMedida,
      'cantidad': instance.cantidad,
      'cantidad_base': instance.cantidadBase,
      'fecha_conteo': instance.fechaConteo.toIso8601String(),
    };
