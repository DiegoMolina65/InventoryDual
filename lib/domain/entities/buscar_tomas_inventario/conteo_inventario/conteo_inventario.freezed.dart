// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conteo_inventario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConteoInventario _$ConteoInventarioFromJson(Map<String, dynamic> json) {
  return _ConteoInventario.fromJson(json);
}

/// @nodoc
mixin _$ConteoInventario {
  int get codigo => throw _privateConstructorUsedError;
  @JsonKey(name: 'numero_conteo')
  int get numeroConteo => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_ti')
  int get codigoTI => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_almacen')
  int get codigoAlmacen => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_usuario_asignado')
  int get codigoUsuarioAsignado => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_creacion')
  DateTime get fechaCreacion => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_inicio')
  DateTime get fechaInicio => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_fin')
  DateTime get fechaFin => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_conteo')
  String get estadoConteo => throw _privateConstructorUsedError;
  String get tipo => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombre_toma_inventario')
  String get nombreTomaInventario => throw _privateConstructorUsedError;
  @JsonKey(name: 'turno_trabajo')
  String? get turnoTrabajo => throw _privateConstructorUsedError;
  @JsonKey(name: 'lista_detalle_recuento_inventario')
  List<DetalleRecuentoInventario> get listaDetalleRecuentoInventario =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'usuario_asignado')
  Usuario? get usuarioAsignado => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConteoInventarioCopyWith<ConteoInventario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConteoInventarioCopyWith<$Res> {
  factory $ConteoInventarioCopyWith(
          ConteoInventario value, $Res Function(ConteoInventario) then) =
      _$ConteoInventarioCopyWithImpl<$Res, ConteoInventario>;
  @useResult
  $Res call(
      {int codigo,
      @JsonKey(name: 'numero_conteo') int numeroConteo,
      @JsonKey(name: 'codigo_ti') int codigoTI,
      @JsonKey(name: 'codigo_almacen') int codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_asignado') int codigoUsuarioAsignado,
      @JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,
      @JsonKey(name: 'fecha_inicio') DateTime fechaInicio,
      @JsonKey(name: 'fecha_fin') DateTime fechaFin,
      @JsonKey(name: 'estado_conteo') String estadoConteo,
      String tipo,
      @JsonKey(name: 'nombre_toma_inventario') String nombreTomaInventario,
      @JsonKey(name: 'turno_trabajo') String? turnoTrabajo,
      @JsonKey(name: 'lista_detalle_recuento_inventario')
      List<DetalleRecuentoInventario> listaDetalleRecuentoInventario,
      @JsonKey(name: 'usuario_asignado') Usuario? usuarioAsignado});

  $UsuarioCopyWith<$Res>? get usuarioAsignado;
}

/// @nodoc
class _$ConteoInventarioCopyWithImpl<$Res, $Val extends ConteoInventario>
    implements $ConteoInventarioCopyWith<$Res> {
  _$ConteoInventarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? numeroConteo = null,
    Object? codigoTI = null,
    Object? codigoAlmacen = null,
    Object? codigoUsuarioAsignado = null,
    Object? fechaCreacion = null,
    Object? fechaInicio = null,
    Object? fechaFin = null,
    Object? estadoConteo = null,
    Object? tipo = null,
    Object? nombreTomaInventario = null,
    Object? turnoTrabajo = freezed,
    Object? listaDetalleRecuentoInventario = null,
    Object? usuarioAsignado = freezed,
  }) {
    return _then(_value.copyWith(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      numeroConteo: null == numeroConteo
          ? _value.numeroConteo
          : numeroConteo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoTI: null == codigoTI
          ? _value.codigoTI
          : codigoTI // ignore: cast_nullable_to_non_nullable
              as int,
      codigoAlmacen: null == codigoAlmacen
          ? _value.codigoAlmacen
          : codigoAlmacen // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUsuarioAsignado: null == codigoUsuarioAsignado
          ? _value.codigoUsuarioAsignado
          : codigoUsuarioAsignado // ignore: cast_nullable_to_non_nullable
              as int,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechaInicio: null == fechaInicio
          ? _value.fechaInicio
          : fechaInicio // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechaFin: null == fechaFin
          ? _value.fechaFin
          : fechaFin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estadoConteo: null == estadoConteo
          ? _value.estadoConteo
          : estadoConteo // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      nombreTomaInventario: null == nombreTomaInventario
          ? _value.nombreTomaInventario
          : nombreTomaInventario // ignore: cast_nullable_to_non_nullable
              as String,
      turnoTrabajo: freezed == turnoTrabajo
          ? _value.turnoTrabajo
          : turnoTrabajo // ignore: cast_nullable_to_non_nullable
              as String?,
      listaDetalleRecuentoInventario: null == listaDetalleRecuentoInventario
          ? _value.listaDetalleRecuentoInventario
          : listaDetalleRecuentoInventario // ignore: cast_nullable_to_non_nullable
              as List<DetalleRecuentoInventario>,
      usuarioAsignado: freezed == usuarioAsignado
          ? _value.usuarioAsignado
          : usuarioAsignado // ignore: cast_nullable_to_non_nullable
              as Usuario?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioCopyWith<$Res>? get usuarioAsignado {
    if (_value.usuarioAsignado == null) {
      return null;
    }

    return $UsuarioCopyWith<$Res>(_value.usuarioAsignado!, (value) {
      return _then(_value.copyWith(usuarioAsignado: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConteoInventarioImplCopyWith<$Res>
    implements $ConteoInventarioCopyWith<$Res> {
  factory _$$ConteoInventarioImplCopyWith(_$ConteoInventarioImpl value,
          $Res Function(_$ConteoInventarioImpl) then) =
      __$$ConteoInventarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codigo,
      @JsonKey(name: 'numero_conteo') int numeroConteo,
      @JsonKey(name: 'codigo_ti') int codigoTI,
      @JsonKey(name: 'codigo_almacen') int codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_asignado') int codigoUsuarioAsignado,
      @JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,
      @JsonKey(name: 'fecha_inicio') DateTime fechaInicio,
      @JsonKey(name: 'fecha_fin') DateTime fechaFin,
      @JsonKey(name: 'estado_conteo') String estadoConteo,
      String tipo,
      @JsonKey(name: 'nombre_toma_inventario') String nombreTomaInventario,
      @JsonKey(name: 'turno_trabajo') String? turnoTrabajo,
      @JsonKey(name: 'lista_detalle_recuento_inventario')
      List<DetalleRecuentoInventario> listaDetalleRecuentoInventario,
      @JsonKey(name: 'usuario_asignado') Usuario? usuarioAsignado});

  @override
  $UsuarioCopyWith<$Res>? get usuarioAsignado;
}

/// @nodoc
class __$$ConteoInventarioImplCopyWithImpl<$Res>
    extends _$ConteoInventarioCopyWithImpl<$Res, _$ConteoInventarioImpl>
    implements _$$ConteoInventarioImplCopyWith<$Res> {
  __$$ConteoInventarioImplCopyWithImpl(_$ConteoInventarioImpl _value,
      $Res Function(_$ConteoInventarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? numeroConteo = null,
    Object? codigoTI = null,
    Object? codigoAlmacen = null,
    Object? codigoUsuarioAsignado = null,
    Object? fechaCreacion = null,
    Object? fechaInicio = null,
    Object? fechaFin = null,
    Object? estadoConteo = null,
    Object? tipo = null,
    Object? nombreTomaInventario = null,
    Object? turnoTrabajo = freezed,
    Object? listaDetalleRecuentoInventario = null,
    Object? usuarioAsignado = freezed,
  }) {
    return _then(_$ConteoInventarioImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      numeroConteo: null == numeroConteo
          ? _value.numeroConteo
          : numeroConteo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoTI: null == codigoTI
          ? _value.codigoTI
          : codigoTI // ignore: cast_nullable_to_non_nullable
              as int,
      codigoAlmacen: null == codigoAlmacen
          ? _value.codigoAlmacen
          : codigoAlmacen // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUsuarioAsignado: null == codigoUsuarioAsignado
          ? _value.codigoUsuarioAsignado
          : codigoUsuarioAsignado // ignore: cast_nullable_to_non_nullable
              as int,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechaInicio: null == fechaInicio
          ? _value.fechaInicio
          : fechaInicio // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechaFin: null == fechaFin
          ? _value.fechaFin
          : fechaFin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estadoConteo: null == estadoConteo
          ? _value.estadoConteo
          : estadoConteo // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      nombreTomaInventario: null == nombreTomaInventario
          ? _value.nombreTomaInventario
          : nombreTomaInventario // ignore: cast_nullable_to_non_nullable
              as String,
      turnoTrabajo: freezed == turnoTrabajo
          ? _value.turnoTrabajo
          : turnoTrabajo // ignore: cast_nullable_to_non_nullable
              as String?,
      listaDetalleRecuentoInventario: null == listaDetalleRecuentoInventario
          ? _value._listaDetalleRecuentoInventario
          : listaDetalleRecuentoInventario // ignore: cast_nullable_to_non_nullable
              as List<DetalleRecuentoInventario>,
      usuarioAsignado: freezed == usuarioAsignado
          ? _value.usuarioAsignado
          : usuarioAsignado // ignore: cast_nullable_to_non_nullable
              as Usuario?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConteoInventarioImpl implements _ConteoInventario {
  _$ConteoInventarioImpl(
      {required this.codigo,
      @JsonKey(name: 'numero_conteo') required this.numeroConteo,
      @JsonKey(name: 'codigo_ti') required this.codigoTI,
      @JsonKey(name: 'codigo_almacen') required this.codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_asignado')
      required this.codigoUsuarioAsignado,
      @JsonKey(name: 'fecha_creacion') required this.fechaCreacion,
      @JsonKey(name: 'fecha_inicio') required this.fechaInicio,
      @JsonKey(name: 'fecha_fin') required this.fechaFin,
      @JsonKey(name: 'estado_conteo') required this.estadoConteo,
      required this.tipo,
      @JsonKey(name: 'nombre_toma_inventario')
      required this.nombreTomaInventario,
      @JsonKey(name: 'turno_trabajo') required this.turnoTrabajo,
      @JsonKey(name: 'lista_detalle_recuento_inventario')
      required final List<DetalleRecuentoInventario>
          listaDetalleRecuentoInventario,
      @JsonKey(name: 'usuario_asignado') this.usuarioAsignado})
      : _listaDetalleRecuentoInventario = listaDetalleRecuentoInventario;

  factory _$ConteoInventarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConteoInventarioImplFromJson(json);

  @override
  final int codigo;
  @override
  @JsonKey(name: 'numero_conteo')
  final int numeroConteo;
  @override
  @JsonKey(name: 'codigo_ti')
  final int codigoTI;
  @override
  @JsonKey(name: 'codigo_almacen')
  final int codigoAlmacen;
  @override
  @JsonKey(name: 'codigo_usuario_asignado')
  final int codigoUsuarioAsignado;
  @override
  @JsonKey(name: 'fecha_creacion')
  final DateTime fechaCreacion;
  @override
  @JsonKey(name: 'fecha_inicio')
  final DateTime fechaInicio;
  @override
  @JsonKey(name: 'fecha_fin')
  final DateTime fechaFin;
  @override
  @JsonKey(name: 'estado_conteo')
  final String estadoConteo;
  @override
  final String tipo;
  @override
  @JsonKey(name: 'nombre_toma_inventario')
  final String nombreTomaInventario;
  @override
  @JsonKey(name: 'turno_trabajo')
  final String? turnoTrabajo;
  final List<DetalleRecuentoInventario> _listaDetalleRecuentoInventario;
  @override
  @JsonKey(name: 'lista_detalle_recuento_inventario')
  List<DetalleRecuentoInventario> get listaDetalleRecuentoInventario {
    if (_listaDetalleRecuentoInventario is EqualUnmodifiableListView)
      return _listaDetalleRecuentoInventario;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listaDetalleRecuentoInventario);
  }

  @override
  @JsonKey(name: 'usuario_asignado')
  final Usuario? usuarioAsignado;

  @override
  String toString() {
    return 'ConteoInventario(codigo: $codigo, numeroConteo: $numeroConteo, codigoTI: $codigoTI, codigoAlmacen: $codigoAlmacen, codigoUsuarioAsignado: $codigoUsuarioAsignado, fechaCreacion: $fechaCreacion, fechaInicio: $fechaInicio, fechaFin: $fechaFin, estadoConteo: $estadoConteo, tipo: $tipo, nombreTomaInventario: $nombreTomaInventario, turnoTrabajo: $turnoTrabajo, listaDetalleRecuentoInventario: $listaDetalleRecuentoInventario, usuarioAsignado: $usuarioAsignado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConteoInventarioImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.numeroConteo, numeroConteo) ||
                other.numeroConteo == numeroConteo) &&
            (identical(other.codigoTI, codigoTI) ||
                other.codigoTI == codigoTI) &&
            (identical(other.codigoAlmacen, codigoAlmacen) ||
                other.codigoAlmacen == codigoAlmacen) &&
            (identical(other.codigoUsuarioAsignado, codigoUsuarioAsignado) ||
                other.codigoUsuarioAsignado == codigoUsuarioAsignado) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion) &&
            (identical(other.fechaInicio, fechaInicio) ||
                other.fechaInicio == fechaInicio) &&
            (identical(other.fechaFin, fechaFin) ||
                other.fechaFin == fechaFin) &&
            (identical(other.estadoConteo, estadoConteo) ||
                other.estadoConteo == estadoConteo) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.nombreTomaInventario, nombreTomaInventario) ||
                other.nombreTomaInventario == nombreTomaInventario) &&
            (identical(other.turnoTrabajo, turnoTrabajo) ||
                other.turnoTrabajo == turnoTrabajo) &&
            const DeepCollectionEquality().equals(
                other._listaDetalleRecuentoInventario,
                _listaDetalleRecuentoInventario) &&
            (identical(other.usuarioAsignado, usuarioAsignado) ||
                other.usuarioAsignado == usuarioAsignado));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codigo,
      numeroConteo,
      codigoTI,
      codigoAlmacen,
      codigoUsuarioAsignado,
      fechaCreacion,
      fechaInicio,
      fechaFin,
      estadoConteo,
      tipo,
      nombreTomaInventario,
      turnoTrabajo,
      const DeepCollectionEquality().hash(_listaDetalleRecuentoInventario),
      usuarioAsignado);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConteoInventarioImplCopyWith<_$ConteoInventarioImpl> get copyWith =>
      __$$ConteoInventarioImplCopyWithImpl<_$ConteoInventarioImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConteoInventarioImplToJson(
      this,
    );
  }
}

abstract class _ConteoInventario implements ConteoInventario {
  factory _ConteoInventario(
      {required final int codigo,
      @JsonKey(name: 'numero_conteo') required final int numeroConteo,
      @JsonKey(name: 'codigo_ti') required final int codigoTI,
      @JsonKey(name: 'codigo_almacen') required final int codigoAlmacen,
      @JsonKey(name: 'codigo_usuario_asignado')
      required final int codigoUsuarioAsignado,
      @JsonKey(name: 'fecha_creacion') required final DateTime fechaCreacion,
      @JsonKey(name: 'fecha_inicio') required final DateTime fechaInicio,
      @JsonKey(name: 'fecha_fin') required final DateTime fechaFin,
      @JsonKey(name: 'estado_conteo') required final String estadoConteo,
      required final String tipo,
      @JsonKey(name: 'nombre_toma_inventario')
      required final String nombreTomaInventario,
      @JsonKey(name: 'turno_trabajo') required final String? turnoTrabajo,
      @JsonKey(name: 'lista_detalle_recuento_inventario')
      required final List<DetalleRecuentoInventario>
          listaDetalleRecuentoInventario,
      @JsonKey(name: 'usuario_asignado')
      final Usuario? usuarioAsignado}) = _$ConteoInventarioImpl;

  factory _ConteoInventario.fromJson(Map<String, dynamic> json) =
      _$ConteoInventarioImpl.fromJson;

  @override
  int get codigo;
  @override
  @JsonKey(name: 'numero_conteo')
  int get numeroConteo;
  @override
  @JsonKey(name: 'codigo_ti')
  int get codigoTI;
  @override
  @JsonKey(name: 'codigo_almacen')
  int get codigoAlmacen;
  @override
  @JsonKey(name: 'codigo_usuario_asignado')
  int get codigoUsuarioAsignado;
  @override
  @JsonKey(name: 'fecha_creacion')
  DateTime get fechaCreacion;
  @override
  @JsonKey(name: 'fecha_inicio')
  DateTime get fechaInicio;
  @override
  @JsonKey(name: 'fecha_fin')
  DateTime get fechaFin;
  @override
  @JsonKey(name: 'estado_conteo')
  String get estadoConteo;
  @override
  String get tipo;
  @override
  @JsonKey(name: 'nombre_toma_inventario')
  String get nombreTomaInventario;
  @override
  @JsonKey(name: 'turno_trabajo')
  String? get turnoTrabajo;
  @override
  @JsonKey(name: 'lista_detalle_recuento_inventario')
  List<DetalleRecuentoInventario> get listaDetalleRecuentoInventario;
  @override
  @JsonKey(name: 'usuario_asignado')
  Usuario? get usuarioAsignado;
  @override
  @JsonKey(ignore: true)
  _$$ConteoInventarioImplCopyWith<_$ConteoInventarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
