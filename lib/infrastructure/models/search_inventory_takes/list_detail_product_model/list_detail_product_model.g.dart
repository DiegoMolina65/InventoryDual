// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListDetailProductModelImpl _$$ListDetailProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListDetailProductModelImpl(
      codeTI: (json['codeTI'] as num).toInt(),
      codeProduct: json['codeProduct'] as String,
      codeUnitMeasure: (json['codeUnitMeasure'] as num).toInt(),
      stock: (json['stock'] as num).toDouble(),
      verified: json['verified'] as bool,
      quantityVerified: (json['quantityVerified'] as num).toDouble(),
      codeBatch: json['codeBatch'] as String?,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListDetailProductModelImplToJson(
        _$ListDetailProductModelImpl instance) =>
    <String, dynamic>{
      'codeTI': instance.codeTI,
      'codeProduct': instance.codeProduct,
      'codeUnitMeasure': instance.codeUnitMeasure,
      'stock': instance.stock,
      'verified': instance.verified,
      'quantityVerified': instance.quantityVerified,
      'codeBatch': instance.codeBatch,
      'product': instance.product,
    };
