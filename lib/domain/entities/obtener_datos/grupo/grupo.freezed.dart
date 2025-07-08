// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grupo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Grupo _$GrupoFromJson(Map<String, dynamic> json) {
  return _Grupo.fromJson(json);
}

/// @nodoc
mixin _$Grupo {
  int get codigo => throw _privateConstructorUsedError;
  String get descripcion => throw _privateConstructorUsedError;
  @JsonKey(name: 'linea_codigo')
  int get lineaCodigo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrupoCopyWith<Grupo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrupoCopyWith<$Res> {
  factory $GrupoCopyWith(Grupo value, $Res Function(Grupo) then) =
      _$GrupoCopyWithImpl<$Res, Grupo>;
  @useResult
  $Res call(
      {int codigo,
      String descripcion,
      @JsonKey(name: 'linea_codigo') int lineaCodigo});
}

/// @nodoc
class _$GrupoCopyWithImpl<$Res, $Val extends Grupo>
    implements $GrupoCopyWith<$Res> {
  _$GrupoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrupoImplCopyWith<$Res> implements $GrupoCopyWith<$Res> {
  factory _$$GrupoImplCopyWith(
          _$GrupoImpl value, $Res Function(_$GrupoImpl) then) =
      __$$GrupoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codigo,
      String descripcion,
      @JsonKey(name: 'linea_codigo') int lineaCodigo});
}

/// @nodoc
class __$$GrupoImplCopyWithImpl<$Res>
    extends _$GrupoCopyWithImpl<$Res, _$GrupoImpl>
    implements _$$GrupoImplCopyWith<$Res> {
  __$$GrupoImplCopyWithImpl(
      _$GrupoImpl _value, $Res Function(_$GrupoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? descripcion = null,
    Object? lineaCodigo = null,
  }) {
    return _then(_$GrupoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrupoImpl implements _Grupo {
  _$GrupoImpl(
      {required this.codigo,
      required this.descripcion,
      @JsonKey(name: 'linea_codigo') required this.lineaCodigo});

  factory _$GrupoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrupoImplFromJson(json);

  @override
  final int codigo;
  @override
  final String descripcion;
  @override
  @JsonKey(name: 'linea_codigo')
  final int lineaCodigo;

  @override
  String toString() {
    return 'Grupo(codigo: $codigo, descripcion: $descripcion, lineaCodigo: $lineaCodigo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrupoImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.lineaCodigo, lineaCodigo) ||
                other.lineaCodigo == lineaCodigo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, codigo, descripcion, lineaCodigo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GrupoImplCopyWith<_$GrupoImpl> get copyWith =>
      __$$GrupoImplCopyWithImpl<_$GrupoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrupoImplToJson(
      this,
    );
  }
}

abstract class _Grupo implements Grupo {
  factory _Grupo(
          {required final int codigo,
          required final String descripcion,
          @JsonKey(name: 'linea_codigo') required final int lineaCodigo}) =
      _$GrupoImpl;

  factory _Grupo.fromJson(Map<String, dynamic> json) = _$GrupoImpl.fromJson;

  @override
  int get codigo;
  @override
  String get descripcion;
  @override
  @JsonKey(name: 'linea_codigo')
  int get lineaCodigo;
  @override
  @JsonKey(ignore: true)
  _$$GrupoImplCopyWith<_$GrupoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
