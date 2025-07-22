// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_conteo_resultados_entidad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListaConteoResultadosEntidadImpl _$$ListaConteoResultadosEntidadImplFromJson(
        Map<String, dynamic> json) =>
    _$ListaConteoResultadosEntidadImpl(
      codigoConteoInventario: (json['codigoConteoInventario'] as num).toInt(),
      codigoUsuario: (json['codigoUsuario'] as num).toInt(),
      nombreUsuario: json['nombreUsuario'] as String,
      cantidadContada: (json['cantidadContada'] as num).toDouble(),
    );

Map<String, dynamic> _$$ListaConteoResultadosEntidadImplToJson(
        _$ListaConteoResultadosEntidadImpl instance) =>
    <String, dynamic>{
      'codigoConteoInventario': instance.codigoConteoInventario,
      'codigoUsuario': instance.codigoUsuario,
      'nombreUsuario': instance.nombreUsuario,
      'cantidadContada': instance.cantidadContada,
    };
