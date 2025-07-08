// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toma_inventario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TomasInventario _$TomasInventarioFromJson(Map<String, dynamic> json) {
  return _TomasInventario.fromJson(json);
}

/// @nodoc
mixin _$TomasInventario {
  int get codigo => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_almacen')
  int get codigoAlmacen => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_usuario_creador')
  int get codigoUsuarioCreador => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_registro')
  DateTime get fechaRegistro => throw _privateConstructorUsedError;
  String get estado => throw _privateConstructorUsedError;
  String get tipo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_producto')
  int get cantidadProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_conteo')
  int get cantidadConteo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_conteo_finalizado')
  int get cantidadConteoFinalizado => throw _privateConstructorUsedError;
  @JsonKey(name: 'lista_detalle_producto')
  List<ListaDetalleProducto>? get listaDetalleProducto =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'lista_conteo_inventario')
  List<ConteoInventario>? get listaConteoInventario =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TomasInventarioCopyWith<TomasInventario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomasInventarioCopyWith<$Res> {
  factory $TomasInventarioCopyWith(
          TomasInventario value, $Res Function(TomasInventario) then) =
      _$TomasInventarioCopyWithImpl<$Res, TomasInventario>;
  @useResult
  $Res call(
      {int codigo,
      String nombre,
      @JsonKey(name: 'codigo_almacen') int codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_creador') int codigoUsuarioCreador,
      @JsonKey(name: 'fecha_registro') DateTime fechaRegistro,
      String estado,
      String tipo,
      @JsonKey(name: 'cantidad_producto') int cantidadProducto,
      @JsonKey(name: 'cantidad_conteo') int cantidadConteo,
      @JsonKey(name: 'cantidad_conteo_finalizado') int cantidadConteoFinalizado,
      @JsonKey(name: 'lista_detalle_producto')
      List<ListaDetalleProducto>? listaDetalleProducto,
      @JsonKey(name: 'lista_conteo_inventario')
      List<ConteoInventario>? listaConteoInventario});
}

/// @nodoc
class _$TomasInventarioCopyWithImpl<$Res, $Val extends TomasInventario>
    implements $TomasInventarioCopyWith<$Res> {
  _$TomasInventarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
    Object? codigoAlmacen = null,
    Object? codigoUsuarioCreador = null,
    Object? fechaRegistro = null,
    Object? estado = null,
    Object? tipo = null,
    Object? cantidadProducto = null,
    Object? cantidadConteo = null,
    Object? cantidadConteoFinalizado = null,
    Object? listaDetalleProducto = freezed,
    Object? listaConteoInventario = freezed,
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
      codigoAlmacen: null == codigoAlmacen
          ? _value.codigoAlmacen
          : codigoAlmacen // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUsuarioCreador: null == codigoUsuarioCreador
          ? _value.codigoUsuarioCreador
          : codigoUsuarioCreador // ignore: cast_nullable_to_non_nullable
              as int,
      fechaRegistro: null == fechaRegistro
          ? _value.fechaRegistro
          : fechaRegistro // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadProducto: null == cantidadProducto
          ? _value.cantidadProducto
          : cantidadProducto // ignore: cast_nullable_to_non_nullable
              as int,
      cantidadConteo: null == cantidadConteo
          ? _value.cantidadConteo
          : cantidadConteo // ignore: cast_nullable_to_non_nullable
              as int,
      cantidadConteoFinalizado: null == cantidadConteoFinalizado
          ? _value.cantidadConteoFinalizado
          : cantidadConteoFinalizado // ignore: cast_nullable_to_non_nullable
              as int,
      listaDetalleProducto: freezed == listaDetalleProducto
          ? _value.listaDetalleProducto
          : listaDetalleProducto // ignore: cast_nullable_to_non_nullable
              as List<ListaDetalleProducto>?,
      listaConteoInventario: freezed == listaConteoInventario
          ? _value.listaConteoInventario
          : listaConteoInventario // ignore: cast_nullable_to_non_nullable
              as List<ConteoInventario>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TomasInventarioImplCopyWith<$Res>
    implements $TomasInventarioCopyWith<$Res> {
  factory _$$TomasInventarioImplCopyWith(_$TomasInventarioImpl value,
          $Res Function(_$TomasInventarioImpl) then) =
      __$$TomasInventarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codigo,
      String nombre,
      @JsonKey(name: 'codigo_almacen') int codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_creador') int codigoUsuarioCreador,
      @JsonKey(name: 'fecha_registro') DateTime fechaRegistro,
      String estado,
      String tipo,
      @JsonKey(name: 'cantidad_producto') int cantidadProducto,
      @JsonKey(name: 'cantidad_conteo') int cantidadConteo,
      @JsonKey(name: 'cantidad_conteo_finalizado') int cantidadConteoFinalizado,
      @JsonKey(name: 'lista_detalle_producto')
      List<ListaDetalleProducto>? listaDetalleProducto,
      @JsonKey(name: 'lista_conteo_inventario')
      List<ConteoInventario>? listaConteoInventario});
}

/// @nodoc
class __$$TomasInventarioImplCopyWithImpl<$Res>
    extends _$TomasInventarioCopyWithImpl<$Res, _$TomasInventarioImpl>
    implements _$$TomasInventarioImplCopyWith<$Res> {
  __$$TomasInventarioImplCopyWithImpl(
      _$TomasInventarioImpl _value, $Res Function(_$TomasInventarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
    Object? codigoAlmacen = null,
    Object? codigoUsuarioCreador = null,
    Object? fechaRegistro = null,
    Object? estado = null,
    Object? tipo = null,
    Object? cantidadProducto = null,
    Object? cantidadConteo = null,
    Object? cantidadConteoFinalizado = null,
    Object? listaDetalleProducto = freezed,
    Object? listaConteoInventario = freezed,
  }) {
    return _then(_$TomasInventarioImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      codigoAlmacen: null == codigoAlmacen
          ? _value.codigoAlmacen
          : codigoAlmacen // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUsuarioCreador: null == codigoUsuarioCreador
          ? _value.codigoUsuarioCreador
          : codigoUsuarioCreador // ignore: cast_nullable_to_non_nullable
              as int,
      fechaRegistro: null == fechaRegistro
          ? _value.fechaRegistro
          : fechaRegistro // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadProducto: null == cantidadProducto
          ? _value.cantidadProducto
          : cantidadProducto // ignore: cast_nullable_to_non_nullable
              as int,
      cantidadConteo: null == cantidadConteo
          ? _value.cantidadConteo
          : cantidadConteo // ignore: cast_nullable_to_non_nullable
              as int,
      cantidadConteoFinalizado: null == cantidadConteoFinalizado
          ? _value.cantidadConteoFinalizado
          : cantidadConteoFinalizado // ignore: cast_nullable_to_non_nullable
              as int,
      listaDetalleProducto: freezed == listaDetalleProducto
          ? _value._listaDetalleProducto
          : listaDetalleProducto // ignore: cast_nullable_to_non_nullable
              as List<ListaDetalleProducto>?,
      listaConteoInventario: freezed == listaConteoInventario
          ? _value._listaConteoInventario
          : listaConteoInventario // ignore: cast_nullable_to_non_nullable
              as List<ConteoInventario>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TomasInventarioImpl implements _TomasInventario {
  _$TomasInventarioImpl(
      {required this.codigo,
      required this.nombre,
      @JsonKey(name: 'codigo_almacen') required this.codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_creador')
      required this.codigoUsuarioCreador,
      @JsonKey(name: 'fecha_registro') required this.fechaRegistro,
      required this.estado,
      required this.tipo,
      @JsonKey(name: 'cantidad_producto') required this.cantidadProducto,
      @JsonKey(name: 'cantidad_conteo') required this.cantidadConteo,
      @JsonKey(name: 'cantidad_conteo_finalizado')
      required this.cantidadConteoFinalizado,
      @JsonKey(name: 'lista_detalle_producto')
      final List<ListaDetalleProducto>? listaDetalleProducto,
      @JsonKey(name: 'lista_conteo_inventario')
      final List<ConteoInventario>? listaConteoInventario})
      : _listaDetalleProducto = listaDetalleProducto,
        _listaConteoInventario = listaConteoInventario;

  factory _$TomasInventarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$TomasInventarioImplFromJson(json);

  @override
  final int codigo;
  @override
  final String nombre;
  @override
  @JsonKey(name: 'codigo_almacen')
  final int codigoAlmacen;
  @override
  @JsonKey(name: 'codigo_usuario_creador')
  final int codigoUsuarioCreador;
  @override
  @JsonKey(name: 'fecha_registro')
  final DateTime fechaRegistro;
  @override
  final String estado;
  @override
  final String tipo;
  @override
  @JsonKey(name: 'cantidad_producto')
  final int cantidadProducto;
  @override
  @JsonKey(name: 'cantidad_conteo')
  final int cantidadConteo;
  @override
  @JsonKey(name: 'cantidad_conteo_finalizado')
  final int cantidadConteoFinalizado;
  final List<ListaDetalleProducto>? _listaDetalleProducto;
  @override
  @JsonKey(name: 'lista_detalle_producto')
  List<ListaDetalleProducto>? get listaDetalleProducto {
    final value = _listaDetalleProducto;
    if (value == null) return null;
    if (_listaDetalleProducto is EqualUnmodifiableListView)
      return _listaDetalleProducto;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ConteoInventario>? _listaConteoInventario;
  @override
  @JsonKey(name: 'lista_conteo_inventario')
  List<ConteoInventario>? get listaConteoInventario {
    final value = _listaConteoInventario;
    if (value == null) return null;
    if (_listaConteoInventario is EqualUnmodifiableListView)
      return _listaConteoInventario;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TomasInventario(codigo: $codigo, nombre: $nombre, codigoAlmacen: $codigoAlmacen, codigoUsuarioCreador: $codigoUsuarioCreador, fechaRegistro: $fechaRegistro, estado: $estado, tipo: $tipo, cantidadProducto: $cantidadProducto, cantidadConteo: $cantidadConteo, cantidadConteoFinalizado: $cantidadConteoFinalizado, listaDetalleProducto: $listaDetalleProducto, listaConteoInventario: $listaConteoInventario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TomasInventarioImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.codigoAlmacen, codigoAlmacen) ||
                other.codigoAlmacen == codigoAlmacen) &&
            (identical(other.codigoUsuarioCreador, codigoUsuarioCreador) ||
                other.codigoUsuarioCreador == codigoUsuarioCreador) &&
            (identical(other.fechaRegistro, fechaRegistro) ||
                other.fechaRegistro == fechaRegistro) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.cantidadProducto, cantidadProducto) ||
                other.cantidadProducto == cantidadProducto) &&
            (identical(other.cantidadConteo, cantidadConteo) ||
                other.cantidadConteo == cantidadConteo) &&
            (identical(
                    other.cantidadConteoFinalizado, cantidadConteoFinalizado) ||
                other.cantidadConteoFinalizado == cantidadConteoFinalizado) &&
            const DeepCollectionEquality()
                .equals(other._listaDetalleProducto, _listaDetalleProducto) &&
            const DeepCollectionEquality()
                .equals(other._listaConteoInventario, _listaConteoInventario));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codigo,
      nombre,
      codigoAlmacen,
      codigoUsuarioCreador,
      fechaRegistro,
      estado,
      tipo,
      cantidadProducto,
      cantidadConteo,
      cantidadConteoFinalizado,
      const DeepCollectionEquality().hash(_listaDetalleProducto),
      const DeepCollectionEquality().hash(_listaConteoInventario));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TomasInventarioImplCopyWith<_$TomasInventarioImpl> get copyWith =>
      __$$TomasInventarioImplCopyWithImpl<_$TomasInventarioImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TomasInventarioImplToJson(
      this,
    );
  }
}

abstract class _TomasInventario implements TomasInventario {
  factory _TomasInventario(
      {required final int codigo,
      required final String nombre,
      @JsonKey(name: 'codigo_almacen') required final int codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_creador')
      required final int codigoUsuarioCreador,
      @JsonKey(name: 'fecha_registro') required final DateTime fechaRegistro,
      required final String estado,
      required final String tipo,
      @JsonKey(name: 'cantidad_producto') required final int cantidadProducto,
      @JsonKey(name: 'cantidad_conteo') required final int cantidadConteo,
      @JsonKey(name: 'cantidad_conteo_finalizado')
      required final int cantidadConteoFinalizado,
      @JsonKey(name: 'lista_detalle_producto')
      final List<ListaDetalleProducto>? listaDetalleProducto,
      @JsonKey(name: 'lista_conteo_inventario')
      final List<ConteoInventario>?
          listaConteoInventario}) = _$TomasInventarioImpl;

  factory _TomasInventario.fromJson(Map<String, dynamic> json) =
      _$TomasInventarioImpl.fromJson;

  @override
  int get codigo;
  @override
  String get nombre;
  @override
  @JsonKey(name: 'codigo_almacen')
  int get codigoAlmacen;
  @override
  @JsonKey(name: 'codigo_usuario_creador')
  int get codigoUsuarioCreador;
  @override
  @JsonKey(name: 'fecha_registro')
  DateTime get fechaRegistro;
  @override
  String get estado;
  @override
  String get tipo;
  @override
  @JsonKey(name: 'cantidad_producto')
  int get cantidadProducto;
  @override
  @JsonKey(name: 'cantidad_conteo')
  int get cantidadConteo;
  @override
  @JsonKey(name: 'cantidad_conteo_finalizado')
  int get cantidadConteoFinalizado;
  @override
  @JsonKey(name: 'lista_detalle_producto')
  List<ListaDetalleProducto>? get listaDetalleProducto;
  @override
  @JsonKey(name: 'lista_conteo_inventario')
  List<ConteoInventario>? get listaConteoInventario;
  @override
  @JsonKey(ignore: true)
  _$$TomasInventarioImplCopyWith<_$TomasInventarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
