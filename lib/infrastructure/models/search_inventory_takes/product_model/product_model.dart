import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/infrastructure/models/batch/batch_model.dart';

import 'package:m_dual_inventario/infrastructure/models/configuration_data/unit_measure_model/unit_measure_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required String code,
    required String name,
    String? lote,
    required double price,
    required int codeLine,
    required int codeGroup,
    required int codeSubgroup,
    required int codeBaseUnitMeasure,
    required int currencyCode,
    String? currencyValue,
    required double discount,
    required double stock,
    required double quantityRequired,
    String? barCode,
    required double cost,
    String? ubication,
    bool? pvfr,
    required List<UnitMeasureModel> lstUnitMeasure,
    List<BatchModel>? lstBatch
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
