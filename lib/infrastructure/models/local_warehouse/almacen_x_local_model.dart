import 'package:freezed_annotation/freezed_annotation.dart';

part 'almacen_x_local_model.freezed.dart';
part 'almacen_x_local_model.g.dart';

@freezed
class AlmacenXLocalModel with _$AlmacenXLocalModel {
  factory AlmacenXLocalModel({
    required int code,
    required String name,
  }) = _AlmacenXLocalModel;

  factory AlmacenXLocalModel.fromJson(Map<String, Object?> json) =>
      _$AlmacenXLocalModelFromJson(json);
}
