
import 'package:freezed_annotation/freezed_annotation.dart';

part 'almacen_x_local.freezed.dart';
part 'almacen_x_local.g.dart';

@freezed
class AlmacenXLocal with _$AlmacenXLocal {
  factory AlmacenXLocal({
    required int codigo,
    required String nombre,
    
  }) = _AlmacenXLocal;

  factory AlmacenXLocal.fromJson(Map<String, Object?> json) =>
      _$AlmacenXLocalFromJson(json);
}
