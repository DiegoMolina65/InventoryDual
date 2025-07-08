import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel with _$GroupModel {
  factory GroupModel({
    required int code,
    required String description,
    required int codeLine,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, Object?> json) =>
      _$GroupModelFromJson(json);
}
