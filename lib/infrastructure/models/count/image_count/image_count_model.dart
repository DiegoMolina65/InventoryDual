import 'package:freezed_annotation/freezed_annotation.dart';


part 'image_count_model.freezed.dart';
part 'image_count_model.g.dart';

@freezed
class ImageCountModel with _$ImageCountModel {
  factory ImageCountModel({
    required String codeProduct,
    required int codeCountInventory,
    required String image,
    required String observation,
  }) = _ImageCountModel;

  factory ImageCountModel.fromJson(Map<String, Object?> json) =>
      _$ImageCountModelFromJson(json);
}
