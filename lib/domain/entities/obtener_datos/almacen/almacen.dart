import 'package:freezed_annotation/freezed_annotation.dart';

part 'almacen.freezed.dart';
part 'almacen.g.dart';

@freezed
class Almacen with _$Almacen {
  factory Almacen({
    required int codigo,
    required String nombre,
  }) = _Almacen;

  factory Almacen.fromJson(Map<String, Object?> json) =>
      _$AlmacenFromJson(json);
}
