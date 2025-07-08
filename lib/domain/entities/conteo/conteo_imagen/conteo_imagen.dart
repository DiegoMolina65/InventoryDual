// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'conteo_imagen.freezed.dart';
part 'conteo_imagen.g.dart';

@freezed
class ConteoImagen with _$ConteoImagen {
  factory ConteoImagen({
    @JsonKey(name: "codigo_producto") required String codigoProducto,
    @JsonKey(name: "codigo_conteo_inventario") required int codigoConteoInventario,
    @JsonKey(name: "imagen") required String imagen,
    @JsonKey(name: "observacion") required String observacion,
  }) = _ConteoImagen;

  factory ConteoImagen.fromJson(Map<String, Object?> json) =>
      _$ConteoImagenFromJson(json);
}
