// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subgrupo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Subgrupo _$SubgrupoFromJson(Map<String, dynamic> json) {
  return _Subgrupo.fromJson(json);
}

/// @nodoc
mixin _$Subgrupo {
  int get codigo => throw _privateConstructorUsedError;
  String get descripcion => throw _privateConstructorUsedError;
  @JsonKey(name: 'linea_codigo')
  int get lineaCodigo => throw _privateConstructorUsedError;
  @JsonKey(name: 'grupo_codigo')
  int get grupoCodigo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubgrupoCopyWith<Subgrupo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubgrupoCopyWith<$Res> {
  factory $SubgrupoCopyWith(Subgrupo value, $Res Function(Subgrupo) then) =
      _$SubgrupoCopyWithImpl<$Res, Subgrupo>;
  @useResult
  $Res call(
      {int codigo,
      String descripcion,
      @JsonKey(name: 'linea_codigo') int lineaCodigo,
      @JsonKey(name: 'grupo_codigo') int grupoCodigo});
}

/// @nodoc
class _$SubgrupoCopyWithImpl<$Res, $Val extends Subgrupo>
    implements $SubgrupoCopyWith<$Res> {
  _$SubgrupoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? descripcion = null,
    Object? lineaCodigo = null,
    Object? grupoCodigo = null,
  }) {
    return _then(_value.copyWith(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      lineaCodigo: null == lineaCodigo
          ? _value.lineaCodigo
          : lineaCodigo // ignore: cast_nullable_to_non_nullable
              as int,
      grupoCodigo: null == grupoCodigo
          ? _value.grupoCodigo
          : grupoCodigo // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubgrupoImplCopyWith<$Res>
    implements $SubgrupoCopyWith<$Res> {
  factory _$$SubgrupoImplCopyWith(
          _$SubgrupoImpl value, $Res Function(_$SubgrupoImpl) then) =
      __$$SubgrupoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codigo,
      String descripcion,
      @JsonKey(name: 'linea_codigo') int lineaCodigo,
      @JsonKey(name: 'grupo_codigo') int grupoCodigo});
}

/// @nodoc
class __$$SubgrupoImplCopyWithImpl<$Res>
    extends _$SubgrupoCopyWithImpl<$Res, _$SubgrupoImpl>
    implements _$$SubgrupoImplCopyWith<$Res> {
  __$$SubgrupoImplCopyWithImpl(
      _$SubgrupoImpl _value, $Res Function(_$SubgrupoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? descripcion = null,
    Object? lineaCodigo = null,
    Object? grupoCodigo = null,
  }) {
    return _then(_$SubgrupoImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      lineaCodigo: null == lineaCodigo
          ? _value.lineaCodigo
          : lineaCodigo // ignore: cast_nullable_to_non_nullable
              as int,
      grupoCodigo: null == grupoCodigo
          ? _value.grupoCodigo
          : grupoCodigo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubgrupoImpl implements _Subgrupo {
  _$SubgrupoImpl(
      {required this.codigo,
      required this.descripcion,
      @JsonKey(name: 'linea_codigo') required this.lineaCodigo,
      @JsonKey(name: 'grupo_codigo') required this.grupoCodigo});

  factory _$SubgrupoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubgrupoImplFromJson(json);

  @override
  final int codigo;
  @override
  final String descripcion;
  @override
  @JsonKey(name: 'linea_codigo')
  final int lineaCodigo;
  @override
  @JsonKey(name: 'grupo_codigo')
  final int grupoCodigo;

  @override
  String toString() {
    return 'Subgrupo(codigo: $codigo, descripcion: $descripcion, lineaCodigo: $lineaCodigo, grupoCodigo: $grupoCodigo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubgrupoImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.lineaCodigo, lineaCodigo) ||
                other.lineaCodigo == lineaCodigo) &&
            (identical(other.grupoCodigo, grupoCodigo) ||
                other.grupoCodigo == grupoCodigo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, codigo, descripcion, lineaCodigo, grupoCodigo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubgrupoImplCopyWith<_$SubgrupoImpl> get copyWith =>
      __$$SubgrupoImplCopyWithImpl<_$SubgrupoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubgrupoImplToJson(
      this,
    );
  }
}

abstract class _Subgrupo implements Subgrupo {
  factory _Subgrupo(
          {required final int codigo,
          required final String descripcion,
          @JsonKey(name: 'linea_codigo') required final int lineaCodigo,
          @JsonKey(name: 'grupo_codigo') required final int grupoCodigo}) =
      _$SubgrupoImpl;

  factory _Subgrupo.fromJson(Map<String, dynamic> json) =
      _$SubgrupoImpl.fromJson;

  @override
  int get codigo;
  @override
  String get descripcion;
  @override
  @JsonKey(name: 'linea_codigo')
  int get lineaCodigo;
  @override
  @JsonKey(name: 'grupo_codigo')
  int get grupoCodigo;
  @override
  @JsonKey(ignore: true)
  _$$SubgrupoImplCopyWith<_$SubgrupoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
