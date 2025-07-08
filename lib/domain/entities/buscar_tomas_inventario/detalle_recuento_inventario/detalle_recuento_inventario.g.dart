// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalle_recuento_inventario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetalleRecuentoInventarioImpl _$$DetalleRecuentoInventarioImplFromJson(
        Map<String, dynamic> json) =>
    _$DetalleRecuentoInventarioImpl(
      codigoConteoInventario: (json['codigo_conteo_inventario'] as num).toInt(),
      codigoProducto: json['codigo_producto'] as String,
      nombreProducto: json['nombre_producto'] as String,
      cantidadStock: (json['cantidad_stock'] as num).toDouble(),
      cantidadStockInicial: (json['cantidad_stock_inicial'] as num).toDouble(),
      cantidadConteo: (json['cantidad_conteo'] as num).toDouble(),
      codigoUnidadMedida: (json['codigo_unidad_medida'] as num?)?.toInt(),
      observaciones: json['observaciones'] as String,
      verificarUbicacion: json['verificar_ubicacion'] as bool,
      ubicacionCorrecta: json['ubicacion_correcta'] as String,
      jsonDetalleConteo: json['json_detalle_conteo'] as String,
      fechaConteo: DateTime.parse(json['fecha_conteo'] as String),
      codigoLote: json['codigoLote'] as String?,
      producto: json['producto'] == null
          ? null
          : Producto.fromJson(json['producto'] as Map<String, dynamic>),
      listaLotes: (json['listaLotes'] as List<dynamic>?)
          ?.map((e) => LotesEntidad.fromJson(e as Map<String, dynamic>))
          .toList(),
      listaImagenConteo: (json['lista_imagen_conteo'] as List<dynamic>?)
          ?.map((e) => ConteoImagen.fromJson(e as Map<String, dynamic>))
          .toList(),
      listaDetalleConteo: (json['lista_detalle_conteo'] as List<dynamic>?)
          ?.map((e) => ConteoDetalle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetalleRecuentoInventarioImplToJson(
        _$DetalleRecuentoInventarioImpl instance) =>
    <String, dynamic>{
      'codigo_conteo_inventario': instance.codigoConteoInventario,
      'codigo_producto': instance.codigoProducto,
      'nombre_producto': instance.nombreProducto,
      'cantidad_stock': instance.cantidadStock,
      'cantidad_stock_inicial': instance.cantidadStockInicial,
      'cantidad_conteo': instance.cantidadConteo,
      'codigo_unidad_medida': instance.codigoUnidadMedida,
      'observaciones': instance.observaciones,
      'verificar_ubicacion': instance.verificarUbicacion,
      'ubicacion_correcta': instance.ubicacionCorrecta,
      'json_detalle_conteo': instance.jsonDetalleConteo,
      'fecha_conteo': instance.fechaConteo.toIso8601String(),
      'codigoLote': instance.codigoLote,
      'producto': instance.producto,
      'listaLotes': instance.listaLotes,
      'lista_imagen_conteo': instance.listaImagenConteo,
      'lista_detalle_conteo': instance.listaDetalleConteo,
    };
