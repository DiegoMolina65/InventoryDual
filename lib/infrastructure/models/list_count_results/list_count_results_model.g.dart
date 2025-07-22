// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_count_results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListCountResultsModelImpl _$$ListCountResultsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListCountResultsModelImpl(
      codeCountInventory: (json['codeCountInventory'] as num).toInt(),
      codeUser: (json['codeUser'] as num).toInt(),
      nameUser: json['nameUser'] as String,
      quantityCount: (json['quantityCount'] as num).toDouble(),
    );

Map<String, dynamic> _$$ListCountResultsModelImplToJson(
        _$ListCountResultsModelImpl instance) =>
    <String, dynamic>{
      'codeCountInventory': instance.codeCountInventory,
      'codeUser': instance.codeUser,
      'nameUser': instance.nameUser,
      'quantityCount': instance.quantityCount,
    };
