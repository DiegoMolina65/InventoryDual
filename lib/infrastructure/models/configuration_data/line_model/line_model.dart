import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_model.freezed.dart';
part 'line_model.g.dart';

@freezed
class LineModel with _$LineModel {
  factory LineModel({
    required int code,
    required String description,
  }) = _LineModel;

  factory LineModel.fromJson(Map<String, Object?> json) =>
      _$LineModelFromJson(json);
}
