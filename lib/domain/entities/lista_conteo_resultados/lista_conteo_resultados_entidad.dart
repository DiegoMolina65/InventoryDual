// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lista_conteo_resultados_entidad.freezed.dart';
part 'lista_conteo_resultados_entidad.g.dart';

@freezed
class ListaConteoResultadosEntidad with _$ListaConteoResultadosEntidad {
  factory ListaConteoResultadosEntidad({
      required int codigoConteoInventario,
      required int codigoUsuario,
      required String nombreUsuario,
      required double cantidadContada,
    }) = _ListaConteoResultadosEntidad;

  factory ListaConteoResultadosEntidad.fromJson(Map<String, Object?> json) =>
      _$ListaConteoResultadosEntidadFromJson(json);
}



