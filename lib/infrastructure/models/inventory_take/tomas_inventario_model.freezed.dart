// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tomas_inventario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TomasInventarioModel _$TomasInventarioModelFromJson(Map<String, dynamic> json) {
  return _TomasInventarioModel.fromJson(json);
}

/// @nodoc
mixin _$TomasInventarioModel {
  int get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get codeWarehouse => throw _privateConstructorUsedError;
  String? get nameWarehouse => throw _privateConstructorUsedError;
  int get codeCreator => throw _privateConstructorUsedError;
  DateTime get dateCreation => throw _privateConstructorUsedError;
  String get statusTI => throw _privateConstructorUsedError;
  String get typeTI => throw _privateConstructorUsedError;
  int get quantityProduct => throw _privateConstructorUsedError;
  int get quantityCount => throw _privateConstructorUsedError;
  int get quantityCountFinished => throw _privateConstructorUsedError;
  List<ListDetailProductModel>? get listDetailProduct =>
      throw _privateConstructorUsedError;
  List<CountInventoryModel>? get listCountInventory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TomasInventarioModelCopyWith<TomasInventarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TomasInventarioModelCopyWith<$Res> {
  factory $TomasInventarioModelCopyWith(TomasInventarioModel value,
          $Res Function(TomasInventarioModel) then) =
      _$TomasInventarioModelCopyWithImpl<$Res, TomasInventarioModel>;
  @useResult
  $Res call(
      {int code,
      String name,
      int codeWarehouse,
      String? nameWarehouse,
      int codeCreator,
      DateTime dateCreation,
      String statusTI,
      String typeTI,
      int quantityProduct,
      int quantityCount,
      int quantityCountFinished,
      List<ListDetailProductModel>? listDetailProduct,
      List<CountInventoryModel>? listCountInventory});
}

/// @nodoc
class _$TomasInventarioModelCopyWithImpl<$Res,
        $Val extends TomasInventarioModel>
    implements $TomasInventarioModelCopyWith<$Res> {
  _$TomasInventarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? codeWarehouse = null,
    Object? nameWarehouse = freezed,
    Object? codeCreator = null,
    Object? dateCreation = null,
    Object? statusTI = null,
    Object? typeTI = null,
    Object? quantityProduct = null,
    Object? quantityCount = null,
    Object? quantityCountFinished = null,
    Object? listDetailProduct = freezed,
    Object? listCountInventory = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      codeWarehouse: null == codeWarehouse
          ? _value.codeWarehouse
          : codeWarehouse // ignore: cast_nullable_to_non_nullable
              as int,
      nameWarehouse: freezed == nameWarehouse
          ? _value.nameWarehouse
          : nameWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      codeCreator: null == codeCreator
          ? _value.codeCreator
          : codeCreator // ignore: cast_nullable_to_non_nullable
              as int,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusTI: null == statusTI
          ? _value.statusTI
          : statusTI // ignore: cast_nullable_to_non_nullable
              as String,
      typeTI: null == typeTI
          ? _value.typeTI
          : typeTI // ignore: cast_nullable_to_non_nullable
              as String,
      quantityProduct: null == quantityProduct
          ? _value.quantityProduct
          : quantityProduct // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCount: null == quantityCount
          ? _value.quantityCount
          : quantityCount // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCountFinished: null == quantityCountFinished
          ? _value.quantityCountFinished
          : quantityCountFinished // ignore: cast_nullable_to_non_nullable
              as int,
      listDetailProduct: freezed == listDetailProduct
          ? _value.listDetailProduct
          : listDetailProduct // ignore: cast_nullable_to_non_nullable
              as List<ListDetailProductModel>?,
      listCountInventory: freezed == listCountInventory
          ? _value.listCountInventory
          : listCountInventory // ignore: cast_nullable_to_non_nullable
              as List<CountInventoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TomasInventarioModelImplCopyWith<$Res>
    implements $TomasInventarioModelCopyWith<$Res> {
  factory _$$TomasInventarioModelImplCopyWith(_$TomasInventarioModelImpl value,
          $Res Function(_$TomasInventarioModelImpl) then) =
      __$$TomasInventarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int code,
      String name,
      int codeWarehouse,
      String? nameWarehouse,
      int codeCreator,
      DateTime dateCreation,
      String statusTI,
      String typeTI,
      int quantityProduct,
      int quantityCount,
      int quantityCountFinished,
      List<ListDetailProductModel>? listDetailProduct,
      List<CountInventoryModel>? listCountInventory});
}

/// @nodoc
class __$$TomasInventarioModelImplCopyWithImpl<$Res>
    extends _$TomasInventarioModelCopyWithImpl<$Res, _$TomasInventarioModelImpl>
    implements _$$TomasInventarioModelImplCopyWith<$Res> {
  __$$TomasInventarioModelImplCopyWithImpl(_$TomasInventarioModelImpl _value,
      $Res Function(_$TomasInventarioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? codeWarehouse = null,
    Object? nameWarehouse = freezed,
    Object? codeCreator = null,
    Object? dateCreation = null,
    Object? statusTI = null,
    Object? typeTI = null,
    Object? quantityProduct = null,
    Object? quantityCount = null,
    Object? quantityCountFinished = null,
    Object? listDetailProduct = freezed,
    Object? listCountInventory = freezed,
  }) {
    return _then(_$TomasInventarioModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      codeWarehouse: null == codeWarehouse
          ? _value.codeWarehouse
          : codeWarehouse // ignore: cast_nullable_to_non_nullable
              as int,
      nameWarehouse: freezed == nameWarehouse
          ? _value.nameWarehouse
          : nameWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      codeCreator: null == codeCreator
          ? _value.codeCreator
          : codeCreator // ignore: cast_nullable_to_non_nullable
              as int,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusTI: null == statusTI
          ? _value.statusTI
          : statusTI // ignore: cast_nullable_to_non_nullable
              as String,
      typeTI: null == typeTI
          ? _value.typeTI
          : typeTI // ignore: cast_nullable_to_non_nullable
              as String,
      quantityProduct: null == quantityProduct
          ? _value.quantityProduct
          : quantityProduct // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCount: null == quantityCount
          ? _value.quantityCount
          : quantityCount // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCountFinished: null == quantityCountFinished
          ? _value.quantityCountFinished
          : quantityCountFinished // ignore: cast_nullable_to_non_nullable
              as int,
      listDetailProduct: freezed == listDetailProduct
          ? _value._listDetailProduct
          : listDetailProduct // ignore: cast_nullable_to_non_nullable
              as List<ListDetailProductModel>?,
      listCountInventory: freezed == listCountInventory
          ? _value._listCountInventory
          : listCountInventory // ignore: cast_nullable_to_non_nullable
              as List<CountInventoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TomasInventarioModelImpl implements _TomasInventarioModel {
  _$TomasInventarioModelImpl(
      {required this.code,
      required this.name,
      required this.codeWarehouse,
      this.nameWarehouse,
      required this.codeCreator,
      required this.dateCreation,
      required this.statusTI,
      required this.typeTI,
      required this.quantityProduct,
      required this.quantityCount,
      required this.quantityCountFinished,
      final List<ListDetailProductModel>? listDetailProduct,
      final List<CountInventoryModel>? listCountInventory})
      : _listDetailProduct = listDetailProduct,
        _listCountInventory = listCountInventory;

  factory _$TomasInventarioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TomasInventarioModelImplFromJson(json);

  @override
  final int code;
  @override
  final String name;
  @override
  final int codeWarehouse;
  @override
  final String? nameWarehouse;
  @override
  final int codeCreator;
  @override
  final DateTime dateCreation;
  @override
  final String statusTI;
  @override
  final String typeTI;
  @override
  final int quantityProduct;
  @override
  final int quantityCount;
  @override
  final int quantityCountFinished;
  final List<ListDetailProductModel>? _listDetailProduct;
  @override
  List<ListDetailProductModel>? get listDetailProduct {
    final value = _listDetailProduct;
    if (value == null) return null;
    if (_listDetailProduct is EqualUnmodifiableListView)
      return _listDetailProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CountInventoryModel>? _listCountInventory;
  @override
  List<CountInventoryModel>? get listCountInventory {
    final value = _listCountInventory;
    if (value == null) return null;
    if (_listCountInventory is EqualUnmodifiableListView)
      return _listCountInventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TomasInventarioModel(code: $code, name: $name, codeWarehouse: $codeWarehouse, nameWarehouse: $nameWarehouse, codeCreator: $codeCreator, dateCreation: $dateCreation, statusTI: $statusTI, typeTI: $typeTI, quantityProduct: $quantityProduct, quantityCount: $quantityCount, quantityCountFinished: $quantityCountFinished, listDetailProduct: $listDetailProduct, listCountInventory: $listCountInventory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TomasInventarioModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.codeWarehouse, codeWarehouse) ||
                other.codeWarehouse == codeWarehouse) &&
            (identical(other.nameWarehouse, nameWarehouse) ||
                other.nameWarehouse == nameWarehouse) &&
            (identical(other.codeCreator, codeCreator) ||
                other.codeCreator == codeCreator) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation) &&
            (identical(other.statusTI, statusTI) ||
                other.statusTI == statusTI) &&
            (identical(other.typeTI, typeTI) || other.typeTI == typeTI) &&
            (identical(other.quantityProduct, quantityProduct) ||
                other.quantityProduct == quantityProduct) &&
            (identical(other.quantityCount, quantityCount) ||
                other.quantityCount == quantityCount) &&
            (identical(other.quantityCountFinished, quantityCountFinished) ||
                other.quantityCountFinished == quantityCountFinished) &&
            const DeepCollectionEquality()
                .equals(other._listDetailProduct, _listDetailProduct) &&
            const DeepCollectionEquality()
                .equals(other._listCountInventory, _listCountInventory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      codeWarehouse,
      nameWarehouse,
      codeCreator,
      dateCreation,
      statusTI,
      typeTI,
      quantityProduct,
      quantityCount,
      quantityCountFinished,
      const DeepCollectionEquality().hash(_listDetailProduct),
      const DeepCollectionEquality().hash(_listCountInventory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TomasInventarioModelImplCopyWith<_$TomasInventarioModelImpl>
      get copyWith =>
          __$$TomasInventarioModelImplCopyWithImpl<_$TomasInventarioModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TomasInventarioModelImplToJson(
      this,
    );
  }
}

abstract class _TomasInventarioModel implements TomasInventarioModel {
  factory _TomasInventarioModel(
          {required final int code,
          required final String name,
          required final int codeWarehouse,
          final String? nameWarehouse,
          required final int codeCreator,
          required final DateTime dateCreation,
          required final String statusTI,
          required final String typeTI,
          required final int quantityProduct,
          required final int quantityCount,
          required final int quantityCountFinished,
          final List<ListDetailProductModel>? listDetailProduct,
          final List<CountInventoryModel>? listCountInventory}) =
      _$TomasInventarioModelImpl;

  factory _TomasInventarioModel.fromJson(Map<String, dynamic> json) =
      _$TomasInventarioModelImpl.fromJson;

  @override
  int get code;
  @override
  String get name;
  @override
  int get codeWarehouse;
  @override
  String? get nameWarehouse;
  @override
  int get codeCreator;
  @override
  DateTime get dateCreation;
  @override
  String get statusTI;
  @override
  String get typeTI;
  @override
  int get quantityProduct;
  @override
  int get quantityCount;
  @override
  int get quantityCountFinished;
  @override
  List<ListDetailProductModel>? get listDetailProduct;
  @override
  List<CountInventoryModel>? get listCountInventory;
  @override
  @JsonKey(ignore: true)
  _$$TomasInventarioModelImplCopyWith<_$TomasInventarioModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
