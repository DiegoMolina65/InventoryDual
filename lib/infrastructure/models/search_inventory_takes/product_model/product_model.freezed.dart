// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get lote => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get codeLine => throw _privateConstructorUsedError;
  int get codeGroup => throw _privateConstructorUsedError;
  int get codeSubgroup => throw _privateConstructorUsedError;
  int get codeBaseUnitMeasure => throw _privateConstructorUsedError;
  int get currencyCode => throw _privateConstructorUsedError;
  String? get currencyValue => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;
  double get quantityRequired => throw _privateConstructorUsedError;
  String? get barCode => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String? get ubication => throw _privateConstructorUsedError;
  bool? get pvfr => throw _privateConstructorUsedError;
  List<UnitMeasureModel> get lstUnitMeasure =>
      throw _privateConstructorUsedError;
  List<BatchModel>? get lstBatch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String code,
      String name,
      String? lote,
      double price,
      int codeLine,
      int codeGroup,
      int codeSubgroup,
      int codeBaseUnitMeasure,
      int currencyCode,
      String? currencyValue,
      double discount,
      double stock,
      double quantityRequired,
      String? barCode,
      double cost,
      String? ubication,
      bool? pvfr,
      List<UnitMeasureModel> lstUnitMeasure,
      List<BatchModel>? lstBatch});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? lote = freezed,
    Object? price = null,
    Object? codeLine = null,
    Object? codeGroup = null,
    Object? codeSubgroup = null,
    Object? codeBaseUnitMeasure = null,
    Object? currencyCode = null,
    Object? currencyValue = freezed,
    Object? discount = null,
    Object? stock = null,
    Object? quantityRequired = null,
    Object? barCode = freezed,
    Object? cost = null,
    Object? ubication = freezed,
    Object? pvfr = freezed,
    Object? lstUnitMeasure = null,
    Object? lstBatch = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      codeLine: null == codeLine
          ? _value.codeLine
          : codeLine // ignore: cast_nullable_to_non_nullable
              as int,
      codeGroup: null == codeGroup
          ? _value.codeGroup
          : codeGroup // ignore: cast_nullable_to_non_nullable
              as int,
      codeSubgroup: null == codeSubgroup
          ? _value.codeSubgroup
          : codeSubgroup // ignore: cast_nullable_to_non_nullable
              as int,
      codeBaseUnitMeasure: null == codeBaseUnitMeasure
          ? _value.codeBaseUnitMeasure
          : codeBaseUnitMeasure // ignore: cast_nullable_to_non_nullable
              as int,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as int,
      currencyValue: freezed == currencyValue
          ? _value.currencyValue
          : currencyValue // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      ubication: freezed == ubication
          ? _value.ubication
          : ubication // ignore: cast_nullable_to_non_nullable
              as String?,
      pvfr: freezed == pvfr
          ? _value.pvfr
          : pvfr // ignore: cast_nullable_to_non_nullable
              as bool?,
      lstUnitMeasure: null == lstUnitMeasure
          ? _value.lstUnitMeasure
          : lstUnitMeasure // ignore: cast_nullable_to_non_nullable
              as List<UnitMeasureModel>,
      lstBatch: freezed == lstBatch
          ? _value.lstBatch
          : lstBatch // ignore: cast_nullable_to_non_nullable
              as List<BatchModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String? lote,
      double price,
      int codeLine,
      int codeGroup,
      int codeSubgroup,
      int codeBaseUnitMeasure,
      int currencyCode,
      String? currencyValue,
      double discount,
      double stock,
      double quantityRequired,
      String? barCode,
      double cost,
      String? ubication,
      bool? pvfr,
      List<UnitMeasureModel> lstUnitMeasure,
      List<BatchModel>? lstBatch});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? lote = freezed,
    Object? price = null,
    Object? codeLine = null,
    Object? codeGroup = null,
    Object? codeSubgroup = null,
    Object? codeBaseUnitMeasure = null,
    Object? currencyCode = null,
    Object? currencyValue = freezed,
    Object? discount = null,
    Object? stock = null,
    Object? quantityRequired = null,
    Object? barCode = freezed,
    Object? cost = null,
    Object? ubication = freezed,
    Object? pvfr = freezed,
    Object? lstUnitMeasure = null,
    Object? lstBatch = freezed,
  }) {
    return _then(_$ProductModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      codeLine: null == codeLine
          ? _value.codeLine
          : codeLine // ignore: cast_nullable_to_non_nullable
              as int,
      codeGroup: null == codeGroup
          ? _value.codeGroup
          : codeGroup // ignore: cast_nullable_to_non_nullable
              as int,
      codeSubgroup: null == codeSubgroup
          ? _value.codeSubgroup
          : codeSubgroup // ignore: cast_nullable_to_non_nullable
              as int,
      codeBaseUnitMeasure: null == codeBaseUnitMeasure
          ? _value.codeBaseUnitMeasure
          : codeBaseUnitMeasure // ignore: cast_nullable_to_non_nullable
              as int,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as int,
      currencyValue: freezed == currencyValue
          ? _value.currencyValue
          : currencyValue // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      ubication: freezed == ubication
          ? _value.ubication
          : ubication // ignore: cast_nullable_to_non_nullable
              as String?,
      pvfr: freezed == pvfr
          ? _value.pvfr
          : pvfr // ignore: cast_nullable_to_non_nullable
              as bool?,
      lstUnitMeasure: null == lstUnitMeasure
          ? _value._lstUnitMeasure
          : lstUnitMeasure // ignore: cast_nullable_to_non_nullable
              as List<UnitMeasureModel>,
      lstBatch: freezed == lstBatch
          ? _value._lstBatch
          : lstBatch // ignore: cast_nullable_to_non_nullable
              as List<BatchModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {required this.code,
      required this.name,
      this.lote,
      required this.price,
      required this.codeLine,
      required this.codeGroup,
      required this.codeSubgroup,
      required this.codeBaseUnitMeasure,
      required this.currencyCode,
      this.currencyValue,
      required this.discount,
      required this.stock,
      required this.quantityRequired,
      this.barCode,
      required this.cost,
      this.ubication,
      this.pvfr,
      required final List<UnitMeasureModel> lstUnitMeasure,
      final List<BatchModel>? lstBatch})
      : _lstUnitMeasure = lstUnitMeasure,
        _lstBatch = lstBatch;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String? lote;
  @override
  final double price;
  @override
  final int codeLine;
  @override
  final int codeGroup;
  @override
  final int codeSubgroup;
  @override
  final int codeBaseUnitMeasure;
  @override
  final int currencyCode;
  @override
  final String? currencyValue;
  @override
  final double discount;
  @override
  final double stock;
  @override
  final double quantityRequired;
  @override
  final String? barCode;
  @override
  final double cost;
  @override
  final String? ubication;
  @override
  final bool? pvfr;
  final List<UnitMeasureModel> _lstUnitMeasure;
  @override
  List<UnitMeasureModel> get lstUnitMeasure {
    if (_lstUnitMeasure is EqualUnmodifiableListView) return _lstUnitMeasure;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstUnitMeasure);
  }

  final List<BatchModel>? _lstBatch;
  @override
  List<BatchModel>? get lstBatch {
    final value = _lstBatch;
    if (value == null) return null;
    if (_lstBatch is EqualUnmodifiableListView) return _lstBatch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductModel(code: $code, name: $name, lote: $lote, price: $price, codeLine: $codeLine, codeGroup: $codeGroup, codeSubgroup: $codeSubgroup, codeBaseUnitMeasure: $codeBaseUnitMeasure, currencyCode: $currencyCode, currencyValue: $currencyValue, discount: $discount, stock: $stock, quantityRequired: $quantityRequired, barCode: $barCode, cost: $cost, ubication: $ubication, pvfr: $pvfr, lstUnitMeasure: $lstUnitMeasure, lstBatch: $lstBatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lote, lote) || other.lote == lote) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.codeLine, codeLine) ||
                other.codeLine == codeLine) &&
            (identical(other.codeGroup, codeGroup) ||
                other.codeGroup == codeGroup) &&
            (identical(other.codeSubgroup, codeSubgroup) ||
                other.codeSubgroup == codeSubgroup) &&
            (identical(other.codeBaseUnitMeasure, codeBaseUnitMeasure) ||
                other.codeBaseUnitMeasure == codeBaseUnitMeasure) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currencyValue, currencyValue) ||
                other.currencyValue == currencyValue) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.barCode, barCode) || other.barCode == barCode) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.ubication, ubication) ||
                other.ubication == ubication) &&
            (identical(other.pvfr, pvfr) || other.pvfr == pvfr) &&
            const DeepCollectionEquality()
                .equals(other._lstUnitMeasure, _lstUnitMeasure) &&
            const DeepCollectionEquality().equals(other._lstBatch, _lstBatch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        code,
        name,
        lote,
        price,
        codeLine,
        codeGroup,
        codeSubgroup,
        codeBaseUnitMeasure,
        currencyCode,
        currencyValue,
        discount,
        stock,
        quantityRequired,
        barCode,
        cost,
        ubication,
        pvfr,
        const DeepCollectionEquality().hash(_lstUnitMeasure),
        const DeepCollectionEquality().hash(_lstBatch)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required final String code,
      required final String name,
      final String? lote,
      required final double price,
      required final int codeLine,
      required final int codeGroup,
      required final int codeSubgroup,
      required final int codeBaseUnitMeasure,
      required final int currencyCode,
      final String? currencyValue,
      required final double discount,
      required final double stock,
      required final double quantityRequired,
      final String? barCode,
      required final double cost,
      final String? ubication,
      final bool? pvfr,
      required final List<UnitMeasureModel> lstUnitMeasure,
      final List<BatchModel>? lstBatch}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String? get lote;
  @override
  double get price;
  @override
  int get codeLine;
  @override
  int get codeGroup;
  @override
  int get codeSubgroup;
  @override
  int get codeBaseUnitMeasure;
  @override
  int get currencyCode;
  @override
  String? get currencyValue;
  @override
  double get discount;
  @override
  double get stock;
  @override
  double get quantityRequired;
  @override
  String? get barCode;
  @override
  double get cost;
  @override
  String? get ubication;
  @override
  bool? get pvfr;
  @override
  List<UnitMeasureModel> get lstUnitMeasure;
  @override
  List<BatchModel>? get lstBatch;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
