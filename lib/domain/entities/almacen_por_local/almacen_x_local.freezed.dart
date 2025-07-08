// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'almacen_x_local.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlmacenXLocal _$AlmacenXLocalFromJson(Map<String, dynamic> json) {
  return _AlmacenXLocal.fromJson(json);
}

/// @nodoc
mixin _$AlmacenXLocal {
  int get codigo => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlmacenXLocalCopyWith<AlmacenXLocal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlmacenXLocalCopyWith<$Res> {
  factory $AlmacenXLocalCopyWith(
          AlmacenXLocal value, $Res Function(AlmacenXLocal) then) =
      _$AlmacenXLocalCopyWithImpl<$Res, AlmacenXLocal>;
  @useResult
  $Res call({int codigo, String nombre});
}

/// @nodoc
class _$AlmacenXLocalCopyWithImpl<$Res, $Val extends AlmacenXLocal>
    implements $AlmacenXLocalCopyWith<$Res> {
  _$AlmacenXLocalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
  }) {
    return _then(_value.copyWith(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlmacenXLocalImplCopyWith<$Res>
    implements $AlmacenXLocalCopyWith<$Res> {
  factory _$$AlmacenXLocalImplCopyWith(
          _$AlmacenXLocalImpl value, $Res Function(_$AlmacenXLocalImpl) then) =
      __$$AlmacenXLocalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codigo, String nombre});
}

/// @nodoc
class __$$AlmacenXLocalImplCopyWithImpl<$Res>
    extends _$AlmacenXLocalCopyWithImpl<$Res, _$AlmacenXLocalImpl>
    implements _$$AlmacenXLocalImplCopyWith<$Res> {
  __$$AlmacenXLocalImplCopyWithImpl(
      _$AlmacenXLocalImpl _value, $Res Function(_$AlmacenXLocalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
  }) {
    return _then(_$AlmacenXLocalImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlmacenXLocalImpl implements _AlmacenXLocal {
  _$AlmacenXLocalImpl({required this.codigo, required this.nombre});

  factory _$AlmacenXLocalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlmacenXLocalImplFromJson(json);

  @override
  final int codigo;
  @override
  final String nombre;

  @override
  String toString() {
    return 'AlmacenXLocal(codigo: $codigo, nombre: $nombre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlmacenXLocalImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.nombre, nombre) || other.nombre == nombre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codigo, nombre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlmacenXLocalImplCopyWith<_$AlmacenXLocalImpl> get copyWith =>
      __$$AlmacenXLocalImplCopyWithImpl<_$AlmacenXLocalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlmacenXLocalImplToJson(
      this,
    );
  }
}

abstract class _AlmacenXLocal implements AlmacenXLocal {
  factory _AlmacenXLocal(
      {required final int codigo,
      required final String nombre}) = _$AlmacenXLocalImpl;

  factory _AlmacenXLocal.fromJson(Map<String, dynamic> json) =
      _$AlmacenXLocalImpl.fromJson;

  @override
  int get codigo;
  @override
  String get nombre;
  @override
  @JsonKey(ignore: true)
  _$$AlmacenXLocalImplCopyWith<_$AlmacenXLocalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
