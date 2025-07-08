// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conteo_inventario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConteoInventarioImpl _$$ConteoInventarioImplFromJson(
        Map<String, dynamic> json) =>
    _$ConteoInventarioImpl(
      codigo: (json['codigo'] as num).toInt(),
      numeroConteo: (json['numero_conteo'] as num).toInt(),
      codigoTI: (json['codigo_ti'] as num).toInt(),
      codigoAlmacen: (json['codigo_almacen'] as num).toInt(),
      codigoUsuarioAsignado: (json['codigo_usuario_asignado'] as num).toInt(),
      fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
      fechaInicio: DateTime.parse(json['fecha_inicio'] as String),
      fechaFin: DateTime.parse(json['fecha_fin'] as String),
      estadoConteo: json['estado_conteo'] as String,
      tipo: json['tipo'] as String,
      nombreTomaInventario: json['nombre_toma_inventario'] as String,
      turnoTrabajo: json['turno_trabajo'] as String?,
      listaDetalleRecuentoInventario:
          (json['lista_detalle_recuento_inventario'] as List<dynamic>)
              .map((e) =>
                  DetalleRecuentoInventario.fromJson(e as Map<String, dynamic>))
              .toList(),
      usuarioAsignado: json['usuario_asignado'] == null
          ? null
          : Usuario.fromJson(json['usuario_asignado'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConteoInventarioImplToJson(
        _$ConteoInventarioImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'numero_conteo': instance.numeroConteo,
      'codigo_ti': instance.codigoTI,
      'codigo_almacen': instance.codigoAlmacen,
      'codigo_usuario_asignado': instance.codigoUsuarioAsignado,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
      'fecha_inicio': instance.fechaInicio.toIso8601String(),
      'fecha_fin': instance.fechaFin.toIso8601String(),
      'estado_conteo': instance.estadoConteo,
      'tipo': instance.tipo,
      'nombre_toma_inventario': instance.nombreTomaInventario,
      'turno_trabajo': instance.turnoTrabajo,
      'lista_detalle_recuento_inventario':
          instance.listaDetalleRecuentoInventario,
      'usuario_asignado': instance.usuarioAsignado,
    };
