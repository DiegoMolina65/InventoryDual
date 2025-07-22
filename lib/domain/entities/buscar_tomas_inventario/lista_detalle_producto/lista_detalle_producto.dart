// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/lista_conteo_resultados/lista_conteo_resultados_entidad.dart';

part 'lista_detalle_producto.freezed.dart';
part 'lista_detalle_producto.g.dart';

@freezed
class ListaDetalleProducto with _$ListaDetalleProducto {
  factory ListaDetalleProducto({
    @JsonKey(name: 'codigo_toma_inventario') required int codigoTomaInventario,
    @JsonKey(name: 'codigo_producto') required String codigoProducto,
    @JsonKey(name: 'codigo_unidad_medida') required int codigoUnidadMedida,
    required double stock,
    required bool verificado,
    String? codigoLote,
    @JsonKey(name: 'cantidad_verificada') required double cantidadVerificada,
    required Producto producto,
    @JsonKey(name: 'lista_conteo_resultado')
    List<ListaConteoResultadosEntidad>? listaConteoResultado,
  }) = _ListaDetalleProducto;

  factory ListaDetalleProducto.fromJson(Map<String, Object?> json) =>
      _$ListaDetalleProductoFromJson(json);
}
