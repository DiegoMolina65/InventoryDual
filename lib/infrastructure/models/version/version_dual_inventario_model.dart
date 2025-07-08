import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_dual_inventario_model.freezed.dart';
part 'version_dual_inventario_model.g.dart';

@freezed
class VersionDualInventarioModel with _$VersionDualInventarioModel {
  const factory VersionDualInventarioModel({
    required String version,
  }) = _VersionDualInventarioModel;

  factory VersionDualInventarioModel.fromJson(Map<String, dynamic> json) =>
      _$VersionDualInventarioModelFromJson(json);
}
