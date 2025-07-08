// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'registro_conteo_producto.freezed.dart';
part 'registro_conteo_producto.g.dart';

@freezed
class RegistroConteoProducto with _$RegistroConteoProducto {
  factory RegistroConteoProducto({
    int? codigo,
    @JsonKey(name: 'codigo_conteo') required int codigoConteo,
    @JsonKey(name: 'codigo_producto') required String codigoProducto,
    @JsonKey(name: 'cantidad_contada') required double cantidadContada,
    @JsonKey(name: 'fecha_contada') required String fechaContada,
    @JsonKey(name: 'sincronizado_servidor') required int sincronizadoServidor,
    @JsonKey(name: 'es_confirmado') required int esConfirmado,
    @JsonKey(name: 'codigo_lote') required String codigoLote,
  }) = _RegistroConteoProducto;

  factory RegistroConteoProducto.fromJson(Map<String, Object?> json) =>
      _$RegistroConteoProductoFromJson(json);
}
