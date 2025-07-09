// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detalle_recuento_inventario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetalleRecuentoInventario _$DetalleRecuentoInventarioFromJson(
    Map<String, dynamic> json) {
  return _DetalleRecuentoInventario.fromJson(json);
}

/// @nodoc
mixin _$DetalleRecuentoInventario {
  @JsonKey(name: 'codigo_conteo_inventario')
  int get codigoConteoInventario => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_producto')
  String get codigoProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombre_producto')
  String get nombreProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_stock')
  double get cantidadStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_stock_inicial')
  double get cantidadStockInicial => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_conteo')
  double get cantidadConteo => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_unidad_medida')
  int? get codigoUnidadMedida => throw _privateConstructorUsedError;
  String get observaciones => throw _privateConstructorUsedError;
  @JsonKey(name: 'verificar_ubicacion')
  bool get verificarUbicacion => throw _privateConstructorUsedError;
  @JsonKey(name: 'ubicacion_correcta')
  String get ubicacionCorrecta => throw _privateConstructorUsedError;
  @JsonKey(name: 'json_detalle_conteo')
  String get jsonDetalleConteo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fecha_conteo')
  DateTime get fechaConteo => throw _privateConstructorUsedError;
  String? get codigoLote => throw _privateConstructorUsedError;
  Producto? get producto =>
      throw _privateConstructorUsedError; // List<LotesEntidad>? listaLotes, // SOLO LECTURA
  @JsonKey(name: 'lista_imagen_conteo')
  List<ConteoImagen>? get listaImagenConteo =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'lista_detalle_conteo')
  List<ConteoDetalle>? get listaDetalleConteo =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true, name: 'um_base')
  UnitMeasureModel? get umBase => throw _privateConstructorUsedError;
  @JsonKey(ignore: true, name: 'um_low')
  UnitMeasureModel? get umLow => throw _privateConstructorUsedError;
  @JsonKey(ignore: true, name: 'numero_conteo')
  int? get numeroConteo => throw _privateConstructorUsedError;
  @JsonKey(ignore: true, name: 'es_confirmado')
  bool? get esConfirmado => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetalleRecuentoInventarioCopyWith<DetalleRecuentoInventario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetalleRecuentoInventarioCopyWith<$Res> {
  factory $DetalleRecuentoInventarioCopyWith(DetalleRecuentoInventario value,
          $Res Function(DetalleRecuentoInventario) then) =
      _$DetalleRecuentoInventarioCopyWithImpl<$Res, DetalleRecuentoInventario>;
  @useResult
  $Res call(
      {@JsonKey(name: 'codigo_conteo_inventario') int codigoConteoInventario,
      @JsonKey(name: 'codigo_producto') String codigoProducto,
      @JsonKey(name: 'nombre_producto') String nombreProducto,
      @JsonKey(name: 'cantidad_stock') double cantidadStock,
      @JsonKey(name: 'cantidad_stock_inicial') double cantidadStockInicial,
      @JsonKey(name: 'cantidad_conteo') double cantidadConteo,
      @JsonKey(name: 'codigo_unidad_medida') int? codigoUnidadMedida,
      String observaciones,
      @JsonKey(name: 'verificar_ubicacion') bool verificarUbicacion,
      @JsonKey(name: 'ubicacion_correcta') String ubicacionCorrecta,
      @JsonKey(name: 'json_detalle_conteo') String jsonDetalleConteo,
      @JsonKey(name: 'fecha_conteo') DateTime fechaConteo,
      String? codigoLote,
      Producto? producto,
      @JsonKey(name: 'lista_imagen_conteo')
      List<ConteoImagen>? listaImagenConteo,
      @JsonKey(name: 'lista_detalle_conteo')
      List<ConteoDetalle>? listaDetalleConteo,
      @JsonKey(ignore: true, name: 'um_base') UnitMeasureModel? umBase,
      @JsonKey(ignore: true, name: 'um_low') UnitMeasureModel? umLow,
      @JsonKey(ignore: true, name: 'numero_conteo') int? numeroConteo,
      @JsonKey(ignore: true, name: 'es_confirmado') bool? esConfirmado});

  $ProductoCopyWith<$Res>? get producto;
  $UnitMeasureModelCopyWith<$Res>? get umBase;
  $UnitMeasureModelCopyWith<$Res>? get umLow;
}

/// @nodoc
class _$DetalleRecuentoInventarioCopyWithImpl<$Res,
        $Val extends DetalleRecuentoInventario>
    implements $DetalleRecuentoInventarioCopyWith<$Res> {
  _$DetalleRecuentoInventarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoConteoInventario = null,
    Object? codigoProducto = null,
    Object? nombreProducto = null,
    Object? cantidadStock = null,
    Object? cantidadStockInicial = null,
    Object? cantidadConteo = null,
    Object? codigoUnidadMedida = freezed,
    Object? observaciones = null,
    Object? verificarUbicacion = null,
    Object? ubicacionCorrecta = null,
    Object? jsonDetalleConteo = null,
    Object? fechaConteo = null,
    Object? codigoLote = freezed,
    Object? producto = freezed,
    Object? listaImagenConteo = freezed,
    Object? listaDetalleConteo = freezed,
    Object? umBase = freezed,
    Object? umLow = freezed,
    Object? numeroConteo = freezed,
    Object? esConfirmado = freezed,
  }) {
    return _then(_value.copyWith(
      codigoConteoInventario: null == codigoConteoInventario
          ? _value.codigoConteoInventario
          : codigoConteoInventario // ignore: cast_nullable_to_non_nullable
              as int,
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      nombreProducto: null == nombreProducto
          ? _value.nombreProducto
          : nombreProducto // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadStock: null == cantidadStock
          ? _value.cantidadStock
          : cantidadStock // ignore: cast_nullable_to_non_nullable
              as double,
      cantidadStockInicial: null == cantidadStockInicial
          ? _value.cantidadStockInicial
          : cantidadStockInicial // ignore: cast_nullable_to_non_nullable
              as double,
      cantidadConteo: null == cantidadConteo
          ? _value.cantidadConteo
          : cantidadConteo // ignore: cast_nullable_to_non_nullable
              as double,
      codigoUnidadMedida: freezed == codigoUnidadMedida
          ? _value.codigoUnidadMedida
          : codigoUnidadMedida // ignore: cast_nullable_to_non_nullable
              as int?,
      observaciones: null == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String,
      verificarUbicacion: null == verificarUbicacion
          ? _value.verificarUbicacion
          : verificarUbicacion // ignore: cast_nullable_to_non_nullable
              as bool,
      ubicacionCorrecta: null == ubicacionCorrecta
          ? _value.ubicacionCorrecta
          : ubicacionCorrecta // ignore: cast_nullable_to_non_nullable
              as String,
      jsonDetalleConteo: null == jsonDetalleConteo
          ? _value.jsonDetalleConteo
          : jsonDetalleConteo // ignore: cast_nullable_to_non_nullable
              as String,
      fechaConteo: null == fechaConteo
          ? _value.fechaConteo
          : fechaConteo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codigoLote: freezed == codigoLote
          ? _value.codigoLote
          : codigoLote // ignore: cast_nullable_to_non_nullable
              as String?,
      producto: freezed == producto
          ? _value.producto
          : producto // ignore: cast_nullable_to_non_nullable
              as Producto?,
      listaImagenConteo: freezed == listaImagenConteo
          ? _value.listaImagenConteo
          : listaImagenConteo // ignore: cast_nullable_to_non_nullable
              as List<ConteoImagen>?,
      listaDetalleConteo: freezed == listaDetalleConteo
          ? _value.listaDetalleConteo
          : listaDetalleConteo // ignore: cast_nullable_to_non_nullable
              as List<ConteoDetalle>?,
      umBase: freezed == umBase
          ? _value.umBase
          : umBase // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      umLow: freezed == umLow
          ? _value.umLow
          : umLow // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      numeroConteo: freezed == numeroConteo
          ? _value.numeroConteo
          : numeroConteo // ignore: cast_nullable_to_non_nullable
              as int?,
      esConfirmado: freezed == esConfirmado
          ? _value.esConfirmado
          : esConfirmado // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductoCopyWith<$Res>? get producto {
    if (_value.producto == null) {
      return null;
    }

    return $ProductoCopyWith<$Res>(_value.producto!, (value) {
      return _then(_value.copyWith(producto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitMeasureModelCopyWith<$Res>? get umBase {
    if (_value.umBase == null) {
      return null;
    }

    return $UnitMeasureModelCopyWith<$Res>(_value.umBase!, (value) {
      return _then(_value.copyWith(umBase: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitMeasureModelCopyWith<$Res>? get umLow {
    if (_value.umLow == null) {
      return null;
    }

    return $UnitMeasureModelCopyWith<$Res>(_value.umLow!, (value) {
      return _then(_value.copyWith(umLow: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetalleRecuentoInventarioImplCopyWith<$Res>
    implements $DetalleRecuentoInventarioCopyWith<$Res> {
  factory _$$DetalleRecuentoInventarioImplCopyWith(
          _$DetalleRecuentoInventarioImpl value,
          $Res Function(_$DetalleRecuentoInventarioImpl) then) =
      __$$DetalleRecuentoInventarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'codigo_conteo_inventario') int codigoConteoInventario,
      @JsonKey(name: 'codigo_producto') String codigoProducto,
      @JsonKey(name: 'nombre_producto') String nombreProducto,
      @JsonKey(name: 'cantidad_stock') double cantidadStock,
      @JsonKey(name: 'cantidad_stock_inicial') double cantidadStockInicial,
      @JsonKey(name: 'cantidad_conteo') double cantidadConteo,
      @JsonKey(name: 'codigo_unidad_medida') int? codigoUnidadMedida,
      String observaciones,
      @JsonKey(name: 'verificar_ubicacion') bool verificarUbicacion,
      @JsonKey(name: 'ubicacion_correcta') String ubicacionCorrecta,
      @JsonKey(name: 'json_detalle_conteo') String jsonDetalleConteo,
      @JsonKey(name: 'fecha_conteo') DateTime fechaConteo,
      String? codigoLote,
      Producto? producto,
      @JsonKey(name: 'lista_imagen_conteo')
      List<ConteoImagen>? listaImagenConteo,
      @JsonKey(name: 'lista_detalle_conteo')
      List<ConteoDetalle>? listaDetalleConteo,
      @JsonKey(ignore: true, name: 'um_base') UnitMeasureModel? umBase,
      @JsonKey(ignore: true, name: 'um_low') UnitMeasureModel? umLow,
      @JsonKey(ignore: true, name: 'numero_conteo') int? numeroConteo,
      @JsonKey(ignore: true, name: 'es_confirmado') bool? esConfirmado});

  @override
  $ProductoCopyWith<$Res>? get producto;
  @override
  $UnitMeasureModelCopyWith<$Res>? get umBase;
  @override
  $UnitMeasureModelCopyWith<$Res>? get umLow;
}

/// @nodoc
class __$$DetalleRecuentoInventarioImplCopyWithImpl<$Res>
    extends _$DetalleRecuentoInventarioCopyWithImpl<$Res,
        _$DetalleRecuentoInventarioImpl>
    implements _$$DetalleRecuentoInventarioImplCopyWith<$Res> {
  __$$DetalleRecuentoInventarioImplCopyWithImpl(
      _$DetalleRecuentoInventarioImpl _value,
      $Res Function(_$DetalleRecuentoInventarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoConteoInventario = null,
    Object? codigoProducto = null,
    Object? nombreProducto = null,
    Object? cantidadStock = null,
    Object? cantidadStockInicial = null,
    Object? cantidadConteo = null,
    Object? codigoUnidadMedida = freezed,
    Object? observaciones = null,
    Object? verificarUbicacion = null,
    Object? ubicacionCorrecta = null,
    Object? jsonDetalleConteo = null,
    Object? fechaConteo = null,
    Object? codigoLote = freezed,
    Object? producto = freezed,
    Object? listaImagenConteo = freezed,
    Object? listaDetalleConteo = freezed,
    Object? umBase = freezed,
    Object? umLow = freezed,
    Object? numeroConteo = freezed,
    Object? esConfirmado = freezed,
  }) {
    return _then(_$DetalleRecuentoInventarioImpl(
      codigoConteoInventario: null == codigoConteoInventario
          ? _value.codigoConteoInventario
          : codigoConteoInventario // ignore: cast_nullable_to_non_nullable
              as int,
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      nombreProducto: null == nombreProducto
          ? _value.nombreProducto
          : nombreProducto // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadStock: null == cantidadStock
          ? _value.cantidadStock
          : cantidadStock // ignore: cast_nullable_to_non_nullable
              as double,
      cantidadStockInicial: null == cantidadStockInicial
          ? _value.cantidadStockInicial
          : cantidadStockInicial // ignore: cast_nullable_to_non_nullable
              as double,
      cantidadConteo: null == cantidadConteo
          ? _value.cantidadConteo
          : cantidadConteo // ignore: cast_nullable_to_non_nullable
              as double,
      codigoUnidadMedida: freezed == codigoUnidadMedida
          ? _value.codigoUnidadMedida
          : codigoUnidadMedida // ignore: cast_nullable_to_non_nullable
              as int?,
      observaciones: null == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String,
      verificarUbicacion: null == verificarUbicacion
          ? _value.verificarUbicacion
          : verificarUbicacion // ignore: cast_nullable_to_non_nullable
              as bool,
      ubicacionCorrecta: null == ubicacionCorrecta
          ? _value.ubicacionCorrecta
          : ubicacionCorrecta // ignore: cast_nullable_to_non_nullable
              as String,
      jsonDetalleConteo: null == jsonDetalleConteo
          ? _value.jsonDetalleConteo
          : jsonDetalleConteo // ignore: cast_nullable_to_non_nullable
              as String,
      fechaConteo: null == fechaConteo
          ? _value.fechaConteo
          : fechaConteo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codigoLote: freezed == codigoLote
          ? _value.codigoLote
          : codigoLote // ignore: cast_nullable_to_non_nullable
              as String?,
      producto: freezed == producto
          ? _value.producto
          : producto // ignore: cast_nullable_to_non_nullable
              as Producto?,
      listaImagenConteo: freezed == listaImagenConteo
          ? _value._listaImagenConteo
          : listaImagenConteo // ignore: cast_nullable_to_non_nullable
              as List<ConteoImagen>?,
      listaDetalleConteo: freezed == listaDetalleConteo
          ? _value._listaDetalleConteo
          : listaDetalleConteo // ignore: cast_nullable_to_non_nullable
              as List<ConteoDetalle>?,
      umBase: freezed == umBase
          ? _value.umBase
          : umBase // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      umLow: freezed == umLow
          ? _value.umLow
          : umLow // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      numeroConteo: freezed == numeroConteo
          ? _value.numeroConteo
          : numeroConteo // ignore: cast_nullable_to_non_nullable
              as int?,
      esConfirmado: freezed == esConfirmado
          ? _value.esConfirmado
          : esConfirmado // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetalleRecuentoInventarioImpl implements _DetalleRecuentoInventario {
  _$DetalleRecuentoInventarioImpl(
      {@JsonKey(name: 'codigo_conteo_inventario')
      required this.codigoConteoInventario,
      @JsonKey(name: 'codigo_producto') required this.codigoProducto,
      @JsonKey(name: 'nombre_producto') required this.nombreProducto,
      @JsonKey(name: 'cantidad_stock') required this.cantidadStock,
      @JsonKey(name: 'cantidad_stock_inicial')
      required this.cantidadStockInicial,
      @JsonKey(name: 'cantidad_conteo') required this.cantidadConteo,
      @JsonKey(name: 'codigo_unidad_medida') required this.codigoUnidadMedida,
      required this.observaciones,
      @JsonKey(name: 'verificar_ubicacion') required this.verificarUbicacion,
      @JsonKey(name: 'ubicacion_correcta') required this.ubicacionCorrecta,
      @JsonKey(name: 'json_detalle_conteo') required this.jsonDetalleConteo,
      @JsonKey(name: 'fecha_conteo') required this.fechaConteo,
      this.codigoLote,
      required this.producto,
      @JsonKey(name: 'lista_imagen_conteo')
      final List<ConteoImagen>? listaImagenConteo,
      @JsonKey(name: 'lista_detalle_conteo')
      final List<ConteoDetalle>? listaDetalleConteo,
      @JsonKey(ignore: true, name: 'um_base') this.umBase,
      @JsonKey(ignore: true, name: 'um_low') this.umLow,
      @JsonKey(ignore: true, name: 'numero_conteo') this.numeroConteo,
      @JsonKey(ignore: true, name: 'es_confirmado') this.esConfirmado})
      : _listaImagenConteo = listaImagenConteo,
        _listaDetalleConteo = listaDetalleConteo;

  factory _$DetalleRecuentoInventarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetalleRecuentoInventarioImplFromJson(json);

  @override
  @JsonKey(name: 'codigo_conteo_inventario')
  final int codigoConteoInventario;
  @override
  @JsonKey(name: 'codigo_producto')
  final String codigoProducto;
  @override
  @JsonKey(name: 'nombre_producto')
  final String nombreProducto;
  @override
  @JsonKey(name: 'cantidad_stock')
  final double cantidadStock;
  @override
  @JsonKey(name: 'cantidad_stock_inicial')
  final double cantidadStockInicial;
  @override
  @JsonKey(name: 'cantidad_conteo')
  final double cantidadConteo;
  @override
  @JsonKey(name: 'codigo_unidad_medida')
  final int? codigoUnidadMedida;
  @override
  final String observaciones;
  @override
  @JsonKey(name: 'verificar_ubicacion')
  final bool verificarUbicacion;
  @override
  @JsonKey(name: 'ubicacion_correcta')
  final String ubicacionCorrecta;
  @override
  @JsonKey(name: 'json_detalle_conteo')
  final String jsonDetalleConteo;
  @override
  @JsonKey(name: 'fecha_conteo')
  final DateTime fechaConteo;
  @override
  final String? codigoLote;
  @override
  final Producto? producto;
// List<LotesEntidad>? listaLotes, // SOLO LECTURA
  final List<ConteoImagen>? _listaImagenConteo;
// List<LotesEntidad>? listaLotes, // SOLO LECTURA
  @override
  @JsonKey(name: 'lista_imagen_conteo')
  List<ConteoImagen>? get listaImagenConteo {
    final value = _listaImagenConteo;
    if (value == null) return null;
    if (_listaImagenConteo is EqualUnmodifiableListView)
      return _listaImagenConteo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ConteoDetalle>? _listaDetalleConteo;
  @override
  @JsonKey(name: 'lista_detalle_conteo')
  List<ConteoDetalle>? get listaDetalleConteo {
    final value = _listaDetalleConteo;
    if (value == null) return null;
    if (_listaDetalleConteo is EqualUnmodifiableListView)
      return _listaDetalleConteo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(ignore: true, name: 'um_base')
  final UnitMeasureModel? umBase;
  @override
  @JsonKey(ignore: true, name: 'um_low')
  final UnitMeasureModel? umLow;
  @override
  @JsonKey(ignore: true, name: 'numero_conteo')
  final int? numeroConteo;
  @override
  @JsonKey(ignore: true, name: 'es_confirmado')
  final bool? esConfirmado;

  @override
  String toString() {
    return 'DetalleRecuentoInventario(codigoConteoInventario: $codigoConteoInventario, codigoProducto: $codigoProducto, nombreProducto: $nombreProducto, cantidadStock: $cantidadStock, cantidadStockInicial: $cantidadStockInicial, cantidadConteo: $cantidadConteo, codigoUnidadMedida: $codigoUnidadMedida, observaciones: $observaciones, verificarUbicacion: $verificarUbicacion, ubicacionCorrecta: $ubicacionCorrecta, jsonDetalleConteo: $jsonDetalleConteo, fechaConteo: $fechaConteo, codigoLote: $codigoLote, producto: $producto, listaImagenConteo: $listaImagenConteo, listaDetalleConteo: $listaDetalleConteo, umBase: $umBase, umLow: $umLow, numeroConteo: $numeroConteo, esConfirmado: $esConfirmado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetalleRecuentoInventarioImpl &&
            (identical(other.codigoConteoInventario, codigoConteoInventario) ||
                other.codigoConteoInventario == codigoConteoInventario) &&
            (identical(other.codigoProducto, codigoProducto) ||
                other.codigoProducto == codigoProducto) &&
            (identical(other.nombreProducto, nombreProducto) ||
                other.nombreProducto == nombreProducto) &&
            (identical(other.cantidadStock, cantidadStock) ||
                other.cantidadStock == cantidadStock) &&
            (identical(other.cantidadStockInicial, cantidadStockInicial) ||
                other.cantidadStockInicial == cantidadStockInicial) &&
            (identical(other.cantidadConteo, cantidadConteo) ||
                other.cantidadConteo == cantidadConteo) &&
            (identical(other.codigoUnidadMedida, codigoUnidadMedida) ||
                other.codigoUnidadMedida == codigoUnidadMedida) &&
            (identical(other.observaciones, observaciones) ||
                other.observaciones == observaciones) &&
            (identical(other.verificarUbicacion, verificarUbicacion) ||
                other.verificarUbicacion == verificarUbicacion) &&
            (identical(other.ubicacionCorrecta, ubicacionCorrecta) ||
                other.ubicacionCorrecta == ubicacionCorrecta) &&
            (identical(other.jsonDetalleConteo, jsonDetalleConteo) ||
                other.jsonDetalleConteo == jsonDetalleConteo) &&
            (identical(other.fechaConteo, fechaConteo) ||
                other.fechaConteo == fechaConteo) &&
            (identical(other.codigoLote, codigoLote) ||
                other.codigoLote == codigoLote) &&
            (identical(other.producto, producto) ||
                other.producto == producto) &&
            const DeepCollectionEquality()
                .equals(other._listaImagenConteo, _listaImagenConteo) &&
            const DeepCollectionEquality()
                .equals(other._listaDetalleConteo, _listaDetalleConteo) &&
            (identical(other.umBase, umBase) || other.umBase == umBase) &&
            (identical(other.umLow, umLow) || other.umLow == umLow) &&
            (identical(other.numeroConteo, numeroConteo) ||
                other.numeroConteo == numeroConteo) &&
            (identical(other.esConfirmado, esConfirmado) ||
                other.esConfirmado == esConfirmado));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        codigoConteoInventario,
        codigoProducto,
        nombreProducto,
        cantidadStock,
        cantidadStockInicial,
        cantidadConteo,
        codigoUnidadMedida,
        observaciones,
        verificarUbicacion,
        ubicacionCorrecta,
        jsonDetalleConteo,
        fechaConteo,
        codigoLote,
        producto,
        const DeepCollectionEquality().hash(_listaImagenConteo),
        const DeepCollectionEquality().hash(_listaDetalleConteo),
        umBase,
        umLow,
        numeroConteo,
        esConfirmado
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetalleRecuentoInventarioImplCopyWith<_$DetalleRecuentoInventarioImpl>
      get copyWith => __$$DetalleRecuentoInventarioImplCopyWithImpl<
          _$DetalleRecuentoInventarioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetalleRecuentoInventarioImplToJson(
      this,
    );
  }
}

abstract class _DetalleRecuentoInventario implements DetalleRecuentoInventario {
  factory _DetalleRecuentoInventario(
      {@JsonKey(name: 'codigo_conteo_inventario')
      required final int codigoConteoInventario,
      @JsonKey(name: 'codigo_producto') required final String codigoProducto,
      @JsonKey(name: 'nombre_producto') required final String nombreProducto,
      @JsonKey(name: 'cantidad_stock') required final double cantidadStock,
      @JsonKey(name: 'cantidad_stock_inicial')
      required final double cantidadStockInicial,
      @JsonKey(name: 'cantidad_conteo') required final double cantidadConteo,
      @JsonKey(name: 'codigo_unidad_medida')
      required final int? codigoUnidadMedida,
      required final String observaciones,
      @JsonKey(name: 'verificar_ubicacion')
      required final bool verificarUbicacion,
      @JsonKey(name: 'ubicacion_correcta')
      required final String ubicacionCorrecta,
      @JsonKey(name: 'json_detalle_conteo')
      required final String jsonDetalleConteo,
      @JsonKey(name: 'fecha_conteo') required final DateTime fechaConteo,
      final String? codigoLote,
      required final Producto? producto,
      @JsonKey(name: 'lista_imagen_conteo')
      final List<ConteoImagen>? listaImagenConteo,
      @JsonKey(name: 'lista_detalle_conteo')
      final List<ConteoDetalle>? listaDetalleConteo,
      @JsonKey(ignore: true, name: 'um_base') final UnitMeasureModel? umBase,
      @JsonKey(ignore: true, name: 'um_low') final UnitMeasureModel? umLow,
      @JsonKey(ignore: true, name: 'numero_conteo') final int? numeroConteo,
      @JsonKey(ignore: true, name: 'es_confirmado')
      final bool? esConfirmado}) = _$DetalleRecuentoInventarioImpl;

  factory _DetalleRecuentoInventario.fromJson(Map<String, dynamic> json) =
      _$DetalleRecuentoInventarioImpl.fromJson;

  @override
  @JsonKey(name: 'codigo_conteo_inventario')
  int get codigoConteoInventario;
  @override
  @JsonKey(name: 'codigo_producto')
  String get codigoProducto;
  @override
  @JsonKey(name: 'nombre_producto')
  String get nombreProducto;
  @override
  @JsonKey(name: 'cantidad_stock')
  double get cantidadStock;
  @override
  @JsonKey(name: 'cantidad_stock_inicial')
  double get cantidadStockInicial;
  @override
  @JsonKey(name: 'cantidad_conteo')
  double get cantidadConteo;
  @override
  @JsonKey(name: 'codigo_unidad_medida')
  int? get codigoUnidadMedida;
  @override
  String get observaciones;
  @override
  @JsonKey(name: 'verificar_ubicacion')
  bool get verificarUbicacion;
  @override
  @JsonKey(name: 'ubicacion_correcta')
  String get ubicacionCorrecta;
  @override
  @JsonKey(name: 'json_detalle_conteo')
  String get jsonDetalleConteo;
  @override
  @JsonKey(name: 'fecha_conteo')
  DateTime get fechaConteo;
  @override
  String? get codigoLote;
  @override
  Producto? get producto;
  @override // List<LotesEntidad>? listaLotes, // SOLO LECTURA
  @JsonKey(name: 'lista_imagen_conteo')
  List<ConteoImagen>? get listaImagenConteo;
  @override
  @JsonKey(name: 'lista_detalle_conteo')
  List<ConteoDetalle>? get listaDetalleConteo;
  @override
  @JsonKey(ignore: true, name: 'um_base')
  UnitMeasureModel? get umBase;
  @override
  @JsonKey(ignore: true, name: 'um_low')
  UnitMeasureModel? get umLow;
  @override
  @JsonKey(ignore: true, name: 'numero_conteo')
  int? get numeroConteo;
  @override
  @JsonKey(ignore: true, name: 'es_confirmado')
  bool? get esConfirmado;
  @override
  @JsonKey(ignore: true)
  _$$DetalleRecuentoInventarioImplCopyWith<_$DetalleRecuentoInventarioImpl>
      get copyWith => throw _privateConstructorUsedError;
}
