import 'package:freezed_annotation/freezed_annotation.dart';


part 'detail_count_model.freezed.dart';
part 'detail_count_model.g.dart';

@freezed
class DetailCountModel with _$DetailCountModel {
  factory DetailCountModel({
    required int codeUnitMeasure,
    required String nameUnitMeasure,
    required double quantity,
    required double quantityBase,
    required DateTime timeCount,
  }) = _DetailCountModel;

  factory DetailCountModel.fromJson(Map<String, Object?> json) =>
      _$DetailCountModelFromJson(json);
}
