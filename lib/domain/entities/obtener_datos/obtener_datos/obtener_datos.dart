import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';

part 'obtener_datos.freezed.dart';
part 'obtener_datos.g.dart';

@freezed
class ObtenerDatosApp with _$ObtenerDatosApp {
  factory ObtenerDatosApp({
    List<UnidadMedida>? unidadmedida,
    required List<Linea> lineas,
    required List<Grupo> grupos,
    required List<Subgrupo> subgrupos,
    required List<Almacen> almacenes,
  }) = _ObtenerDatosApp;

  factory ObtenerDatosApp.fromJson(Map<String, Object?> json) =>
      _$ObtenerDatosAppFromJson(json);
}
