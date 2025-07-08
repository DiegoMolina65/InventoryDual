// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';

part 'conteo_inventario.freezed.dart';
part 'conteo_inventario.g.dart';

@freezed
class ConteoInventario with _$ConteoInventario {
  factory ConteoInventario({
    required int codigo,
    @JsonKey(name: 'numero_conteo') required int numeroConteo,
    @JsonKey(name: 'codigo_ti') required int codigoTI,
    @JsonKey(name: 'codigo_almacen') required int codigoAlmacen,
    @JsonKey(name: 'codigo_usuario_asignado')
    required int codigoUsuarioAsignado,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
    @JsonKey(name: 'fecha_inicio') required DateTime fechaInicio,
    @JsonKey(name: 'fecha_fin') required DateTime fechaFin,
    @JsonKey(name: 'estado_conteo') required String estadoConteo,
    required String tipo,
    @JsonKey(name: 'nombre_toma_inventario')
    required String nombreTomaInventario,
    @JsonKey(name: 'turno_trabajo') required String? turnoTrabajo,
    @JsonKey(name: 'lista_detalle_recuento_inventario')
    required List<DetalleRecuentoInventario> listaDetalleRecuentoInventario,
    @JsonKey(name: 'usuario_asignado') Usuario? usuarioAsignado,
  }) = _ConteoInventario;

  factory ConteoInventario.fromJson(Map<String, Object?> json) =>
      _$ConteoInventarioFromJson(json);
}
