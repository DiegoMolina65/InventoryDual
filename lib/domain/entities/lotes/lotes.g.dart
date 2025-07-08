// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lotes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LotesEntidadImpl _$$LotesEntidadImplFromJson(Map<String, dynamic> json) =>
    _$LotesEntidadImpl(
      codigo: json['codigo'] as String,
      fechaExpiracion: DateTime.parse(json['fecha_expiracion'] as String),
      stock: (json['stock'] as num).toDouble(),
    );

Map<String, dynamic> _$$LotesEntidadImplToJson(_$LotesEntidadImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'fecha_expiracion': instance.fechaExpiracion.toIso8601String(),
      'stock': instance.stock,
    };
