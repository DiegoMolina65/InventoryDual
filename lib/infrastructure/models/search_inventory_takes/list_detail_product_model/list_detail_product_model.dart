import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/infrastructure/models/list_count_results/list_count_results_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';

part 'list_detail_product_model.freezed.dart';
part 'list_detail_product_model.g.dart';

@freezed
class ListDetailProductModel with _$ListDetailProductModel {
  factory ListDetailProductModel({
    required int codeTI,
    required String codeProduct,
    required int codeUnitMeasure,
    required double stock,
    required bool verified,
    required double quantityVerified,
    String? codeBatch,
    required ProductModel product,
    List<ListCountResultsModel>? listCountResults,
  }) = _ListDetailProductModel;

  factory ListDetailProductModel.fromJson(Map<String, Object?> json) =>
      _$ListDetailProductModelFromJson(json);
}