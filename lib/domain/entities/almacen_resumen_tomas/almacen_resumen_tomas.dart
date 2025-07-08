import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';


part 'almacen_resumen_tomas.freezed.dart';
part 'almacen_resumen_tomas.g.dart';

@freezed
class AlmacenResumenTomas with _$AlmacenResumenTomas {
  factory AlmacenResumenTomas({
    required AlmacenXLocal almacen,
    required int pendientes,
    required int contando,
    required int finalizados,
  }) = _AlmacenResumenTomas;

  factory AlmacenResumenTomas.fromJson(Map<String, dynamic> json) =>
      _$AlmacenResumenTomasFromJson(json);
}
