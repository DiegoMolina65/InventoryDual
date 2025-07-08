// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conteo_imagen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConteoImagen _$ConteoImagenFromJson(Map<String, dynamic> json) {
  return _ConteoImagen.fromJson(json);
}

/// @nodoc
mixin _$ConteoImagen {
  @JsonKey(name: "codigo_producto")
  String get codigoProducto => throw _privateConstructorUsedError;
  @JsonKey(name: "codigo_conteo_inventario")
  int get codigoConteoInventario => throw _privateConstructorUsedError;
  @JsonKey(name: "imagen")
  String get imagen => throw _privateConstructorUsedError;
  @JsonKey(name: "observacion")
  String get observacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConteoImagenCopyWith<ConteoImagen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConteoImagenCopyWith<$Res> {
  factory $ConteoImagenCopyWith(
          ConteoImagen value, $Res Function(ConteoImagen) then) =
      _$ConteoImagenCopyWithImpl<$Res, ConteoImagen>;
  @useResult
  $Res call(
      {@JsonKey(name: "codigo_producto") String codigoProducto,
      @JsonKey(name: "codigo_conteo_inventario") int codigoConteoInventario,
      @JsonKey(name: "imagen") String imagen,
      @JsonKey(name: "observacion") String observacion});
}

/// @nodoc
class _$ConteoImagenCopyWithImpl<$Res, $Val extends ConteoImagen>
    implements $ConteoImagenCopyWith<$Res> {
  _$ConteoImagenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoProducto = null,
    Object? codigoConteoInventario = null,
    Object? imagen = null,
    Object? observacion = null,
  }) {
    return _then(_value.copyWith(
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      codigoConteoInventario: null == codigoConteoInventario
          ? _value.codigoConteoInventario
          : codigoConteoInventario // ignore: cast_nullable_to_non_nullable
              as int,
      imagen: null == imagen
          ? _value.imagen
          : imagen // ignore: cast_nullable_to_non_nullable
              as String,
      observacion: null == observacion
          ? _value.observacion
          : observacion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConteoImagenImplCopyWith<$Res>
    implements $ConteoImagenCopyWith<$Res> {
  factory _$$ConteoImagenImplCopyWith(
          _$ConteoImagenImpl value, $Res Function(_$ConteoImagenImpl) then) =
      __$$ConteoImagenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "codigo_producto") String codigoProducto,
      @JsonKey(name: "codigo_conteo_inventario") int codigoConteoInventario,
      @JsonKey(name: "imagen") String imagen,
      @JsonKey(name: "observacion") String observacion});
}

/// @nodoc
class __$$ConteoImagenImplCopyWithImpl<$Res>
    extends _$ConteoImagenCopyWithImpl<$Res, _$ConteoImagenImpl>
    implements _$$ConteoImagenImplCopyWith<$Res> {
  __$$ConteoImagenImplCopyWithImpl(
      _$ConteoImagenImpl _value, $Res Function(_$ConteoImagenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoProducto = null,
    Object? codigoConteoInventario = null,
    Object? imagen = null,
    Object? observacion = null,
  }) {
    return _then(_$ConteoImagenImpl(
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      codigoConteoInventario: null == codigoConteoInventario
          ? _value.codigoConteoInventario
          : codigoConteoInventario // ignore: cast_nullable_to_non_nullable
              as int,
      imagen: null == imagen
          ? _value.imagen
          : imagen // ignore: cast_nullable_to_non_nullable
              as String,
      observacion: null == observacion
          ? _value.observacion
          : observacion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConteoImagenImpl implements _ConteoImagen {
  _$ConteoImagenImpl(
      {@JsonKey(name: "codigo_producto") required this.codigoProducto,
      @JsonKey(name: "codigo_conteo_inventario")
      required this.codigoConteoInventario,
      @JsonKey(name: "imagen") required this.imagen,
      @JsonKey(name: "observacion") required this.observacion});

  factory _$ConteoImagenImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConteoImagenImplFromJson(json);

  @override
  @JsonKey(name: "codigo_producto")
  final String codigoProducto;
  @override
  @JsonKey(name: "codigo_conteo_inventario")
  final int codigoConteoInventario;
  @override
  @JsonKey(name: "imagen")
  final String imagen;
  @override
  @JsonKey(name: "observacion")
  final String observacion;

  @override
  String toString() {
    return 'ConteoImagen(codigoProducto: $codigoProducto, codigoConteoInventario: $codigoConteoInventario, imagen: $imagen, observacion: $observacion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConteoImagenImpl &&
            (identical(other.codigoProducto, codigoProducto) ||
                other.codigoProducto == codigoProducto) &&
            (identical(other.codigoConteoInventario, codigoConteoInventario) ||
                other.codigoConteoInventario == codigoConteoInventario) &&
            (identical(other.imagen, imagen) || other.imagen == imagen) &&
            (identical(other.observacion, observacion) ||
                other.observacion == observacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, codigoProducto, codigoConteoInventario, imagen, observacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConteoImagenImplCopyWith<_$ConteoImagenImpl> get copyWith =>
      __$$ConteoImagenImplCopyWithImpl<_$ConteoImagenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConteoImagenImplToJson(
      this,
    );
  }
}

abstract class _ConteoImagen implements ConteoImagen {
  factory _ConteoImagen(
      {@JsonKey(name: "codigo_producto") required final String codigoProducto,
      @JsonKey(name: "codigo_conteo_inventario")
      required final int codigoConteoInventario,
      @JsonKey(name: "imagen") required final String imagen,
      @JsonKey(name: "observacion")
      required final String observacion}) = _$ConteoImagenImpl;

  factory _ConteoImagen.fromJson(Map<String, dynamic> json) =
      _$ConteoImagenImpl.fromJson;

  @override
  @JsonKey(name: "codigo_producto")
  String get codigoProducto;
  @override
  @JsonKey(name: "codigo_conteo_inventario")
  int get codigoConteoInventario;
  @override
  @JsonKey(name: "imagen")
  String get imagen;
  @override
  @JsonKey(name: "observacion")
  String get observacion;
  @override
  @JsonKey(ignore: true)
  _$$ConteoImagenImplCopyWith<_$ConteoImagenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
