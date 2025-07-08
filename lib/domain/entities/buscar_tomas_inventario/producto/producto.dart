// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';

import 'package:m_dual_inventario/domain/entities/obtener_datos/unidad_medida/unidad_medida.dart';

part 'producto.freezed.dart';
part 'producto.g.dart';

@freezed
class Producto with _$Producto {
  factory Producto({
    required String codigo,
    required String nombre,
    required String lote,
    required double precio,
    @JsonKey(name: 'codigo_linea') required int codigoLinea,
    @JsonKey(name: 'codigo_grupo') required int codigoGrupo,
    @JsonKey(name: 'codigo_subgrupo') required int codigoSubgrupo,
    @JsonKey(name: 'codigo_unidad_medida_base')
    required int codigoUnidadMedidaBase,
    @JsonKey(name: 'codigo_moneda') required int codigoMoneda,
    @JsonKey(name: 'valor_moneda') required String valorMoneda,
    required double descuento,
    required double stock,
    required String ubicacion,
    @JsonKey(name: 'cantidad_requerida') required double cantidadRequerida,
    @JsonKey(name: 'codigo_barra') required String codigoBarra,
    required double costo,
    required bool pvfr,
    @JsonKey(name: 'lista_unidad_medida')
    required List<UnidadMedida> listaUnidadMedida,
    List<LotesEntidad>? listaLotes,
  }) = _Producto;

  const Producto._();

  factory Producto.fromJson(Map<String, Object?> json) =>
      _$ProductoFromJson(json);

  @override
  bool operator ==(Object other) {
    if (other is! Producto) {
      return false;
    }
    return codigo == other.codigo;
  }

  @override
  int get hashCode => codigo.hashCode;
}
