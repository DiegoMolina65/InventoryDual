// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conteo_detalle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConteoDetalle _$ConteoDetalleFromJson(Map<String, dynamic> json) {
  return _ConteoDetalle.fromJson(json);
}

/// @nodoc
mixin _$ConteoDetalle {
  @JsonKey(name: "codigo_unidad_medida")
  int get codigoUnidadMedida => throw _privateConstructorUsedError;
  @JsonKey(name: "nombre_unidad_medida")
  String get nombreUnidadMedida => throw _privateConstructorUsedError;
  @JsonKey(name: "cantidad")
  double get cantidad => throw _privateConstructorUsedError;
  @JsonKey(name: "cantidad_base")
  double get cantidadBase => throw _privateConstructorUsedError;
  @JsonKey(name: "fecha_conteo")
  DateTime get fechaConteo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConteoDetalleCopyWith<ConteoDetalle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConteoDetalleCopyWith<$Res> {
  factory $ConteoDetalleCopyWith(
          ConteoDetalle value, $Res Function(ConteoDetalle) then) =
      _$ConteoDetalleCopyWithImpl<$Res, ConteoDetalle>;
  @useResult
  $Res call(
      {@JsonKey(name: "codigo_unidad_medida") int codigoUnidadMedida,
      @JsonKey(name: "nombre_unidad_medida") String nombreUnidadMedida,
      @JsonKey(name: "cantidad") double cantidad,
      @JsonKey(name: "cantidad_base") double cantidadBase,
      @JsonKey(name: "fecha_conteo") DateTime fechaConteo});
}

/// @nodoc
class _$ConteoDetalleCopyWithImpl<$Res, $Val extends ConteoDetalle>
    implements $ConteoDetalleCopyWith<$Res> {
  _$ConteoDetalleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoUnidadMedida = null,
    Object? nombreUnidadMedida = null,
    Object? cantidad = null,
    Object? cantidadBase = null,
    Object? fechaConteo = null,
  }) {
    return _then(_value.copyWith(
      codigoUnidadMedida: null == codigoUnidadMedida
          ? _value.codigoUnidadMedida
          : codigoUnidadMedida // ignore: cast_nullable_to_non_nullable
              as int,
      nombreUnidadMedida: null == nombreUnidadMedida
          ? _value.nombreUnidadMedida
          : nombreUnidadMedida // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as double,
      cantidadBase: null == cantidadBase
          ? _value.cantidadBase
          : cantidadBase // ignore: cast_nullable_to_non_nullable
              as double,
      fechaConteo: null == fechaConteo
          ? _value.fechaConteo
          : fechaConteo // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConteoDetalleImplCopyWith<$Res>
    implements $ConteoDetalleCopyWith<$Res> {
  factory _$$ConteoDetalleImplCopyWith(
          _$ConteoDetalleImpl value, $Res Function(_$ConteoDetalleImpl) then) =
      __$$ConteoDetalleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "codigo_unidad_medida") int codigoUnidadMedida,
      @JsonKey(name: "nombre_unidad_medida") String nombreUnidadMedida,
      @JsonKey(name: "cantidad") double cantidad,
      @JsonKey(name: "cantidad_base") double cantidadBase,
      @JsonKey(name: "fecha_conteo") DateTime fechaConteo});
}

/// @nodoc
class __$$ConteoDetalleImplCopyWithImpl<$Res>
    extends _$ConteoDetalleCopyWithImpl<$Res, _$ConteoDetalleImpl>
    implements _$$ConteoDetalleImplCopyWith<$Res> {
  __$$ConteoDetalleImplCopyWithImpl(
      _$ConteoDetalleImpl _value, $Res Function(_$ConteoDetalleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoUnidadMedida = null,
    Object? nombreUnidadMedida = null,
    Object? cantidad = null,
    Object? cantidadBase = null,
    Object? fechaConteo = null,
  }) {
    return _then(_$ConteoDetalleImpl(
      codigoUnidadMedida: null == codigoUnidadMedida
          ? _value.codigoUnidadMedida
          : codigoUnidadMedida // ignore: cast_nullable_to_non_nullable
              as int,
      nombreUnidadMedida: null == nombreUnidadMedida
          ? _value.nombreUnidadMedida
          : nombreUnidadMedida // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as double,
      cantidadBase: null == cantidadBase
          ? _value.cantidadBase
          : cantidadBase // ignore: cast_nullable_to_non_nullable
              as double,
      fechaConteo: null == fechaConteo
          ? _value.fechaConteo
          : fechaConteo // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConteoDetalleImpl implements _ConteoDetalle {
  _$ConteoDetalleImpl(
      {@JsonKey(name: "codigo_unidad_medida") required this.codigoUnidadMedida,
      @JsonKey(name: "nombre_unidad_medida") required this.nombreUnidadMedida,
      @JsonKey(name: "cantidad") required this.cantidad,
      @JsonKey(name: "cantidad_base") required this.cantidadBase,
      @JsonKey(name: "fecha_conteo") required this.fechaConteo});

  factory _$ConteoDetalleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConteoDetalleImplFromJson(json);

  @override
  @JsonKey(name: "codigo_unidad_medida")
  final int codigoUnidadMedida;
  @override
  @JsonKey(name: "nombre_unidad_medida")
  final String nombreUnidadMedida;
  @override
  @JsonKey(name: "cantidad")
  final double cantidad;
  @override
  @JsonKey(name: "cantidad_base")
  final double cantidadBase;
  @override
  @JsonKey(name: "fecha_conteo")
  final DateTime fechaConteo;

  @override
  String toString() {
    return 'ConteoDetalle(codigoUnidadMedida: $codigoUnidadMedida, nombreUnidadMedida: $nombreUnidadMedida, cantidad: $cantidad, cantidadBase: $cantidadBase, fechaConteo: $fechaConteo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConteoDetalleImpl &&
            (identical(other.codigoUnidadMedida, codigoUnidadMedida) ||
                other.codigoUnidadMedida == codigoUnidadMedida) &&
            (identical(other.nombreUnidadMedida, nombreUnidadMedida) ||
                other.nombreUnidadMedida == nombreUnidadMedida) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.cantidadBase, cantidadBase) ||
                other.cantidadBase == cantidadBase) &&
            (identical(other.fechaConteo, fechaConteo) ||
                other.fechaConteo == fechaConteo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codigoUnidadMedida,
      nombreUnidadMedida, cantidad, cantidadBase, fechaConteo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConteoDetalleImplCopyWith<_$ConteoDetalleImpl> get copyWith =>
      __$$ConteoDetalleImplCopyWithImpl<_$ConteoDetalleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConteoDetalleImplToJson(
      this,
    );
  }
}

abstract class _ConteoDetalle implements ConteoDetalle {
  factory _ConteoDetalle(
          {@JsonKey(name: "codigo_unidad_medida")
          required final int codigoUnidadMedida,
          @JsonKey(name: "nombre_unidad_medida")
          required final String nombreUnidadMedida,
          @JsonKey(name: "cantidad") required final double cantidad,
          @JsonKey(name: "cantidad_base") required final double cantidadBase,
          @JsonKey(name: "fecha_conteo") required final DateTime fechaConteo}) =
      _$ConteoDetalleImpl;

  factory _ConteoDetalle.fromJson(Map<String, dynamic> json) =
      _$ConteoDetalleImpl.fromJson;

  @override
  @JsonKey(name: "codigo_unidad_medida")
  int get codigoUnidadMedida;
  @override
  @JsonKey(name: "nombre_unidad_medida")
  String get nombreUnidadMedida;
  @override
  @JsonKey(name: "cantidad")
  double get cantidad;
  @override
  @JsonKey(name: "cantidad_base")
  double get cantidadBase;
  @override
  @JsonKey(name: "fecha_conteo")
  DateTime get fechaConteo;
  @override
  @JsonKey(ignore: true)
  _$$ConteoDetalleImplCopyWith<_$ConteoDetalleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
