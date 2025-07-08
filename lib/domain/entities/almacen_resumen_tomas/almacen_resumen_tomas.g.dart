// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'almacen_resumen_tomas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlmacenResumenTomasImpl _$$AlmacenResumenTomasImplFromJson(
        Map<String, dynamic> json) =>
    _$AlmacenResumenTomasImpl(
      almacen: AlmacenXLocal.fromJson(json['almacen'] as Map<String, dynamic>),
      pendientes: (json['pendientes'] as num).toInt(),
      contando: (json['contando'] as num).toInt(),
      finalizados: (json['finalizados'] as num).toInt(),
    );

Map<String, dynamic> _$$AlmacenResumenTomasImplToJson(
        _$AlmacenResumenTomasImpl instance) =>
    <String, dynamic>{
      'almacen': instance.almacen,
      'pendientes': instance.pendientes,
      'contando': instance.contando,
      'finalizados': instance.finalizados,
    };
