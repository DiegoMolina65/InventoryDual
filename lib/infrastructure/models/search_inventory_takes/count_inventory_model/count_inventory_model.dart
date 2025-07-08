import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_detail_model/count_inventory_detail_model.dart';

part 'count_inventory_model.freezed.dart';
part 'count_inventory_model.g.dart';

@freezed
class CountInventoryModel with _$CountInventoryModel {
  factory CountInventoryModel({
    required int code,
    required int numberCount,
    required int codeTI,
    required int codeWarehouse,
    required int codeUserAsigned,
    required DateTime dateCreation,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String statusCount,
    required String type,
    required String nameTakeInventory,
    required String? workShift,
    required List<CountInventoryDetailModel> lstCountInventoryDetail,
    required Usuario? usuarioAsignado,
  }) = _CountInventoryModel; 

  factory CountInventoryModel.fromJson(Map<String, Object?> json) =>
      _$CountInventoryModelFromJson(json);
}
