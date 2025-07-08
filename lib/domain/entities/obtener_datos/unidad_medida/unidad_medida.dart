// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'unidad_medida.freezed.dart';
part 'unidad_medida.g.dart';

@freezed
class UnidadMedida with _$UnidadMedida {
  factory UnidadMedida({
    required int codigo,
    @JsonKey(name: 'codigo_producto') required String codigoProducto,
    required int articulo,
    required double relacion,
    required double descuento,
    required String descripcion,
    @Default(false) bool esBase,
    @Default(1.0) double factorConversion,
  }) = _UnidadMedida;

  factory UnidadMedida.fromJson(Map<String, Object?> json) =>
      _$UnidadMedidaFromJson(json);
}
