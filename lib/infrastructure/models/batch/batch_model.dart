import 'package:freezed_annotation/freezed_annotation.dart';


part 'batch_model.freezed.dart';
part 'batch_model.g.dart';

@freezed
class BatchModel with _$BatchModel {
  factory BatchModel({
    required String code,
    required DateTime expirationDate,
    required double stock,
    required double quantity
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, Object?> json) =>
      _$BatchModelFromJson(json);
}
