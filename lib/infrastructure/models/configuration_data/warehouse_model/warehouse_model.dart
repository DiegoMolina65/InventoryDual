import 'package:freezed_annotation/freezed_annotation.dart';

part 'warehouse_model.freezed.dart';
part 'warehouse_model.g.dart';

@freezed
class WarehouseModel with _$WarehouseModel {
  factory WarehouseModel({
    required int code,
    required String name,
  }) = _WarehouseModel;

  factory WarehouseModel.fromJson(Map<String, Object?> json) =>
      _$WarehouseModelFromJson(json);
}
