// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'grupo.freezed.dart';
part 'grupo.g.dart';

@freezed
class Grupo with _$Grupo {
  factory Grupo(
          {required int codigo,
          required String descripcion,
          @JsonKey(name: 'linea_codigo') required int lineaCodigo}) =
      _Grupo;

  factory Grupo.fromJson(Map<String, Object?> json) =>
      _$GrupoFromJson(json);
}