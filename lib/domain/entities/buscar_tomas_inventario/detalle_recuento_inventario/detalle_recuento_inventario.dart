// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/conteo/conteo_detalle/conteo_detalle.dart';
import 'package:m_dual_inventario/domain/entities/conteo/conteo_imagen/conteo_imagen.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/unit_measure_model/unit_measure_model.dart';

part 'detalle_recuento_inventario.freezed.dart';
part 'detalle_recuento_inventario.g.dart';

@freezed
class DetalleRecuentoInventario with _$DetalleRecuentoInventario {
  factory DetalleRecuentoInventario(
      {@JsonKey(name: 'codigo_conteo_inventario')
      required int codigoConteoInventario,
      @JsonKey(name: 'codigo_producto') required String codigoProducto,
      @JsonKey(name: 'nombre_producto') required String nombreProducto,
      @JsonKey(name: 'cantidad_stock') required double cantidadStock,
      @JsonKey(name: 'cantidad_stock_inicial')
      required double cantidadStockInicial,
      @JsonKey(name: 'cantidad_conteo') required double cantidadConteo,
      @JsonKey(name: 'codigo_unidad_medida') required int? codigoUnidadMedida,
      required String observaciones,
      @JsonKey(name: 'verificar_ubicacion') required bool verificarUbicacion,
      @JsonKey(name: 'ubicacion_correcta') required String ubicacionCorrecta,
      @JsonKey(name: 'json_detalle_conteo') required String jsonDetalleConteo,
      @JsonKey(name: 'fecha_conteo') required DateTime fechaConteo,
      String? codigoLote,
      required Producto? producto,
      // List<LotesEntidad>? listaLotes, // SOLO LECTURA
      @JsonKey(name: 'lista_imagen_conteo')
      List<ConteoImagen>? listaImagenConteo,
      @JsonKey(name: 'lista_detalle_conteo')
      List<ConteoDetalle>? listaDetalleConteo,
      @JsonKey(ignore: true, name: 'um_base') UnitMeasureModel? umBase,
      @JsonKey(ignore: true, name: 'um_low') UnitMeasureModel? umLow,
      @JsonKey(ignore: true, name: 'numero_conteo') int? numeroConteo,
      @JsonKey(ignore: true, name: 'es_confirmado')
      bool? esConfirmado}) = _DetalleRecuentoInventario;

  factory DetalleRecuentoInventario.fromJson(Map<String, Object?> json) =>
      _$DetalleRecuentoInventarioFromJson(json);
}
