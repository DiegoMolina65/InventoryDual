// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnidadMedidaImpl _$$UnidadMedidaImplFromJson(Map<String, dynamic> json) =>
    _$UnidadMedidaImpl(
      codigo: (json['codigo'] as num).toInt(),
      codigoProducto: json['codigo_producto'] as String,
      articulo: (json['articulo'] as num).toInt(),
      relacion: (json['relacion'] as num).toDouble(),
      descuento: (json['descuento'] as num).toDouble(),
      descripcion: json['descripcion'] as String,
      esBase: json['esBase'] as bool? ?? false,
      factorConversion: (json['factorConversion'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$UnidadMedidaImplToJson(_$UnidadMedidaImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'codigo_producto': instance.codigoProducto,
      'articulo': instance.articulo,
      'relacion': instance.relacion,
      'descuento': instance.descuento,
      'descripcion': instance.descripcion,
      'esBase': instance.esBase,
      'factorConversion': instance.factorConversion,
    };
