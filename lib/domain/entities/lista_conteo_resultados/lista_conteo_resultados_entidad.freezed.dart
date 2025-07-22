// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lista_conteo_resultados_entidad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListaConteoResultadosEntidad _$ListaConteoResultadosEntidadFromJson(
    Map<String, dynamic> json) {
  return _ListaConteoResultadosEntidad.fromJson(json);
}

/// @nodoc
mixin _$ListaConteoResultadosEntidad {
  int get codigoConteoInventario => throw _privateConstructorUsedError;
  int get codigoUsuario => throw _privateConstructorUsedError;
  String get nombreUsuario => throw _privateConstructorUsedError;
  double get cantidadContada => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListaConteoResultadosEntidadCopyWith<ListaConteoResultadosEntidad>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListaConteoResultadosEntidadCopyWith<$Res> {
  factory $ListaConteoResultadosEntidadCopyWith(
          ListaConteoResultadosEntidad value,
          $Res Function(ListaConteoResultadosEntidad) then) =
      _$ListaConteoResultadosEntidadCopyWithImpl<$Res,
          ListaConteoResultadosEntidad>;
  @useResult
  $Res call(
      {int codigoConteoInventario,
      int codigoUsuario,
      String nombreUsuario,
      double cantidadContada});
}

/// @nodoc
class _$ListaConteoResultadosEntidadCopyWithImpl<$Res,
        $Val extends ListaConteoResultadosEntidad>
    implements $ListaConteoResultadosEntidadCopyWith<$Res> {
  _$ListaConteoResultadosEntidadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoConteoInventario = null,
    Object? codigoUsuario = null,
    Object? nombreUsuario = null,
    Object? cantidadContada = null,
  }) {
    return _then(_value.copyWith(
      codigoConteoInventario: null == codigoConteoInventario
          ? _value.codigoConteoInventario
          : codigoConteoInventario // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUsuario: null == codigoUsuario
          ? _value.codigoUsuario
          : codigoUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      nombreUsuario: null == nombreUsuario
          ? _value.nombreUsuario
          : nombreUsuario // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadContada: null == cantidadContada
          ? _value.cantidadContada
          : cantidadContada // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListaConteoResultadosEntidadImplCopyWith<$Res>
    implements $ListaConteoResultadosEntidadCopyWith<$Res> {
  factory _$$ListaConteoResultadosEntidadImplCopyWith(
          _$ListaConteoResultadosEntidadImpl value,
          $Res Function(_$ListaConteoResultadosEntidadImpl) then) =
      __$$ListaConteoResultadosEntidadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codigoConteoInventario,
      int codigoUsuario,
      String nombreUsuario,
      double cantidadContada});
}

/// @nodoc
class __$$ListaConteoResultadosEntidadImplCopyWithImpl<$Res>
    extends _$ListaConteoResultadosEntidadCopyWithImpl<$Res,
        _$ListaConteoResultadosEntidadImpl>
    implements _$$ListaConteoResultadosEntidadImplCopyWith<$Res> {
  __$$ListaConteoResultadosEntidadImplCopyWithImpl(
      _$ListaConteoResultadosEntidadImpl _value,
      $Res Function(_$ListaConteoResultadosEntidadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoConteoInventario = null,
    Object? codigoUsuario = null,
    Object? nombreUsuario = null,
    Object? cantidadContada = null,
  }) {
    return _then(_$ListaConteoResultadosEntidadImpl(
      codigoConteoInventario: null == codigoConteoInventario
          ? _value.codigoConteoInventario
          : codigoConteoInventario // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUsuario: null == codigoUsuario
          ? _value.codigoUsuario
          : codigoUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      nombreUsuario: null == nombreUsuario
          ? _value.nombreUsuario
          : nombreUsuario // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadContada: null == cantidadContada
          ? _value.cantidadContada
          : cantidadContada // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListaConteoResultadosEntidadImpl
    implements _ListaConteoResultadosEntidad {
  _$ListaConteoResultadosEntidadImpl(
      {required this.codigoConteoInventario,
      required this.codigoUsuario,
      required this.nombreUsuario,
      required this.cantidadContada});

  factory _$ListaConteoResultadosEntidadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ListaConteoResultadosEntidadImplFromJson(json);

  @override
  final int codigoConteoInventario;
  @override
  final int codigoUsuario;
  @override
  final String nombreUsuario;
  @override
  final double cantidadContada;

  @override
  String toString() {
    return 'ListaConteoResultadosEntidad(codigoConteoInventario: $codigoConteoInventario, codigoUsuario: $codigoUsuario, nombreUsuario: $nombreUsuario, cantidadContada: $cantidadContada)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListaConteoResultadosEntidadImpl &&
            (identical(other.codigoConteoInventario, codigoConteoInventario) ||
                other.codigoConteoInventario == codigoConteoInventario) &&
            (identical(other.codigoUsuario, codigoUsuario) ||
                other.codigoUsuario == codigoUsuario) &&
            (identical(other.nombreUsuario, nombreUsuario) ||
                other.nombreUsuario == nombreUsuario) &&
            (identical(other.cantidadContada, cantidadContada) ||
                other.cantidadContada == cantidadContada));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codigoConteoInventario,
      codigoUsuario, nombreUsuario, cantidadContada);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListaConteoResultadosEntidadImplCopyWith<
          _$ListaConteoResultadosEntidadImpl>
      get copyWith => __$$ListaConteoResultadosEntidadImplCopyWithImpl<
          _$ListaConteoResultadosEntidadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListaConteoResultadosEntidadImplToJson(
      this,
    );
  }
}

abstract class _ListaConteoResultadosEntidad
    implements ListaConteoResultadosEntidad {
  factory _ListaConteoResultadosEntidad(
          {required final int codigoConteoInventario,
          required final int codigoUsuario,
          required final String nombreUsuario,
          required final double cantidadContada}) =
      _$ListaConteoResultadosEntidadImpl;

  factory _ListaConteoResultadosEntidad.fromJson(Map<String, dynamic> json) =
      _$ListaConteoResultadosEntidadImpl.fromJson;

  @override
  int get codigoConteoInventario;
  @override
  int get codigoUsuario;
  @override
  String get nombreUsuario;
  @override
  double get cantidadContada;
  @override
  @JsonKey(ignore: true)
  _$$ListaConteoResultadosEntidadImplCopyWith<
          _$ListaConteoResultadosEntidadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
