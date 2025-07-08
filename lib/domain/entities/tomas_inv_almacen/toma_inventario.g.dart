// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toma_inventario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TomasInventarioImpl _$$TomasInventarioImplFromJson(
        Map<String, dynamic> json) =>
    _$TomasInventarioImpl(
      codigo: (json['codigo'] as num).toInt(),
      nombre: json['nombre'] as String,
      codigoAlmacen: (json['codigo_almacen'] as num).toInt(),
      codigoUsuarioCreador: (json['codigo_usuario_creador'] as num).toInt(),
      fechaRegistro: DateTime.parse(json['fecha_registro'] as String),
      estado: json['estado'] as String,
      tipo: json['tipo'] as String,
      cantidadProducto: (json['cantidad_producto'] as num).toInt(),
      cantidadConteo: (json['cantidad_conteo'] as num).toInt(),
      cantidadConteoFinalizado:
          (json['cantidad_conteo_finalizado'] as num).toInt(),
      listaDetalleProducto: (json['lista_detalle_producto'] as List<dynamic>?)
          ?.map((e) => ListaDetalleProducto.fromJson(e as Map<String, dynamic>))
          .toList(),
      listaConteoInventario: (json['lista_conteo_inventario'] as List<dynamic>?)
          ?.map((e) => ConteoInventario.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TomasInventarioImplToJson(
        _$TomasInventarioImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'codigo_almacen': instance.codigoAlmacen,
      'codigo_usuario_creador': instance.codigoUsuarioCreador,
      'fecha_registro': instance.fechaRegistro.toIso8601String(),
      'estado': instance.estado,
      'tipo': instance.tipo,
      'cantidad_producto': instance.cantidadProducto,
      'cantidad_conteo': instance.cantidadConteo,
      'cantidad_conteo_finalizado': instance.cantidadConteoFinalizado,
      'lista_detalle_producto': instance.listaDetalleProducto,
      'lista_conteo_inventario': instance.listaConteoInventario,
    };
