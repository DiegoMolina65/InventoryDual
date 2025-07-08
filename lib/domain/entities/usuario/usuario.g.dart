// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioImpl _$$UsuarioImplFromJson(Map<String, dynamic> json) =>
    _$UsuarioImpl(
      codigo: (json['codigo'] as num).toInt(),
      nombre: json['nombre'] as String,
      codigoLocal: (json['codigo_local'] as num).toInt(),
      nombreLocal: json['nombre_local'] as String,
      codigoAlmacen: (json['codigo_almacen'] as num).toInt(),
      usuario: json['usuario'] as String,
      contrasenia: json['contrasenia'] as String,
      codigoListaPrecios: (json['codigo_lista_precios'] as num).toInt(),
      codigoMoneda: (json['codigo_moneda'] as num).toInt(),
      valorMoneda: (json['valor_moneda'] as num).toDouble(),
      nombreClientePredeterminado:
          json['nombre_cliente_predeterminado'] as String,
      codigoClientePredeterminado:
          (json['codigo_cliente_predeterminado'] as num).toInt(),
      esSupervisor: json['es_supervisor'] as bool,
    );

Map<String, dynamic> _$$UsuarioImplToJson(_$UsuarioImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'codigo_local': instance.codigoLocal,
      'nombre_local': instance.nombreLocal,
      'codigo_almacen': instance.codigoAlmacen,
      'usuario': instance.usuario,
      'contrasenia': instance.contrasenia,
      'codigo_lista_precios': instance.codigoListaPrecios,
      'codigo_moneda': instance.codigoMoneda,
      'valor_moneda': instance.valorMoneda,
      'nombre_cliente_predeterminado': instance.nombreClientePredeterminado,
      'codigo_cliente_predeterminado': instance.codigoClientePredeterminado,
      'es_supervisor': instance.esSupervisor,
    };
