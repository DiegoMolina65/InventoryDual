// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obtener_datos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ObtenerDatosApp _$ObtenerDatosAppFromJson(Map<String, dynamic> json) {
  return _ObtenerDatosApp.fromJson(json);
}

/// @nodoc
mixin _$ObtenerDatosApp {
  List<UnidadMedida>? get unidadmedida => throw _privateConstructorUsedError;
  List<Linea> get lineas => throw _privateConstructorUsedError;
  List<Grupo> get grupos => throw _privateConstructorUsedError;
  List<Subgrupo> get subgrupos => throw _privateConstructorUsedError;
  List<Almacen> get almacenes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObtenerDatosAppCopyWith<ObtenerDatosApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObtenerDatosAppCopyWith<$Res> {
  factory $ObtenerDatosAppCopyWith(
          ObtenerDatosApp value, $Res Function(ObtenerDatosApp) then) =
      _$ObtenerDatosAppCopyWithImpl<$Res, ObtenerDatosApp>;
  @useResult
  $Res call(
      {List<UnidadMedida>? unidadmedida,
      List<Linea> lineas,
      List<Grupo> grupos,
      List<Subgrupo> subgrupos,
      List<Almacen> almacenes});
}

/// @nodoc
class _$ObtenerDatosAppCopyWithImpl<$Res, $Val extends ObtenerDatosApp>
    implements $ObtenerDatosAppCopyWith<$Res> {
  _$ObtenerDatosAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unidadmedida = freezed,
    Object? lineas = null,
    Object? grupos = null,
    Object? subgrupos = null,
    Object? almacenes = null,
  }) {
    return _then(_value.copyWith(
      unidadmedida: freezed == unidadmedida
          ? _value.unidadmedida
          : unidadmedida // ignore: cast_nullable_to_non_nullable
              as List<UnidadMedida>?,
      lineas: null == lineas
          ? _value.lineas
          : lineas // ignore: cast_nullable_to_non_nullable
              as List<Linea>,
      grupos: null == grupos
          ? _value.grupos
          : grupos // ignore: cast_nullable_to_non_nullable
              as List<Grupo>,
      subgrupos: null == subgrupos
          ? _value.subgrupos
          : subgrupos // ignore: cast_nullable_to_non_nullable
              as List<Subgrupo>,
      almacenes: null == almacenes
          ? _value.almacenes
          : almacenes // ignore: cast_nullable_to_non_nullable
              as List<Almacen>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObtenerDatosAppImplCopyWith<$Res>
    implements $ObtenerDatosAppCopyWith<$Res> {
  factory _$$ObtenerDatosAppImplCopyWith(_$ObtenerDatosAppImpl value,
          $Res Function(_$ObtenerDatosAppImpl) then) =
      __$$ObtenerDatosAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UnidadMedida>? unidadmedida,
      List<Linea> lineas,
      List<Grupo> grupos,
      List<Subgrupo> subgrupos,
      List<Almacen> almacenes});
}

/// @nodoc
class __$$ObtenerDatosAppImplCopyWithImpl<$Res>
    extends _$ObtenerDatosAppCopyWithImpl<$Res, _$ObtenerDatosAppImpl>
    implements _$$ObtenerDatosAppImplCopyWith<$Res> {
  __$$ObtenerDatosAppImplCopyWithImpl(
      _$ObtenerDatosAppImpl _value, $Res Function(_$ObtenerDatosAppImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unidadmedida = freezed,
    Object? lineas = null,
    Object? grupos = null,
    Object? subgrupos = null,
    Object? almacenes = null,
  }) {
    return _then(_$ObtenerDatosAppImpl(
      unidadmedida: freezed == unidadmedida
          ? _value._unidadmedida
          : unidadmedida // ignore: cast_nullable_to_non_nullable
              as List<UnidadMedida>?,
      lineas: null == lineas
          ? _value._lineas
          : lineas // ignore: cast_nullable_to_non_nullable
              as List<Linea>,
      grupos: null == grupos
          ? _value._grupos
          : grupos // ignore: cast_nullable_to_non_nullable
              as List<Grupo>,
      subgrupos: null == subgrupos
          ? _value._subgrupos
          : subgrupos // ignore: cast_nullable_to_non_nullable
              as List<Subgrupo>,
      almacenes: null == almacenes
          ? _value._almacenes
          : almacenes // ignore: cast_nullable_to_non_nullable
              as List<Almacen>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObtenerDatosAppImpl implements _ObtenerDatosApp {
  _$ObtenerDatosAppImpl(
      {final List<UnidadMedida>? unidadmedida,
      required final List<Linea> lineas,
      required final List<Grupo> grupos,
      required final List<Subgrupo> subgrupos,
      required final List<Almacen> almacenes})
      : _unidadmedida = unidadmedida,
        _lineas = lineas,
        _grupos = grupos,
        _subgrupos = subgrupos,
        _almacenes = almacenes;

  factory _$ObtenerDatosAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObtenerDatosAppImplFromJson(json);

  final List<UnidadMedida>? _unidadmedida;
  @override
  List<UnidadMedida>? get unidadmedida {
    final value = _unidadmedida;
    if (value == null) return null;
    if (_unidadmedida is EqualUnmodifiableListView) return _unidadmedida;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Linea> _lineas;
  @override
  List<Linea> get lineas {
    if (_lineas is EqualUnmodifiableListView) return _lineas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineas);
  }

  final List<Grupo> _grupos;
  @override
  List<Grupo> get grupos {
    if (_grupos is EqualUnmodifiableListView) return _grupos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grupos);
  }

  final List<Subgrupo> _subgrupos;
  @override
  List<Subgrupo> get subgrupos {
    if (_subgrupos is EqualUnmodifiableListView) return _subgrupos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subgrupos);
  }

  final List<Almacen> _almacenes;
  @override
  List<Almacen> get almacenes {
    if (_almacenes is EqualUnmodifiableListView) return _almacenes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_almacenes);
  }

  @override
  String toString() {
    return 'ObtenerDatosApp(unidadmedida: $unidadmedida, lineas: $lineas, grupos: $grupos, subgrupos: $subgrupos, almacenes: $almacenes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObtenerDatosAppImpl &&
            const DeepCollectionEquality()
                .equals(other._unidadmedida, _unidadmedida) &&
            const DeepCollectionEquality().equals(other._lineas, _lineas) &&
            const DeepCollectionEquality().equals(other._grupos, _grupos) &&
            const DeepCollectionEquality()
                .equals(other._subgrupos, _subgrupos) &&
            const DeepCollectionEquality()
                .equals(other._almacenes, _almacenes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_unidadmedida),
      const DeepCollectionEquality().hash(_lineas),
      const DeepCollectionEquality().hash(_grupos),
      const DeepCollectionEquality().hash(_subgrupos),
      const DeepCollectionEquality().hash(_almacenes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObtenerDatosAppImplCopyWith<_$ObtenerDatosAppImpl> get copyWith =>
      __$$ObtenerDatosAppImplCopyWithImpl<_$ObtenerDatosAppImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObtenerDatosAppImplToJson(
      this,
    );
  }
}

abstract class _ObtenerDatosApp implements ObtenerDatosApp {
  factory _ObtenerDatosApp(
      {final List<UnidadMedida>? unidadmedida,
      required final List<Linea> lineas,
      required final List<Grupo> grupos,
      required final List<Subgrupo> subgrupos,
      required final List<Almacen> almacenes}) = _$ObtenerDatosAppImpl;

  factory _ObtenerDatosApp.fromJson(Map<String, dynamic> json) =
      _$ObtenerDatosAppImpl.fromJson;

  @override
  List<UnidadMedida>? get unidadmedida;
  @override
  List<Linea> get lineas;
  @override
  List<Grupo> get grupos;
  @override
  List<Subgrupo> get subgrupos;
  @override
  List<Almacen> get almacenes;
  @override
  @JsonKey(ignore: true)
  _$$ObtenerDatosAppImplCopyWith<_$ObtenerDatosAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
