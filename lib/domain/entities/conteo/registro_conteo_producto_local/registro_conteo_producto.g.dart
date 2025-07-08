// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_conteo_producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistroConteoProductoImpl _$$RegistroConteoProductoImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistroConteoProductoImpl(
      codigo: (json['codigo'] as num?)?.toInt(),
      codigoConteo: (json['codigo_conteo'] as num).toInt(),
      codigoProducto: json['codigo_producto'] as String,
      cantidadContada: (json['cantidad_contada'] as num).toDouble(),
      fechaContada: json['fecha_contada'] as String,
      sincronizadoServidor: (json['sincronizado_servidor'] as num).toInt(),
      esConfirmado: (json['es_confirmado'] as num).toInt(),
      codigoLote: json['codigo_lote'] as String,
    );

Map<String, dynamic> _$$RegistroConteoProductoImplToJson(
        _$RegistroConteoProductoImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'codigo_conteo': instance.codigoConteo,
      'codigo_producto': instance.codigoProducto,
      'cantidad_contada': instance.cantidadContada,
      'fecha_contada': instance.fechaContada,
      'sincronizado_servidor': instance.sincronizadoServidor,
      'es_confirmado': instance.esConfirmado,
      'codigo_lote': instance.codigoLote,
    };
