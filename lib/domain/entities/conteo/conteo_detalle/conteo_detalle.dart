// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'conteo_detalle.freezed.dart';
part 'conteo_detalle.g.dart';

@freezed
class ConteoDetalle with _$ConteoDetalle {
  factory ConteoDetalle({
    @JsonKey(name: "codigo_unidad_medida") required int codigoUnidadMedida,
    @JsonKey(name: "nombre_unidad_medida") required String nombreUnidadMedida,
    @JsonKey(name: "cantidad") required double cantidad,
    @JsonKey(name: "cantidad_base") required double cantidadBase,
    @JsonKey(name: "fecha_conteo") required DateTime fechaConteo,
  }) = _ConteoDetalle;

  factory ConteoDetalle.fromJson(Map<String, Object?> json) =>
      _$ConteoDetalleFromJson(json);
}
