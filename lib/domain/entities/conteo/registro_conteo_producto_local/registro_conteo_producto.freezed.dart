// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registro_conteo_producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistroConteoProducto _$RegistroConteoProductoFromJson(
    Map<String, dynamic> json) {
  return _RegistroConteoProducto.fromJson(json);
}

/// @nodoc
mixin _$RegistroConteoProducto {
  int? get codigo => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_conteo')
  int get codigoConteo => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_producto')
  String get codigoProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_contada')
  double get cantidadContada => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_contada')
  String get fechaContada => throw _privateConstructorUsedError;
  @JsonKey(name: 'sincronizado_servidor')
  int get sincronizadoServidor => throw _privateConstructorUsedError;
  @JsonKey(name: 'es_confirmado')
  int get esConfirmado => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_lote')
  String get codigoLote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistroConteoProductoCopyWith<RegistroConteoProducto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistroConteoProductoCopyWith<$Res> {
  factory $RegistroConteoProductoCopyWith(RegistroConteoProducto value,
          $Res Function(RegistroConteoProducto) then) =
      _$RegistroConteoProductoCopyWithImpl<$Res, RegistroConteoProducto>;
  @useResult
  $Res call(
      {int? codigo,
      @JsonKey(name: 'codigo_conteo') int codigoConteo,
      @JsonKey(name: 'codigo_producto') String codigoProducto,
      @JsonKey(name: 'cantidad_contada') double cantidadContada,
      @JsonKey(name: 'fecha_contada') String fechaContada,
      @JsonKey(name: 'sincronizado_servidor') int sincronizadoServidor,
      @JsonKey(name: 'es_confirmado') int esConfirmado,
      @JsonKey(name: 'codigo_lote') String codigoLote});
}

/// @nodoc
class _$RegistroConteoProductoCopyWithImpl<$Res,
        $Val extends RegistroConteoProducto>
    implements $RegistroConteoProductoCopyWith<$Res> {
  _$RegistroConteoProductoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = freezed,
    Object? codigoConteo = null,
    Object? codigoProducto = null,
    Object? cantidadContada = null,
    Object? fechaContada = null,
    Object? sincronizadoServidor = null,
    Object? esConfirmado = null,
    Object? codigoLote = null,
  }) {
    return _then(_value.copyWith(
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int?,
      codigoConteo: null == codigoConteo
          ? _value.codigoConteo
          : codigoConteo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadContada: null == cantidadContada
          ? _value.cantidadContada
          : cantidadContada // ignore: cast_nullable_to_non_nullable
              as double,
      fechaContada: null == fechaContada
          ? _value.fechaContada
          : fechaContada // ignore: cast_nullable_to_non_nullable
              as String,
      sincronizadoServidor: null == sincronizadoServidor
          ? _value.sincronizadoServidor
          : sincronizadoServidor // ignore: cast_nullable_to_non_nullable
              as int,
      esConfirmado: null == esConfirmado
          ? _value.esConfirmado
          : esConfirmado // ignore: cast_nullable_to_non_nullable
              as int,
      codigoLote: null == codigoLote
          ? _value.codigoLote
          : codigoLote // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistroConteoProductoImplCopyWith<$Res>
    implements $RegistroConteoProductoCopyWith<$Res> {
  factory _$$RegistroConteoProductoImplCopyWith(
          _$RegistroConteoProductoImpl value,
          $Res Function(_$RegistroConteoProductoImpl) then) =
      __$$RegistroConteoProductoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codigo,
      @JsonKey(name: 'codigo_conteo') int codigoConteo,
      @JsonKey(name: 'codigo_producto') String codigoProducto,
      @JsonKey(name: 'cantidad_contada') double cantidadContada,
      @JsonKey(name: 'fecha_contada') String fechaContada,
      @JsonKey(name: 'sincronizado_servidor') int sincronizadoServidor,
      @JsonKey(name: 'es_confirmado') int esConfirmado,
      @JsonKey(name: 'codigo_lote') String codigoLote});
}

/// @nodoc
class __$$RegistroConteoProductoImplCopyWithImpl<$Res>
    extends _$RegistroConteoProductoCopyWithImpl<$Res,
        _$RegistroConteoProductoImpl>
    implements _$$RegistroConteoProductoImplCopyWith<$Res> {
  __$$RegistroConteoProductoImplCopyWithImpl(
      _$RegistroConteoProductoImpl _value,
      $Res Function(_$RegistroConteoProductoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = freezed,
    Object? codigoConteo = null,
    Object? codigoProducto = null,
    Object? cantidadContada = null,
    Object? fechaContada = null,
    Object? sincronizadoServidor = null,
    Object? esConfirmado = null,
    Object? codigoLote = null,
  }) {
    return _then(_$RegistroConteoProductoImpl(
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int?,
      codigoConteo: null == codigoConteo
          ? _value.codigoConteo
          : codigoConteo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadContada: null == cantidadContada
          ? _value.cantidadContada
          : cantidadContada // ignore: cast_nullable_to_non_nullable
              as double,
      fechaContada: null == fechaContada
          ? _value.fechaContada
          : fechaContada // ignore: cast_nullable_to_non_nullable
              as String,
      sincronizadoServidor: null == sincronizadoServidor
          ? _value.sincronizadoServidor
          : sincronizadoServidor // ignore: cast_nullable_to_non_nullable
              as int,
      esConfirmado: null == esConfirmado
          ? _value.esConfirmado
          : esConfirmado // ignore: cast_nullable_to_non_nullable
              as int,
      codigoLote: null == codigoLote
          ? _value.codigoLote
          : codigoLote // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistroConteoProductoImpl implements _RegistroConteoProducto {
  _$RegistroConteoProductoImpl(
      {this.codigo,
      @JsonKey(name: 'codigo_conteo') required this.codigoConteo,
      @JsonKey(name: 'codigo_producto') required this.codigoProducto,
      @JsonKey(name: 'cantidad_contada') required this.cantidadContada,
      @JsonKey(name: 'fecha_contada') required this.fechaContada,
      @JsonKey(name: 'sincronizado_servidor')
      required this.sincronizadoServidor,
      @JsonKey(name: 'es_confirmado') required this.esConfirmado,
      @JsonKey(name: 'codigo_lote') required this.codigoLote});

  factory _$RegistroConteoProductoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistroConteoProductoImplFromJson(json);

  @override
  final int? codigo;
  @override
  @JsonKey(name: 'codigo_conteo')
  final int codigoConteo;
  @override
  @JsonKey(name: 'codigo_producto')
  final String codigoProducto;
  @override
  @JsonKey(name: 'cantidad_contada')
  final double cantidadContada;
  @override
  @JsonKey(name: 'fecha_contada')
  final String fechaContada;
  @override
  @JsonKey(name: 'sincronizado_servidor')
  final int sincronizadoServidor;
  @override
  @JsonKey(name: 'es_confirmado')
  final int esConfirmado;
  @override
  @JsonKey(name: 'codigo_lote')
  final String codigoLote;

  @override
  String toString() {
    return 'RegistroConteoProducto(codigo: $codigo, codigoConteo: $codigoConteo, codigoProducto: $codigoProducto, cantidadContada: $cantidadContada, fechaContada: $fechaContada, sincronizadoServidor: $sincronizadoServidor, esConfirmado: $esConfirmado, codigoLote: $codigoLote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistroConteoProductoImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.codigoConteo, codigoConteo) ||
                other.codigoConteo == codigoConteo) &&
            (identical(other.codigoProducto, codigoProducto) ||
                other.codigoProducto == codigoProducto) &&
            (identical(other.cantidadContada, cantidadContada) ||
                other.cantidadContada == cantidadContada) &&
            (identical(other.fechaContada, fechaContada) ||
                other.fechaContada == fechaContada) &&
            (identical(other.sincronizadoServidor, sincronizadoServidor) ||
                other.sincronizadoServidor == sincronizadoServidor) &&
            (identical(other.esConfirmado, esConfirmado) ||
                other.esConfirmado == esConfirmado) &&
            (identical(other.codigoLote, codigoLote) ||
                other.codigoLote == codigoLote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codigo,
      codigoConteo,
      codigoProducto,
      cantidadContada,
      fechaContada,
      sincronizadoServidor,
      esConfirmado,
      codigoLote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistroConteoProductoImplCopyWith<_$RegistroConteoProductoImpl>
      get copyWith => __$$RegistroConteoProductoImplCopyWithImpl<
          _$RegistroConteoProductoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistroConteoProductoImplToJson(
      this,
    );
  }
}

abstract class _RegistroConteoProducto implements RegistroConteoProducto {
  factory _RegistroConteoProducto(
      {final int? codigo,
      @JsonKey(name: 'codigo_conteo') required final int codigoConteo,
      @JsonKey(name: 'codigo_producto') required final String codigoProducto,
      @JsonKey(name: 'cantidad_contada') required final double cantidadContada,
      @JsonKey(name: 'fecha_contada') required final String fechaContada,
      @JsonKey(name: 'sincronizado_servidor')
      required final int sincronizadoServidor,
      @JsonKey(name: 'es_confirmado') required final int esConfirmado,
      @JsonKey(name: 'codigo_lote')
      required final String codigoLote}) = _$RegistroConteoProductoImpl;

  factory _RegistroConteoProducto.fromJson(Map<String, dynamic> json) =
      _$RegistroConteoProductoImpl.fromJson;

  @override
  int? get codigo;
  @override
  @JsonKey(name: 'codigo_conteo')
  int get codigoConteo;
  @override
  @JsonKey(name: 'codigo_producto')
  String get codigoProducto;
  @override
  @JsonKey(name: 'cantidad_contada')
  double get cantidadContada;
  @override
  @JsonKey(name: 'fecha_contada')
  String get fechaContada;
  @override
  @JsonKey(name: 'sincronizado_servidor')
  int get sincronizadoServidor;
  @override
  @JsonKey(name: 'es_confirmado')
  int get esConfirmado;
  @override
  @JsonKey(name: 'codigo_lote')
  String get codigoLote;
  @override
  @JsonKey(ignore: true)
  _$$RegistroConteoProductoImplCopyWith<_$RegistroConteoProductoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
