// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioModelImpl _$$UsuarioModelImplFromJson(Map<String, dynamic> json) =>
    _$UsuarioModelImpl(
      code: (json['code'] as num).toInt(),
      name: json['name'] as String,
      localCode: (json['localCode'] as num).toInt(),
      localName: json['localName'] as String,
      warehouseCode: (json['warehouseCode'] as num).toInt(),
      nick: json['nick'] as String?,
      password: json['password'] as String?,
      priceListCode: (json['priceListCode'] as num).toInt(),
      currencyCode: (json['currencyCode'] as num).toInt(),
      currencyValue: (json['currencyValue'] as num).toDouble(),
      nameDefaultCustomer: json['nameDefaultCustomer'] as String?,
      codeDefaultCustomer: (json['codeDefaultCustomer'] as num).toInt(),
      isSupervisor: json['isSupervisor'] as bool,
    );

Map<String, dynamic> _$$UsuarioModelImplToJson(_$UsuarioModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'localCode': instance.localCode,
      'localName': instance.localName,
      'warehouseCode': instance.warehouseCode,
      'nick': instance.nick,
      'password': instance.password,
      'priceListCode': instance.priceListCode,
      'currencyCode': instance.currencyCode,
      'currencyValue': instance.currencyValue,
      'nameDefaultCustomer': instance.nameDefaultCustomer,
      'codeDefaultCustomer': instance.codeDefaultCustomer,
      'isSupervisor': instance.isSupervisor,
    };
