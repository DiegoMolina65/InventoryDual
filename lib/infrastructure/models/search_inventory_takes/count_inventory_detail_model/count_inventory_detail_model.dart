import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/infrastructure/models/batch/batch_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/list_detail_product_model/list_detail_product_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';
import 'package:m_dual_inventario/infrastructure/models/count/detail_count/detail_count_model.dart';
import 'package:m_dual_inventario/infrastructure/models/count/image_count/image_count_model.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/unit_measure_model/unit_measure_model.dart';

part 'count_inventory_detail_model.freezed.dart';
part 'count_inventory_detail_model.g.dart';

@freezed
class CountInventoryDetailModel with _$CountInventoryDetailModel {
  factory CountInventoryDetailModel({
    required int codeCountInventory,
    required String codeProduct,
    required String nameProduct,
    required double quantityStock,
    required double quantityStockInitial,
    required double quantityCount,
    required int? codeUnitMeasure,
    required String observations,
    required bool checkUbication,
    required String correctUbication,
    required String jsonDetailCount,
    required DateTime dateCount,
    required ProductModel? product,
    String? codeBatch,
    List<BatchModel>? lstBatch,
    required List<ImageCountModel>? listImageCount,
    required List<DetailCountModel>? listDetailCount,
    @JsonKey(ignore: true) UnitMeasureModel? umBase,
    @JsonKey(ignore: true) UnitMeasureModel? umLow,
    required int? numberCount,
  }) = _CountInventoryDetailModel;

  factory CountInventoryDetailModel.fromJson(Map<String, Object?> json) =>
      _$CountInventoryDetailModelFromJson(json);

  factory CountInventoryDetailModel.fromListDetailProduct(
      ListDetailProductModel detalle) {
    return CountInventoryDetailModel(
      codeCountInventory: 0,
      codeProduct: detalle.codeProduct,
      nameProduct: detalle.product.name,
      quantityStock: detalle.stock,
      quantityStockInitial: detalle.stock,
      quantityCount: 0.0,
      codeUnitMeasure: detalle.codeUnitMeasure,
      observations: '',
      checkUbication: true,
      correctUbication: detalle.product.ubication ?? '',
      jsonDetailCount: '',
      dateCount: DateTime.now(),
      codeBatch: detalle.codeBatch,
      product: detalle.product,
      listImageCount: [],
      listDetailCount: [],
      umBase: null,
      umLow: null,
      numberCount: null,
    );
  }
}
