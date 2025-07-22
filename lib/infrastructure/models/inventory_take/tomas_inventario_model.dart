import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/infrastructure/models/list_count_results/list_count_results_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_model/count_inventory_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/list_detail_product_model/list_detail_product_model.dart';

part 'tomas_inventario_model.freezed.dart';
part 'tomas_inventario_model.g.dart';

@freezed
class TomasInventarioModel with _$TomasInventarioModel {
  factory TomasInventarioModel({
    required int code,
    required String name,
    required int codeWarehouse,
    String? nameWarehouse,
    required int codeCreator,
    required DateTime dateCreation,
    required String statusTI,
    required String typeTI,
    required int quantityProduct,
    required int quantityCount,
    required int quantityCountFinished,
    List<ListDetailProductModel>? listDetailProduct,
    List<CountInventoryModel>? listCountInventory,
  }) = _TomasInventarioModel;

  factory TomasInventarioModel.fromJson(Map<String, Object?> json) =>
      _$TomasInventarioModelFromJson(json);
}
