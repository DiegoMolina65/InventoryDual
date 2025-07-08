// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Producto _$ProductoFromJson(Map<String, dynamic> json) {
  return _Producto.fromJson(json);
}

/// @nodoc
mixin _$Producto {
  String get codigo => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String get lote => throw _privateConstructorUsedError;
  double get precio => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_linea')
  int get codigoLinea => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_grupo')
  int get codigoGrupo => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_subgrupo')
  int get codigoSubgrupo => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_unidad_medida_base')
  int get codigoUnidadMedidaBase => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_moneda')
  int get codigoMoneda => throw _privateConstructorUsedError;
  @JsonKey(name: 'valor_moneda')
  String get valorMoneda => throw _privateConstructorUsedError;
  double get descuento => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;
  String get ubicacion => throw _privateConstructorUsedError;
  @JsonKey(name: 'cantidad_requerida')
  double get cantidadRequerida => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_barra')
  String get codigoBarra => throw _privateConstructorUsedError;
  double get costo => throw _privateConstructorUsedError;
  bool get pvfr => throw _privateConstructorUsedError;
  @JsonKey(name: 'lista_unidad_medida')
  List<UnidadMedida> get listaUnidadMedida =>
      throw _privateConstructorUsedError;
  List<LotesEntidad>? get listaLotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductoCopyWith<Producto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductoCopyWith<$Res> {
  factory $ProductoCopyWith(Producto value, $Res Function(Producto) then) =
      _$ProductoCopyWithImpl<$Res, Producto>;
  @useResult
  $Res call(
      {String codigo,
      String nombre,
      String lote,
      double precio,
      @JsonKey(name: 'codigo_linea') int codigoLinea,
      @JsonKey(name: 'codigo_grupo') int codigoGrupo,
      @JsonKey(name: 'codigo_subgrupo') int codigoSubgrupo,
      @JsonKey(name: 'codigo_unidad_medida_base') int codigoUnidadMedidaBase,
      @JsonKey(name: 'codigo_moneda') int codigoMoneda,
      @JsonKey(name: 'valor_moneda') String valorMoneda,
      double descuento,
      double stock,
      String ubicacion,
      @JsonKey(name: 'cantidad_requerida') double cantidadRequerida,
      @JsonKey(name: 'codigo_barra') String codigoBarra,
      double costo,
      bool pvfr,
      @JsonKey(name: 'lista_unidad_medida')
      List<UnidadMedida> listaUnidadMedida,
      List<LotesEntidad>? listaLotes});
}

/// @nodoc
class _$ProductoCopyWithImpl<$Res, $Val extends Producto>
    implements $ProductoCopyWith<$Res> {
  _$ProductoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
    Object? lote = null,
    Object? precio = null,
    Object? codigoLinea = null,
    Object? codigoGrupo = null,
    Object? codigoSubgrupo = null,
    Object? codigoUnidadMedidaBase = null,
    Object? codigoMoneda = null,
    Object? valorMoneda = null,
    Object? descuento = null,
    Object? stock = null,
    Object? ubicacion = null,
    Object? cantidadRequerida = null,
    Object? codigoBarra = null,
    Object? costo = null,
    Object? pvfr = null,
    Object? listaUnidadMedida = null,
    Object? listaLotes = freezed,
  }) {
    return _then(_value.copyWith(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      lote: null == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String,
      precio: null == precio
          ? _value.precio
          : precio // ignore: cast_nullable_to_non_nullable
              as double,
      codigoLinea: null == codigoLinea
          ? _value.codigoLinea
          : codigoLinea // ignore: cast_nullable_to_non_nullable
              as int,
      codigoGrupo: null == codigoGrupo
          ? _value.codigoGrupo
          : codigoGrupo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoSubgrupo: null == codigoSubgrupo
          ? _value.codigoSubgrupo
          : codigoSubgrupo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUnidadMedidaBase: null == codigoUnidadMedidaBase
          ? _value.codigoUnidadMedidaBase
          : codigoUnidadMedidaBase // ignore: cast_nullable_to_non_nullable
              as int,
      codigoMoneda: null == codigoMoneda
          ? _value.codigoMoneda
          : codigoMoneda // ignore: cast_nullable_to_non_nullable
              as int,
      valorMoneda: null == valorMoneda
          ? _value.valorMoneda
          : valorMoneda // ignore: cast_nullable_to_non_nullable
              as String,
      descuento: null == descuento
          ? _value.descuento
          : descuento // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      ubicacion: null == ubicacion
          ? _value.ubicacion
          : ubicacion // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadRequerida: null == cantidadRequerida
          ? _value.cantidadRequerida
          : cantidadRequerida // ignore: cast_nullable_to_non_nullable
              as double,
      codigoBarra: null == codigoBarra
          ? _value.codigoBarra
          : codigoBarra // ignore: cast_nullable_to_non_nullable
              as String,
      costo: null == costo
          ? _value.costo
          : costo // ignore: cast_nullable_to_non_nullable
              as double,
      pvfr: null == pvfr
          ? _value.pvfr
          : pvfr // ignore: cast_nullable_to_non_nullable
              as bool,
      listaUnidadMedida: null == listaUnidadMedida
          ? _value.listaUnidadMedida
          : listaUnidadMedida // ignore: cast_nullable_to_non_nullable
              as List<UnidadMedida>,
      listaLotes: freezed == listaLotes
          ? _value.listaLotes
          : listaLotes // ignore: cast_nullable_to_non_nullable
              as List<LotesEntidad>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductoImplCopyWith<$Res>
    implements $ProductoCopyWith<$Res> {
  factory _$$ProductoImplCopyWith(
          _$ProductoImpl value, $Res Function(_$ProductoImpl) then) =
      __$$ProductoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String codigo,
      String nombre,
      String lote,
      double precio,
      @JsonKey(name: 'codigo_linea') int codigoLinea,
      @JsonKey(name: 'codigo_grupo') int codigoGrupo,
      @JsonKey(name: 'codigo_subgrupo') int codigoSubgrupo,
      @JsonKey(name: 'codigo_unidad_medida_base') int codigoUnidadMedidaBase,
      @JsonKey(name: 'codigo_moneda') int codigoMoneda,
      @JsonKey(name: 'valor_moneda') String valorMoneda,
      double descuento,
      double stock,
      String ubicacion,
      @JsonKey(name: 'cantidad_requerida') double cantidadRequerida,
      @JsonKey(name: 'codigo_barra') String codigoBarra,
      double costo,
      bool pvfr,
      @JsonKey(name: 'lista_unidad_medida')
      List<UnidadMedida> listaUnidadMedida,
      List<LotesEntidad>? listaLotes});
}

/// @nodoc
class __$$ProductoImplCopyWithImpl<$Res>
    extends _$ProductoCopyWithImpl<$Res, _$ProductoImpl>
    implements _$$ProductoImplCopyWith<$Res> {
  __$$ProductoImplCopyWithImpl(
      _$ProductoImpl _value, $Res Function(_$ProductoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
    Object? lote = null,
    Object? precio = null,
    Object? codigoLinea = null,
    Object? codigoGrupo = null,
    Object? codigoSubgrupo = null,
    Object? codigoUnidadMedidaBase = null,
    Object? codigoMoneda = null,
    Object? valorMoneda = null,
    Object? descuento = null,
    Object? stock = null,
    Object? ubicacion = null,
    Object? cantidadRequerida = null,
    Object? codigoBarra = null,
    Object? costo = null,
    Object? pvfr = null,
    Object? listaUnidadMedida = null,
    Object? listaLotes = freezed,
  }) {
    return _then(_$ProductoImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      lote: null == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String,
      precio: null == precio
          ? _value.precio
          : precio // ignore: cast_nullable_to_non_nullable
              as double,
      codigoLinea: null == codigoLinea
          ? _value.codigoLinea
          : codigoLinea // ignore: cast_nullable_to_non_nullable
              as int,
      codigoGrupo: null == codigoGrupo
          ? _value.codigoGrupo
          : codigoGrupo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoSubgrupo: null == codigoSubgrupo
          ? _value.codigoSubgrupo
          : codigoSubgrupo // ignore: cast_nullable_to_non_nullable
              as int,
      codigoUnidadMedidaBase: null == codigoUnidadMedidaBase
          ? _value.codigoUnidadMedidaBase
          : codigoUnidadMedidaBase // ignore: cast_nullable_to_non_nullable
              as int,
      codigoMoneda: null == codigoMoneda
          ? _value.codigoMoneda
          : codigoMoneda // ignore: cast_nullable_to_non_nullable
              as int,
      valorMoneda: null == valorMoneda
          ? _value.valorMoneda
          : valorMoneda // ignore: cast_nullable_to_non_nullable
              as String,
      descuento: null == descuento
          ? _value.descuento
          : descuento // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      ubicacion: null == ubicacion
          ? _value.ubicacion
          : ubicacion // ignore: cast_nullable_to_non_nullable
              as String,
      cantidadRequerida: null == cantidadRequerida
          ? _value.cantidadRequerida
          : cantidadRequerida // ignore: cast_nullable_to_non_nullable
              as double,
      codigoBarra: null == codigoBarra
          ? _value.codigoBarra
          : codigoBarra // ignore: cast_nullable_to_non_nullable
              as String,
      costo: null == costo
          ? _value.costo
          : costo // ignore: cast_nullable_to_non_nullable
              as double,
      pvfr: null == pvfr
          ? _value.pvfr
          : pvfr // ignore: cast_nullable_to_non_nullable
              as bool,
      listaUnidadMedida: null == listaUnidadMedida
          ? _value._listaUnidadMedida
          : listaUnidadMedida // ignore: cast_nullable_to_non_nullable
              as List<UnidadMedida>,
      listaLotes: freezed == listaLotes
          ? _value._listaLotes
          : listaLotes // ignore: cast_nullable_to_non_nullable
              as List<LotesEntidad>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductoImpl extends _Producto {
  _$ProductoImpl(
      {required this.codigo,
      required this.nombre,
      required this.lote,
      required this.precio,
      @JsonKey(name: 'codigo_linea') required this.codigoLinea,
      @JsonKey(name: 'codigo_grupo') required this.codigoGrupo,
      @JsonKey(name: 'codigo_subgrupo') required this.codigoSubgrupo,
      @JsonKey(name: 'codigo_unidad_medida_base')
      required this.codigoUnidadMedidaBase,
      @JsonKey(name: 'codigo_moneda') required this.codigoMoneda,
      @JsonKey(name: 'valor_moneda') required this.valorMoneda,
      required this.descuento,
      required this.stock,
      required this.ubicacion,
      @JsonKey(name: 'cantidad_requerida') required this.cantidadRequerida,
      @JsonKey(name: 'codigo_barra') required this.codigoBarra,
      required this.costo,
      required this.pvfr,
      @JsonKey(name: 'lista_unidad_medida')
      required final List<UnidadMedida> listaUnidadMedida,
      final List<LotesEntidad>? listaLotes})
      : _listaUnidadMedida = listaUnidadMedida,
        _listaLotes = listaLotes,
        super._();

  factory _$ProductoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductoImplFromJson(json);

  @override
  final String codigo;
  @override
  final String nombre;
  @override
  final String lote;
  @override
  final double precio;
  @override
  @JsonKey(name: 'codigo_linea')
  final int codigoLinea;
  @override
  @JsonKey(name: 'codigo_grupo')
  final int codigoGrupo;
  @override
  @JsonKey(name: 'codigo_subgrupo')
  final int codigoSubgrupo;
  @override
  @JsonKey(name: 'codigo_unidad_medida_base')
  final int codigoUnidadMedidaBase;
  @override
  @JsonKey(name: 'codigo_moneda')
  final int codigoMoneda;
  @override
  @JsonKey(name: 'valor_moneda')
  final String valorMoneda;
  @override
  final double descuento;
  @override
  final double stock;
  @override
  final String ubicacion;
  @override
  @JsonKey(name: 'cantidad_requerida')
  final double cantidadRequerida;
  @override
  @JsonKey(name: 'codigo_barra')
  final String codigoBarra;
  @override
  final double costo;
  @override
  final bool pvfr;
  final List<UnidadMedida> _listaUnidadMedida;
  @override
  @JsonKey(name: 'lista_unidad_medida')
  List<UnidadMedida> get listaUnidadMedida {
    if (_listaUnidadMedida is EqualUnmodifiableListView)
      return _listaUnidadMedida;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listaUnidadMedida);
  }

  final List<LotesEntidad>? _listaLotes;
  @override
  List<LotesEntidad>? get listaLotes {
    final value = _listaLotes;
    if (value == null) return null;
    if (_listaLotes is EqualUnmodifiableListView) return _listaLotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Producto(codigo: $codigo, nombre: $nombre, lote: $lote, precio: $precio, codigoLinea: $codigoLinea, codigoGrupo: $codigoGrupo, codigoSubgrupo: $codigoSubgrupo, codigoUnidadMedidaBase: $codigoUnidadMedidaBase, codigoMoneda: $codigoMoneda, valorMoneda: $valorMoneda, descuento: $descuento, stock: $stock, ubicacion: $ubicacion, cantidadRequerida: $cantidadRequerida, codigoBarra: $codigoBarra, costo: $costo, pvfr: $pvfr, listaUnidadMedida: $listaUnidadMedida, listaLotes: $listaLotes)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductoImplCopyWith<_$ProductoImpl> get copyWith =>
      __$$ProductoImplCopyWithImpl<_$ProductoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductoImplToJson(
      this,
    );
  }
}

abstract class _Producto extends Producto {
  factory _Producto(
      {required final String codigo,
      required final String nombre,
      required final String lote,
      required final double precio,
      @JsonKey(name: 'codigo_linea') required final int codigoLinea,
      @JsonKey(name: 'codigo_grupo') required final int codigoGrupo,
      @JsonKey(name: 'codigo_subgrupo') required final int codigoSubgrupo,
      @JsonKey(name: 'codigo_unidad_medida_base')
      required final int codigoUnidadMedidaBase,
      @JsonKey(name: 'codigo_moneda') required final int codigoMoneda,
      @JsonKey(name: 'valor_moneda') required final String valorMoneda,
      required final double descuento,
      required final double stock,
      required final String ubicacion,
      @JsonKey(name: 'cantidad_requerida')
      required final double cantidadRequerida,
      @JsonKey(name: 'codigo_barra') required final String codigoBarra,
      required final double costo,
      required final bool pvfr,
      @JsonKey(name: 'lista_unidad_medida')
      required final List<UnidadMedida> listaUnidadMedida,
      final List<LotesEntidad>? listaLotes}) = _$ProductoImpl;
  _Producto._() : super._();

  factory _Producto.fromJson(Map<String, dynamic> json) =
      _$ProductoImpl.fromJson;

  @override
  String get codigo;
  @override
  String get nombre;
  @override
  String get lote;
  @override
  double get precio;
  @override
  @JsonKey(name: 'codigo_linea')
  int get codigoLinea;
  @override
  @JsonKey(name: 'codigo_grupo')
  int get codigoGrupo;
  @override
  @JsonKey(name: 'codigo_subgrupo')
  int get codigoSubgrupo;
  @override
  @JsonKey(name: 'codigo_unidad_medida_base')
  int get codigoUnidadMedidaBase;
  @override
  @JsonKey(name: 'codigo_moneda')
  int get codigoMoneda;
  @override
  @JsonKey(name: 'valor_moneda')
  String get valorMoneda;
  @override
  double get descuento;
  @override
  double get stock;
  @override
  String get ubicacion;
  @override
  @JsonKey(name: 'cantidad_requerida')
  double get cantidadRequerida;
  @override
  @JsonKey(name: 'codigo_barra')
  String get codigoBarra;
  @override
  double get costo;
  @override
  bool get pvfr;
  @override
  @JsonKey(name: 'lista_unidad_medida')
  List<UnidadMedida> get listaUnidadMedida;
  @override
  List<LotesEntidad>? get listaLotes;
  @override
  @JsonKey(ignore: true)
  _$$ProductoImplCopyWith<_$ProductoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
