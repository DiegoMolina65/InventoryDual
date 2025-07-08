// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductoImpl _$$ProductoImplFromJson(Map<String, dynamic> json) =>
    _$ProductoImpl(
      codigo: json['codigo'] as String,
      nombre: json['nombre'] as String,
      lote: json['lote'] as String,
      precio: (json['precio'] as num).toDouble(),
      codigoLinea: (json['codigo_linea'] as num).toInt(),
      codigoGrupo: (json['codigo_grupo'] as num).toInt(),
      codigoSubgrupo: (json['codigo_subgrupo'] as num).toInt(),
      codigoUnidadMedidaBase:
          (json['codigo_unidad_medida_base'] as num).toInt(),
      codigoMoneda: (json['codigo_moneda'] as num).toInt(),
      valorMoneda: json['valor_moneda'] as String,
      descuento: (json['descuento'] as num).toDouble(),
      stock: (json['stock'] as num).toDouble(),
      ubicacion: json['ubicacion'] as String,
      cantidadRequerida: (json['cantidad_requerida'] as num).toDouble(),
      codigoBarra: json['codigo_barra'] as String,
      costo: (json['costo'] as num).toDouble(),
      pvfr: json['pvfr'] as bool,
      listaUnidadMedida: (json['lista_unidad_medida'] as List<dynamic>)
          .map((e) => UnidadMedida.fromJson(e as Map<String, dynamic>))
          .toList(),
      listaLotes: (json['listaLotes'] as List<dynamic>?)
          ?.map((e) => LotesEntidad.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductoImplToJson(_$ProductoImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'lote': instance.lote,
      'precio': instance.precio,
      'codigo_linea': instance.codigoLinea,
      'codigo_grupo': instance.codigoGrupo,
      'codigo_subgrupo': instance.codigoSubgrupo,
      'codigo_unidad_medida_base': instance.codigoUnidadMedidaBase,
      'codigo_moneda': instance.codigoMoneda,
      'valor_moneda': instance.valorMoneda,
      'descuento': instance.descuento,
      'stock': instance.stock,
      'ubicacion': instance.ubicacion,
      'cantidad_requerida': instance.cantidadRequerida,
      'codigo_barra': instance.codigoBarra,
      'costo': instance.costo,
      'pvfr': instance.pvfr,
      'lista_unidad_medida': instance.listaUnidadMedida,
      'listaLotes': instance.listaLotes,
    };
