// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'linea.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Linea _$LineaFromJson(Map<String, dynamic> json) {
  return _Linea.fromJson(json);
}

/// @nodoc
mixin _$Linea {
  int get codigo => throw _privateConstructorUsedError;
  String get descripcion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineaCopyWith<Linea> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineaCopyWith<$Res> {
  factory $LineaCopyWith(Linea value, $Res Function(Linea) then) =
      _$LineaCopyWithImpl<$Res, Linea>;
  @useResult
  $Res call({int codigo, String descripcion});
}

/// @nodoc
class _$LineaCopyWithImpl<$Res, $Val extends Linea>
    implements $LineaCopyWith<$Res> {
  _$LineaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? descripcion = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LineaImplCopyWith<$Res> implements $LineaCopyWith<$Res> {
  factory _$$LineaImplCopyWith(
          _$LineaImpl value, $Res Function(_$LineaImpl) then) =
      __$$LineaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codigo, String descripcion});
}

/// @nodoc
class __$$LineaImplCopyWithImpl<$Res>
    extends _$LineaCopyWithImpl<$Res, _$LineaImpl>
    implements _$$LineaImplCopyWith<$Res> {
  __$$LineaImplCopyWithImpl(
      _$LineaImpl _value, $Res Function(_$LineaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? descripcion = null,
  }) {
    return _then(_$LineaImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineaImpl implements _Linea {
  _$LineaImpl({required this.codigo, required this.descripcion});

  factory _$LineaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineaImplFromJson(json);

  @override
  final int codigo;
  @override
  final String descripcion;

  @override
  String toString() {
    return 'Linea(codigo: $codigo, descripcion: $descripcion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineaImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codigo, descripcion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineaImplCopyWith<_$LineaImpl> get copyWith =>
      __$$LineaImplCopyWithImpl<_$LineaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineaImplToJson(
      this,
    );
  }
}

abstract class _Linea implements Linea {
  factory _Linea(
      {required final int codigo,
      required final String descripcion}) = _$LineaImpl;

  factory _Linea.fromJson(Map<String, dynamic> json) = _$LineaImpl.fromJson;

  @override
  int get codigo;
  @override
  String get descripcion;
  @override
  @JsonKey(ignore: true)
  _$$LineaImplCopyWith<_$LineaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
