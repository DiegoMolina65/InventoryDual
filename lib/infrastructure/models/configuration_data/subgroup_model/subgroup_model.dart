import 'package:freezed_annotation/freezed_annotation.dart';

part 'subgroup_model.freezed.dart';
part 'subgroup_model.g.dart';

@freezed
class SubgroupModel with _$SubgroupModel {
  factory SubgroupModel({
    required int code,
    required String description,
    required int codeLine,
    required int codeGroup,
  }) = _SubgroupModel;

  factory SubgroupModel.fromJson(Map<String, Object?> json) =>
      _$SubgroupModelFromJson(json);
}
