// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario.freezed.dart';
part 'usuario.g.dart';

@freezed
class Usuario with _$Usuario {
  factory Usuario({
    required int codigo,
    required String nombre,
    @JsonKey(name: 'codigo_local') required int codigoLocal,
    @JsonKey(name: 'nombre_local') required String nombreLocal,
    @JsonKey(name: 'codigo_almacen') required int codigoAlmacen,
    required String usuario,
    required String contrasenia,
    @JsonKey(name: 'codigo_lista_precios') required int codigoListaPrecios,
    @JsonKey(name: 'codigo_moneda') required int codigoMoneda,
    @JsonKey(name: 'valor_moneda') required double valorMoneda,
    @JsonKey(name: 'nombre_cliente_predeterminado') required String nombreClientePredeterminado,
    @JsonKey(name: 'codigo_cliente_predeterminado') required int codigoClientePredeterminado,
    @JsonKey(name: 'es_supervisor') required bool esSupervisor,
  }) = _Usuario;

  factory Usuario.fromJson(Map<String, Object?> json) =>
      _$UsuarioFromJson(json);
}
