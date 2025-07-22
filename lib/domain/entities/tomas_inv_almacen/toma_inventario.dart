// ignore_for_file: invalid_annotation_target

import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/lista_conteo_resultados/lista_conteo_resultados_entidad.dart';

part 'toma_inventario.freezed.dart';
part 'toma_inventario.g.dart';

@freezed
class TomasInventario with _$TomasInventario {
  factory TomasInventario({
    required int codigo,
    required String nombre,
    @JsonKey(name: 'codigo_almacen') required int codigoAlmacen,
    @JsonKey(name: 'codigo_usuario_creador') required int codigoUsuarioCreador,
    @JsonKey(name: 'fecha_registro') required DateTime fechaRegistro,
    required String estado,
    required String tipo,
    @JsonKey(name: 'cantidad_producto') required int cantidadProducto,
    @JsonKey(name: 'cantidad_conteo') required int cantidadConteo,
    @JsonKey(name: 'cantidad_conteo_finalizado')
    required int cantidadConteoFinalizado,
    @JsonKey(name: 'lista_detalle_producto')
    List<ListaDetalleProducto>? listaDetalleProducto,
    @JsonKey(name: 'lista_conteo_inventario')
    List<ConteoInventario>? listaConteoInventario,
  }) = _TomasInventario;

  factory TomasInventario.fromJson(Map<String, Object?> json) =>
      _$TomasInventarioFromJson(json);
}
