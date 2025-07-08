import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_measure_model.freezed.dart';
part 'unit_measure_model.g.dart';

@freezed
class UnitMeasureModel with _$UnitMeasureModel {
  factory UnitMeasureModel({
    required int code,
    required String codeProduct,
    required int item,
    required double relation,
    required double discount,
    required String description,
  }) = _UnitMeasureModel;

  factory UnitMeasureModel.fromJson(Map<String, Object?> json) =>
      _$UnitMeasureModelFromJson(json);
}
