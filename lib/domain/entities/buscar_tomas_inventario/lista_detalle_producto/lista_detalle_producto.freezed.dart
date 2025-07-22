// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lista_detalle_producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListaDetalleProducto _$ListaDetalleProductoFromJson(Map<String, dynamic> json) {
  return _ListaDetalleProducto.fromJson(json);
}

/// @nodoc
mixin _$ListaDetalleProducto {
  @JsonKey(name: 'codigo_toma_inventario')
  int get codigoTomaInventario => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_producto')
  String get codigoProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_unidad_medida')
  int get codigoUnidadMedida => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;
  bool get verificado => throw _privateConstructorUsedError;
  String? get codigoLote => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_verificada')
  double get cantidadVerificada => throw _privateConstructorUsedError;
  Producto get producto => throw _privateConstructorUsedError;
  @JsonKey(name: 'lista_conteo_resultado')
  List<ListaConteoResultadosEntidad>? get listaConteoResultado =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListaDetalleProductoCopyWith<ListaDetalleProducto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListaDetalleProductoCopyWith<$Res> {
  factory $ListaDetalleProductoCopyWith(ListaDetalleProducto value,
          $Res Function(ListaDetalleProducto) then) =
      _$ListaDetalleProductoCopyWithImpl<$Res, ListaDetalleProducto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'codigo_toma_inventario') int codigoTomaInventario,
      @JsonKey(name: 'codigo_producto') String codigoProducto,
      @JsonKey(name: 'codigo_unidad_medida') int codigoUnidadMedida,
      double stock,
      bool verificado,
      String? codigoLote,
      @JsonKey(name: 'cantidad_verificada') double cantidadVerificada,
      Producto producto,
      @JsonKey(name: 'lista_conteo_resultado')
      List<ListaConteoResultadosEntidad>? listaConteoResultado});

  $ProductoCopyWith<$Res> get producto;
}

/// @nodoc
class _$ListaDetalleProductoCopyWithImpl<$Res,
        $Val extends ListaDetalleProducto>
    implements $ListaDetalleProductoCopyWith<$Res> {
  _$ListaDetalleProductoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoTomaInventario = null,
    Object? codigoProducto = null,
    Object? codigoUnidadMedida = null,
    Object? stock = null,
    Object? verificado = null,
    Object? codigoLote = freezed,
    Object? cantidadVerificada = null,
    Object? producto = null,
    Object? listaConteoResultado = freezed,
  }) {
    return _then(_value.copyWith(
      codigoTomaInventario: null == codigoTomaInventario
          ? _value.codigoTomaInventario
          : codigoTomaInventario // ignore: cast_nullable_to_non_nullable
              as int,
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      codigoUnidadMedida: null == codigoUnidadMedida
          ? _value.codigoUnidadMedida
          : codigoUnidadMedida // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      verificado: null == verificado
          ? _value.verificado
          : verificado // ignore: cast_nullable_to_non_nullable
              as bool,
      codigoLote: freezed == codigoLote
          ? _value.codigoLote
          : codigoLote // ignore: cast_nullable_to_non_nullable
              as String?,
      cantidadVerificada: null == cantidadVerificada
          ? _value.cantidadVerificada
          : cantidadVerificada // ignore: cast_nullable_to_non_nullable
              as double,
      producto: null == producto
          ? _value.producto
          : producto // ignore: cast_nullable_to_non_nullable
              as Producto,
      listaConteoResultado: freezed == listaConteoResultado
          ? _value.listaConteoResultado
          : listaConteoResultado // ignore: cast_nullable_to_non_nullable
              as List<ListaConteoResultadosEntidad>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductoCopyWith<$Res> get producto {
    return $ProductoCopyWith<$Res>(_value.producto, (value) {
      return _then(_value.copyWith(producto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListaDetalleProductoImplCopyWith<$Res>
    implements $ListaDetalleProductoCopyWith<$Res> {
  factory _$$ListaDetalleProductoImplCopyWith(_$ListaDetalleProductoImpl value,
          $Res Function(_$ListaDetalleProductoImpl) then) =
      __$$ListaDetalleProductoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'codigo_toma_inventario') int codigoTomaInventario,
      @JsonKey(name: 'codigo_producto') String codigoProducto,
      @JsonKey(name: 'codigo_unidad_medida') int codigoUnidadMedida,
      double stock,
      bool verificado,
      String? codigoLote,
      @JsonKey(name: 'cantidad_verificada') double cantidadVerificada,
      Producto producto,
      @JsonKey(name: 'lista_conteo_resultado')
      List<ListaConteoResultadosEntidad>? listaConteoResultado});

  @override
  $ProductoCopyWith<$Res> get producto;
}

/// @nodoc
class __$$ListaDetalleProductoImplCopyWithImpl<$Res>
    extends _$ListaDetalleProductoCopyWithImpl<$Res, _$ListaDetalleProductoImpl>
    implements _$$ListaDetalleProductoImplCopyWith<$Res> {
  __$$ListaDetalleProductoImplCopyWithImpl(_$ListaDetalleProductoImpl _value,
      $Res Function(_$ListaDetalleProductoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigoTomaInventario = null,
    Object? codigoProducto = null,
    Object? codigoUnidadMedida = null,
    Object? stock = null,
    Object? verificado = null,
    Object? codigoLote = freezed,
    Object? cantidadVerificada = null,
    Object? producto = null,
    Object? listaConteoResultado = freezed,
  }) {
    return _then(_$ListaDetalleProductoImpl(
      codigoTomaInventario: null == codigoTomaInventario
          ? _value.codigoTomaInventario
          : codigoTomaInventario // ignore: cast_nullable_to_non_nullable
              as int,
      codigoProducto: null == codigoProducto
          ? _value.codigoProducto
          : codigoProducto // ignore: cast_nullable_to_non_nullable
              as String,
      codigoUnidadMedida: null == codigoUnidadMedida
          ? _value.codigoUnidadMedida
          : codigoUnidadMedida // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      verificado: null == verificado
          ? _value.verificado
          : verificado // ignore: cast_nullable_to_non_nullable
              as bool,
      codigoLote: freezed == codigoLote
          ? _value.codigoLote
          : codigoLote // ignore: cast_nullable_to_non_nullable
              as String?,
      cantidadVerificada: null == cantidadVerificada
          ? _value.cantidadVerificada
          : cantidadVerificada // ignore: cast_nullable_to_non_nullable
              as double,
      producto: null == producto
          ? _value.producto
          : producto // ignore: cast_nullable_to_non_nullable
              as Producto,
      listaConteoResultado: freezed == listaConteoResultado
          ? _value._listaConteoResultado
          : listaConteoResultado // ignore: cast_nullable_to_non_nullable
              as List<ListaConteoResultadosEntidad>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListaDetalleProductoImpl implements _ListaDetalleProducto {
  _$ListaDetalleProductoImpl(
      {@JsonKey(name: 'codigo_toma_inventario')
      required this.codigoTomaInventario,
      @JsonKey(name: 'codigo_producto') required this.codigoProducto,
      @JsonKey(name: 'codigo_unidad_medida') required this.codigoUnidadMedida,
      required this.stock,
      required this.verificado,
      this.codigoLote,
      @JsonKey(name: 'cantidad_verificada') required this.cantidadVerificada,
      required this.producto,
      @JsonKey(name: 'lista_conteo_resultado')
      final List<ListaConteoResultadosEntidad>? listaConteoResultado})
      : _listaConteoResultado = listaConteoResultado;

  factory _$ListaDetalleProductoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListaDetalleProductoImplFromJson(json);

  @override
  @JsonKey(name: 'codigo_toma_inventario')
  final int codigoTomaInventario;
  @override
  @JsonKey(name: 'codigo_producto')
  final String codigoProducto;
  @override
  @JsonKey(name: 'codigo_unidad_medida')
  final int codigoUnidadMedida;
  @override
  final double stock;
  @override
  final bool verificado;
  @override
  final String? codigoLote;
  @override
  @JsonKey(name: 'cantidad_verificada')
  final double cantidadVerificada;
  @override
  final Producto producto;
  final List<ListaConteoResultadosEntidad>? _listaConteoResultado;
  @override
  @JsonKey(name: 'lista_conteo_resultado')
  List<ListaConteoResultadosEntidad>? get listaConteoResultado {
    final value = _listaConteoResultado;
    if (value == null) return null;
    if (_listaConteoResultado is EqualUnmodifiableListView)
      return _listaConteoResultado;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListaDetalleProducto(codigoTomaInventario: $codigoTomaInventario, codigoProducto: $codigoProducto, codigoUnidadMedida: $codigoUnidadMedida, stock: $stock, verificado: $verificado, codigoLote: $codigoLote, cantidadVerificada: $cantidadVerificada, producto: $producto, listaConteoResultado: $listaConteoResultado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListaDetalleProductoImpl &&
            (identical(other.codigoTomaInventario, codigoTomaInventario) ||
                other.codigoTomaInventario == codigoTomaInventario) &&
            (identical(other.codigoProducto, codigoProducto) ||
                other.codigoProducto == codigoProducto) &&
            (identical(other.codigoUnidadMedida, codigoUnidadMedida) ||
                other.codigoUnidadMedida == codigoUnidadMedida) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.verificado, verificado) ||
                other.verificado == verificado) &&
            (identical(other.codigoLote, codigoLote) ||
                other.codigoLote == codigoLote) &&
            (identical(other.cantidadVerificada, cantidadVerificada) ||
                other.cantidadVerificada == cantidadVerificada) &&
            (identical(other.producto, producto) ||
                other.producto == producto) &&
            const DeepCollectionEquality()
                .equals(other._listaConteoResultado, _listaConteoResultado));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codigoTomaInventario,
      codigoProducto,
      codigoUnidadMedida,
      stock,
      verificado,
      codigoLote,
      cantidadVerificada,
      producto,
      const DeepCollectionEquality().hash(_listaConteoResultado));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListaDetalleProductoImplCopyWith<_$ListaDetalleProductoImpl>
      get copyWith =>
          __$$ListaDetalleProductoImplCopyWithImpl<_$ListaDetalleProductoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListaDetalleProductoImplToJson(
      this,
    );
  }
}

abstract class _ListaDetalleProducto implements ListaDetalleProducto {
  factory _ListaDetalleProducto(
      {@JsonKey(name: 'codigo_toma_inventario')
      required final int codigoTomaInventario,
      @JsonKey(name: 'codigo_producto') required final String codigoProducto,
      @JsonKey(name: 'codigo_unidad_medida')
      required final int codigoUnidadMedida,
      required final double stock,
      required final bool verificado,
      final String? codigoLote,
      @JsonKey(name: 'cantidad_verificada')
      required final double cantidadVerificada,
      required final Producto producto,
      @JsonKey(name: 'lista_conteo_resultado')
      final List<ListaConteoResultadosEntidad>?
          listaConteoResultado}) = _$ListaDetalleProductoImpl;

  factory _ListaDetalleProducto.fromJson(Map<String, dynamic> json) =
      _$ListaDetalleProductoImpl.fromJson;

  @override
  @JsonKey(name: 'codigo_toma_inventario')
  int get codigoTomaInventario;
  @override
  @JsonKey(name: 'codigo_producto')
  String get codigoProducto;
  @override
  @JsonKey(name: 'codigo_unidad_medida')
  int get codigoUnidadMedida;
  @override
  double get stock;
  @override
  bool get verificado;
  @override
  String? get codigoLote;
  @override
  @JsonKey(name: 'cantidad_verificada')
  double get cantidadVerificada;
  @override
  Producto get producto;
  @override
  @JsonKey(name: 'lista_conteo_resultado')
  List<ListaConteoResultadosEntidad>? get listaConteoResultado;
  @override
  @JsonKey(ignore: true)
  _$$ListaDetalleProductoImplCopyWith<_$ListaDetalleProductoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
