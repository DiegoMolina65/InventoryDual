// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_detalle_producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListaDetalleProductoImpl _$$ListaDetalleProductoImplFromJson(
        Map<String, dynamic> json) =>
    _$ListaDetalleProductoImpl(
      codigoTomaInventario: (json['codigo_toma_inventario'] as num).toInt(),
      codigoProducto: json['codigo_producto'] as String,
      codigoUnidadMedida: (json['codigo_unidad_medida'] as num).toInt(),
      stock: (json['stock'] as num).toDouble(),
      verificado: json['verificado'] as bool,
      codigoLote: json['codigoLote'] as String?,
      cantidadVerificada: (json['cantidad_verificada'] as num).toDouble(),
      producto: Producto.fromJson(json['producto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListaDetalleProductoImplToJson(
        _$ListaDetalleProductoImpl instance) =>
    <String, dynamic>{
      'codigo_toma_inventario': instance.codigoTomaInventario,
      'codigo_producto': instance.codigoProducto,
      'codigo_unidad_medida': instance.codigoUnidadMedida,
      'stock': instance.stock,
      'verificado': instance.verificado,
      'codigoLote': instance.codigoLote,
      'cantidad_verificada': instance.cantidadVerificada,
      'producto': instance.producto,
    };
