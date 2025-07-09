// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lotes.freezed.dart';
part 'lotes.g.dart';

@freezed
class LotesEntidad with _$LotesEntidad {
  factory LotesEntidad({
      required String codigo,
      @JsonKey(name: 'fecha_expiracion') required DateTime fechaExpiracion,
      required double stock,
      required double cantidad
    }) = _LotesEntidad;

  factory LotesEntidad.fromJson(Map<String, Object?> json) =>
      _$LotesEntidadFromJson(json);
}
