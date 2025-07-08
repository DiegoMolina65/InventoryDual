// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'subgrupo.freezed.dart';
part 'subgrupo.g.dart';

@freezed
class Subgrupo with _$Subgrupo {
  factory Subgrupo(
      {required int codigo,
      required String descripcion,
      @JsonKey(name: 'linea_codigo') required int lineaCodigo,
      @JsonKey(name: 'grupo_codigo') required int grupoCodigo}) = _Subgrupo;

  factory Subgrupo.fromJson(Map<String, Object?> json) =>
      _$SubgrupoFromJson(json);
}
