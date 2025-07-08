import 'package:freezed_annotation/freezed_annotation.dart';

part 'linea.freezed.dart';
part 'linea.g.dart';

@freezed
class Linea with _$Linea {
  factory Linea({
    required int codigo,
    required String descripcion,
  }) = _Linea;
  factory Linea.fromJson(Map<String, Object?> json) =>
      _$LineaFromJson(json);
}