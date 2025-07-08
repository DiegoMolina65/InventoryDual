// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lotes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LotesEntidad _$LotesEntidadFromJson(Map<String, dynamic> json) {
  return _LotesEntidad.fromJson(json);
}

/// @nodoc
mixin _$LotesEntidad {
  String get codigo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_expiracion')
  DateTime get fechaExpiracion => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LotesEntidadCopyWith<LotesEntidad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LotesEntidadCopyWith<$Res> {
  factory $LotesEntidadCopyWith(
          LotesEntidad value, $Res Function(LotesEntidad) then) =
      _$LotesEntidadCopyWithImpl<$Res, LotesEntidad>;
  @useResult
  $Res call(
      {String codigo,
      @JsonKey(name: 'fecha_expiracion') DateTime fechaExpiracion,
      double stock});
}

/// @nodoc
class _$LotesEntidadCopyWithImpl<$Res, $Val extends LotesEntidad>
    implements $LotesEntidadCopyWith<$Res> {
  _$LotesEntidadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? fechaExpiracion = null,
    Object? stock = null,
  }) {
    return _then(_value.copyWith(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      fechaExpiracion: null == fechaExpiracion
          ? _value.fechaExpiracion
          : fechaExpiracion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LotesEntidadImplCopyWith<$Res>
    implements $LotesEntidadCopyWith<$Res> {
  factory _$$LotesEntidadImplCopyWith(
          _$LotesEntidadImpl value, $Res Function(_$LotesEntidadImpl) then) =
      __$$LotesEntidadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String codigo,
      @JsonKey(name: 'fecha_expiracion') DateTime fechaExpiracion,
      double stock});
}

/// @nodoc
class __$$LotesEntidadImplCopyWithImpl<$Res>
    extends _$LotesEntidadCopyWithImpl<$Res, _$LotesEntidadImpl>
    implements _$$LotesEntidadImplCopyWith<$Res> {
  __$$LotesEntidadImplCopyWithImpl(
      _$LotesEntidadImpl _value, $Res Function(_$LotesEntidadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? fechaExpiracion = null,
    Object? stock = null,
  }) {
    return _then(_$LotesEntidadImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      fechaExpiracion: null == fechaExpiracion
          ? _value.fechaExpiracion
          : fechaExpiracion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LotesEntidadImpl implements _LotesEntidad {
  _$LotesEntidadImpl(
      {required this.codigo,
      @JsonKey(name: 'fecha_expiracion') required this.fechaExpiracion,
      required this.stock});

  factory _$LotesEntidadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LotesEntidadImplFromJson(json);

  @override
  final String codigo;
  @override
  @JsonKey(name: 'fecha_expiracion')
  final DateTime fechaExpiracion;
  @override
  final double stock;

  @override
  String toString() {
    return 'LotesEntidad(codigo: $codigo, fechaExpiracion: $fechaExpiracion, stock: $stock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LotesEntidadImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.fechaExpiracion, fechaExpiracion) ||
                other.fechaExpiracion == fechaExpiracion) &&
            (identical(other.stock, stock) || other.stock == stock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codigo, fechaExpiracion, stock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LotesEntidadImplCopyWith<_$LotesEntidadImpl> get copyWith =>
      __$$LotesEntidadImplCopyWithImpl<_$LotesEntidadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LotesEntidadImplToJson(
      this,
    );
  }
}

abstract class _LotesEntidad implements LotesEntidad {
  factory _LotesEntidad(
      {required final String codigo,
      @JsonKey(name: 'fecha_expiracion')
      required final DateTime fechaExpiracion,
      required final double stock}) = _$LotesEntidadImpl;

  factory _LotesEntidad.fromJson(Map<String, dynamic> json) =
      _$LotesEntidadImpl.fromJson;

  @override
  String get codigo;
  @override
  @JsonKey(name: 'fecha_expiracion')
  DateTime get fechaExpiracion;
  @override
  double get stock;
  @override
  @JsonKey(ignore: true)
  _$$LotesEntidadImplCopyWith<_$LotesEntidadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
