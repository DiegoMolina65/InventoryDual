import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_model.freezed.dart';

part 'usuario_model.g.dart';

@freezed
class UsuarioModel with _$UsuarioModel {
  factory UsuarioModel({
    required int code,
    required String name,
    required int localCode,
    required String localName,
    required int warehouseCode,
    String? nick,
    String? password,
    required int priceListCode,
    required int currencyCode,
    required double currencyValue,
    String? nameDefaultCustomer,
    required int codeDefaultCustomer,
    required bool isSupervisor,
  }) = _UsuarioModel;

  factory UsuarioModel.fromJson(Map<String, Object?> json) =>
      _$UsuarioModelFromJson(json);
}
