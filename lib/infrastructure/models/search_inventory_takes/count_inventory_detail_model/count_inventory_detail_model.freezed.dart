// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_inventory_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountInventoryDetailModel _$CountInventoryDetailModelFromJson(
    Map<String, dynamic> json) {
  return _CountInventoryDetailModel.fromJson(json);
}

/// @nodoc
mixin _$CountInventoryDetailModel {
  int get codeCountInventory => throw _privateConstructorUsedError;
  String get codeProduct => throw _privateConstructorUsedError;
  String get nameProduct => throw _privateConstructorUsedError;
  double get quantityStock => throw _privateConstructorUsedError;
  double get quantityStockInitial => throw _privateConstructorUsedError;
  double get quantityCount => throw _privateConstructorUsedError;
  int? get codeUnitMeasure => throw _privateConstructorUsedError;
  String get observations => throw _privateConstructorUsedError;
  bool get checkUbication => throw _privateConstructorUsedError;
  String get correctUbication => throw _privateConstructorUsedError;
  String get jsonDetailCount => throw _privateConstructorUsedError;
  DateTime get dateCount => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  String? get codeBatch =>
      throw _privateConstructorUsedError; // List<BatchModel>? lstBatch,
  List<ImageCountModel>? get listImageCount =>
      throw _privateConstructorUsedError;
  List<DetailCountModel>? get listDetailCount =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  UnitMeasureModel? get umBase => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  UnitMeasureModel? get umLow => throw _privateConstructorUsedError;
  int? get numberCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountInventoryDetailModelCopyWith<CountInventoryDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountInventoryDetailModelCopyWith<$Res> {
  factory $CountInventoryDetailModelCopyWith(CountInventoryDetailModel value,
          $Res Function(CountInventoryDetailModel) then) =
      _$CountInventoryDetailModelCopyWithImpl<$Res, CountInventoryDetailModel>;
  @useResult
  $Res call(
      {int codeCountInventory,
      String codeProduct,
      String nameProduct,
      double quantityStock,
      double quantityStockInitial,
      double quantityCount,
      int? codeUnitMeasure,
      String observations,
      bool checkUbication,
      String correctUbication,
      String jsonDetailCount,
      DateTime dateCount,
      ProductModel? product,
      String? codeBatch,
      List<ImageCountModel>? listImageCount,
      List<DetailCountModel>? listDetailCount,
      @JsonKey(ignore: true) UnitMeasureModel? umBase,
      @JsonKey(ignore: true) UnitMeasureModel? umLow,
      int? numberCount});

  $ProductModelCopyWith<$Res>? get product;
  $UnitMeasureModelCopyWith<$Res>? get umBase;
  $UnitMeasureModelCopyWith<$Res>? get umLow;
}

/// @nodoc
class _$CountInventoryDetailModelCopyWithImpl<$Res,
        $Val extends CountInventoryDetailModel>
    implements $CountInventoryDetailModelCopyWith<$Res> {
  _$CountInventoryDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeCountInventory = null,
    Object? codeProduct = null,
    Object? nameProduct = null,
    Object? quantityStock = null,
    Object? quantityStockInitial = null,
    Object? quantityCount = null,
    Object? codeUnitMeasure = freezed,
    Object? observations = null,
    Object? checkUbication = null,
    Object? correctUbication = null,
    Object? jsonDetailCount = null,
    Object? dateCount = null,
    Object? product = freezed,
    Object? codeBatch = freezed,
    Object? listImageCount = freezed,
    Object? listDetailCount = freezed,
    Object? umBase = freezed,
    Object? umLow = freezed,
    Object? numberCount = freezed,
  }) {
    return _then(_value.copyWith(
      codeCountInventory: null == codeCountInventory
          ? _value.codeCountInventory
          : codeCountInventory // ignore: cast_nullable_to_non_nullable
              as int,
      codeProduct: null == codeProduct
          ? _value.codeProduct
          : codeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      nameProduct: null == nameProduct
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String,
      quantityStock: null == quantityStock
          ? _value.quantityStock
          : quantityStock // ignore: cast_nullable_to_non_nullable
              as double,
      quantityStockInitial: null == quantityStockInitial
          ? _value.quantityStockInitial
          : quantityStockInitial // ignore: cast_nullable_to_non_nullable
              as double,
      quantityCount: null == quantityCount
          ? _value.quantityCount
          : quantityCount // ignore: cast_nullable_to_non_nullable
              as double,
      codeUnitMeasure: freezed == codeUnitMeasure
          ? _value.codeUnitMeasure
          : codeUnitMeasure // ignore: cast_nullable_to_non_nullable
              as int?,
      observations: null == observations
          ? _value.observations
          : observations // ignore: cast_nullable_to_non_nullable
              as String,
      checkUbication: null == checkUbication
          ? _value.checkUbication
          : checkUbication // ignore: cast_nullable_to_non_nullable
              as bool,
      correctUbication: null == correctUbication
          ? _value.correctUbication
          : correctUbication // ignore: cast_nullable_to_non_nullable
              as String,
      jsonDetailCount: null == jsonDetailCount
          ? _value.jsonDetailCount
          : jsonDetailCount // ignore: cast_nullable_to_non_nullable
              as String,
      dateCount: null == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as DateTime,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      codeBatch: freezed == codeBatch
          ? _value.codeBatch
          : codeBatch // ignore: cast_nullable_to_non_nullable
              as String?,
      listImageCount: freezed == listImageCount
          ? _value.listImageCount
          : listImageCount // ignore: cast_nullable_to_non_nullable
              as List<ImageCountModel>?,
      listDetailCount: freezed == listDetailCount
          ? _value.listDetailCount
          : listDetailCount // ignore: cast_nullable_to_non_nullable
              as List<DetailCountModel>?,
      umBase: freezed == umBase
          ? _value.umBase
          : umBase // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      umLow: freezed == umLow
          ? _value.umLow
          : umLow // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      numberCount: freezed == numberCount
          ? _value.numberCount
          : numberCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
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
abstract class _$$CountInventoryDetailModelImplCopyWith<$Res>
    implements $CountInventoryDetailModelCopyWith<$Res> {
  factory _$$CountInventoryDetailModelImplCopyWith(
          _$CountInventoryDetailModelImpl value,
          $Res Function(_$CountInventoryDetailModelImpl) then) =
      __$$CountInventoryDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codeCountInventory,
      String codeProduct,
      String nameProduct,
      double quantityStock,
      double quantityStockInitial,
      double quantityCount,
      int? codeUnitMeasure,
      String observations,
      bool checkUbication,
      String correctUbication,
      String jsonDetailCount,
      DateTime dateCount,
      ProductModel? product,
      String? codeBatch,
      List<ImageCountModel>? listImageCount,
      List<DetailCountModel>? listDetailCount,
      @JsonKey(ignore: true) UnitMeasureModel? umBase,
      @JsonKey(ignore: true) UnitMeasureModel? umLow,
      int? numberCount});

  @override
  $ProductModelCopyWith<$Res>? get product;
  @override
  $UnitMeasureModelCopyWith<$Res>? get umBase;
  @override
  $UnitMeasureModelCopyWith<$Res>? get umLow;
}

/// @nodoc
class __$$CountInventoryDetailModelImplCopyWithImpl<$Res>
    extends _$CountInventoryDetailModelCopyWithImpl<$Res,
        _$CountInventoryDetailModelImpl>
    implements _$$CountInventoryDetailModelImplCopyWith<$Res> {
  __$$CountInventoryDetailModelImplCopyWithImpl(
      _$CountInventoryDetailModelImpl _value,
      $Res Function(_$CountInventoryDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeCountInventory = null,
    Object? codeProduct = null,
    Object? nameProduct = null,
    Object? quantityStock = null,
    Object? quantityStockInitial = null,
    Object? quantityCount = null,
    Object? codeUnitMeasure = freezed,
    Object? observations = null,
    Object? checkUbication = null,
    Object? correctUbication = null,
    Object? jsonDetailCount = null,
    Object? dateCount = null,
    Object? product = freezed,
    Object? codeBatch = freezed,
    Object? listImageCount = freezed,
    Object? listDetailCount = freezed,
    Object? umBase = freezed,
    Object? umLow = freezed,
    Object? numberCount = freezed,
  }) {
    return _then(_$CountInventoryDetailModelImpl(
      codeCountInventory: null == codeCountInventory
          ? _value.codeCountInventory
          : codeCountInventory // ignore: cast_nullable_to_non_nullable
              as int,
      codeProduct: null == codeProduct
          ? _value.codeProduct
          : codeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      nameProduct: null == nameProduct
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String,
      quantityStock: null == quantityStock
          ? _value.quantityStock
          : quantityStock // ignore: cast_nullable_to_non_nullable
              as double,
      quantityStockInitial: null == quantityStockInitial
          ? _value.quantityStockInitial
          : quantityStockInitial // ignore: cast_nullable_to_non_nullable
              as double,
      quantityCount: null == quantityCount
          ? _value.quantityCount
          : quantityCount // ignore: cast_nullable_to_non_nullable
              as double,
      codeUnitMeasure: freezed == codeUnitMeasure
          ? _value.codeUnitMeasure
          : codeUnitMeasure // ignore: cast_nullable_to_non_nullable
              as int?,
      observations: null == observations
          ? _value.observations
          : observations // ignore: cast_nullable_to_non_nullable
              as String,
      checkUbication: null == checkUbication
          ? _value.checkUbication
          : checkUbication // ignore: cast_nullable_to_non_nullable
              as bool,
      correctUbication: null == correctUbication
          ? _value.correctUbication
          : correctUbication // ignore: cast_nullable_to_non_nullable
              as String,
      jsonDetailCount: null == jsonDetailCount
          ? _value.jsonDetailCount
          : jsonDetailCount // ignore: cast_nullable_to_non_nullable
              as String,
      dateCount: null == dateCount
          ? _value.dateCount
          : dateCount // ignore: cast_nullable_to_non_nullable
              as DateTime,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      codeBatch: freezed == codeBatch
          ? _value.codeBatch
          : codeBatch // ignore: cast_nullable_to_non_nullable
              as String?,
      listImageCount: freezed == listImageCount
          ? _value._listImageCount
          : listImageCount // ignore: cast_nullable_to_non_nullable
              as List<ImageCountModel>?,
      listDetailCount: freezed == listDetailCount
          ? _value._listDetailCount
          : listDetailCount // ignore: cast_nullable_to_non_nullable
              as List<DetailCountModel>?,
      umBase: freezed == umBase
          ? _value.umBase
          : umBase // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      umLow: freezed == umLow
          ? _value.umLow
          : umLow // ignore: cast_nullable_to_non_nullable
              as UnitMeasureModel?,
      numberCount: freezed == numberCount
          ? _value.numberCount
          : numberCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountInventoryDetailModelImpl implements _CountInventoryDetailModel {
  _$CountInventoryDetailModelImpl(
      {required this.codeCountInventory,
      required this.codeProduct,
      required this.nameProduct,
      required this.quantityStock,
      required this.quantityStockInitial,
      required this.quantityCount,
      required this.codeUnitMeasure,
      required this.observations,
      required this.checkUbication,
      required this.correctUbication,
      required this.jsonDetailCount,
      required this.dateCount,
      required this.product,
      this.codeBatch,
      required final List<ImageCountModel>? listImageCount,
      required final List<DetailCountModel>? listDetailCount,
      @JsonKey(ignore: true) this.umBase,
      @JsonKey(ignore: true) this.umLow,
      required this.numberCount})
      : _listImageCount = listImageCount,
        _listDetailCount = listDetailCount;

  factory _$CountInventoryDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountInventoryDetailModelImplFromJson(json);

  @override
  final int codeCountInventory;
  @override
  final String codeProduct;
  @override
  final String nameProduct;
  @override
  final double quantityStock;
  @override
  final double quantityStockInitial;
  @override
  final double quantityCount;
  @override
  final int? codeUnitMeasure;
  @override
  final String observations;
  @override
  final bool checkUbication;
  @override
  final String correctUbication;
  @override
  final String jsonDetailCount;
  @override
  final DateTime dateCount;
  @override
  final ProductModel? product;
  @override
  final String? codeBatch;
// List<BatchModel>? lstBatch,
  final List<ImageCountModel>? _listImageCount;
// List<BatchModel>? lstBatch,
  @override
  List<ImageCountModel>? get listImageCount {
    final value = _listImageCount;
    if (value == null) return null;
    if (_listImageCount is EqualUnmodifiableListView) return _listImageCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DetailCountModel>? _listDetailCount;
  @override
  List<DetailCountModel>? get listDetailCount {
    final value = _listDetailCount;
    if (value == null) return null;
    if (_listDetailCount is EqualUnmodifiableListView) return _listDetailCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(ignore: true)
  final UnitMeasureModel? umBase;
  @override
  @JsonKey(ignore: true)
  final UnitMeasureModel? umLow;
  @override
  final int? numberCount;

  @override
  String toString() {
    return 'CountInventoryDetailModel(codeCountInventory: $codeCountInventory, codeProduct: $codeProduct, nameProduct: $nameProduct, quantityStock: $quantityStock, quantityStockInitial: $quantityStockInitial, quantityCount: $quantityCount, codeUnitMeasure: $codeUnitMeasure, observations: $observations, checkUbication: $checkUbication, correctUbication: $correctUbication, jsonDetailCount: $jsonDetailCount, dateCount: $dateCount, product: $product, codeBatch: $codeBatch, listImageCount: $listImageCount, listDetailCount: $listDetailCount, umBase: $umBase, umLow: $umLow, numberCount: $numberCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountInventoryDetailModelImpl &&
            (identical(other.codeCountInventory, codeCountInventory) ||
                other.codeCountInventory == codeCountInventory) &&
            (identical(other.codeProduct, codeProduct) ||
                other.codeProduct == codeProduct) &&
            (identical(other.nameProduct, nameProduct) ||
                other.nameProduct == nameProduct) &&
            (identical(other.quantityStock, quantityStock) ||
                other.quantityStock == quantityStock) &&
            (identical(other.quantityStockInitial, quantityStockInitial) ||
                other.quantityStockInitial == quantityStockInitial) &&
            (identical(other.quantityCount, quantityCount) ||
                other.quantityCount == quantityCount) &&
            (identical(other.codeUnitMeasure, codeUnitMeasure) ||
                other.codeUnitMeasure == codeUnitMeasure) &&
            (identical(other.observations, observations) ||
                other.observations == observations) &&
            (identical(other.checkUbication, checkUbication) ||
                other.checkUbication == checkUbication) &&
            (identical(other.correctUbication, correctUbication) ||
                other.correctUbication == correctUbication) &&
            (identical(other.jsonDetailCount, jsonDetailCount) ||
                other.jsonDetailCount == jsonDetailCount) &&
            (identical(other.dateCount, dateCount) ||
                other.dateCount == dateCount) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.codeBatch, codeBatch) ||
                other.codeBatch == codeBatch) &&
            const DeepCollectionEquality()
                .equals(other._listImageCount, _listImageCount) &&
            const DeepCollectionEquality()
                .equals(other._listDetailCount, _listDetailCount) &&
            (identical(other.umBase, umBase) || other.umBase == umBase) &&
            (identical(other.umLow, umLow) || other.umLow == umLow) &&
            (identical(other.numberCount, numberCount) ||
                other.numberCount == numberCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        codeCountInventory,
        codeProduct,
        nameProduct,
        quantityStock,
        quantityStockInitial,
        quantityCount,
        codeUnitMeasure,
        observations,
        checkUbication,
        correctUbication,
        jsonDetailCount,
        dateCount,
        product,
        codeBatch,
        const DeepCollectionEquality().hash(_listImageCount),
        const DeepCollectionEquality().hash(_listDetailCount),
        umBase,
        umLow,
        numberCount
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountInventoryDetailModelImplCopyWith<_$CountInventoryDetailModelImpl>
      get copyWith => __$$CountInventoryDetailModelImplCopyWithImpl<
          _$CountInventoryDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountInventoryDetailModelImplToJson(
      this,
    );
  }
}

abstract class _CountInventoryDetailModel implements CountInventoryDetailModel {
  factory _CountInventoryDetailModel(
      {required final int codeCountInventory,
      required final String codeProduct,
      required final String nameProduct,
      required final double quantityStock,
      required final double quantityStockInitial,
      required final double quantityCount,
      required final int? codeUnitMeasure,
      required final String observations,
      required final bool checkUbication,
      required final String correctUbication,
      required final String jsonDetailCount,
      required final DateTime dateCount,
      required final ProductModel? product,
      final String? codeBatch,
      required final List<ImageCountModel>? listImageCount,
      required final List<DetailCountModel>? listDetailCount,
      @JsonKey(ignore: true) final UnitMeasureModel? umBase,
      @JsonKey(ignore: true) final UnitMeasureModel? umLow,
      required final int? numberCount}) = _$CountInventoryDetailModelImpl;

  factory _CountInventoryDetailModel.fromJson(Map<String, dynamic> json) =
      _$CountInventoryDetailModelImpl.fromJson;

  @override
  int get codeCountInventory;
  @override
  String get codeProduct;
  @override
  String get nameProduct;
  @override
  double get quantityStock;
  @override
  double get quantityStockInitial;
  @override
  double get quantityCount;
  @override
  int? get codeUnitMeasure;
  @override
  String get observations;
  @override
  bool get checkUbication;
  @override
  String get correctUbication;
  @override
  String get jsonDetailCount;
  @override
  DateTime get dateCount;
  @override
  ProductModel? get product;
  @override
  String? get codeBatch;
  @override // List<BatchModel>? lstBatch,
  List<ImageCountModel>? get listImageCount;
  @override
  List<DetailCountModel>? get listDetailCount;
  @override
  @JsonKey(ignore: true)
  UnitMeasureModel? get umBase;
  @override
  @JsonKey(ignore: true)
  UnitMeasureModel? get umLow;
  @override
  int? get numberCount;
  @override
  @JsonKey(ignore: true)
  _$$CountInventoryDetailModelImplCopyWith<_$CountInventoryDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
