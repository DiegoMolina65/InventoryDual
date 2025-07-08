// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_measure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitMeasureModel _$UnitMeasureModelFromJson(Map<String, dynamic> json) {
  return _UnitMeasureModel.fromJson(json);
}

/// @nodoc
mixin _$UnitMeasureModel {
  int get code => throw _privateConstructorUsedError;
  String get codeProduct => throw _privateConstructorUsedError;
  int get item => throw _privateConstructorUsedError;
  double get relation => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitMeasureModelCopyWith<UnitMeasureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitMeasureModelCopyWith<$Res> {
  factory $UnitMeasureModelCopyWith(
          UnitMeasureModel value, $Res Function(UnitMeasureModel) then) =
      _$UnitMeasureModelCopyWithImpl<$Res, UnitMeasureModel>;
  @useResult
  $Res call(
      {int code,
      String codeProduct,
      int item,
      double relation,
      double discount,
      String description});
}

/// @nodoc
class _$UnitMeasureModelCopyWithImpl<$Res, $Val extends UnitMeasureModel>
    implements $UnitMeasureModelCopyWith<$Res> {
  _$UnitMeasureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? codeProduct = null,
    Object? item = null,
    Object? relation = null,
    Object? discount = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      codeProduct: null == codeProduct
          ? _value.codeProduct
          : codeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as int,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitMeasureModelImplCopyWith<$Res>
    implements $UnitMeasureModelCopyWith<$Res> {
  factory _$$UnitMeasureModelImplCopyWith(_$UnitMeasureModelImpl value,
          $Res Function(_$UnitMeasureModelImpl) then) =
      __$$UnitMeasureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int code,
      String codeProduct,
      int item,
      double relation,
      double discount,
      String description});
}

/// @nodoc
class __$$UnitMeasureModelImplCopyWithImpl<$Res>
    extends _$UnitMeasureModelCopyWithImpl<$Res, _$UnitMeasureModelImpl>
    implements _$$UnitMeasureModelImplCopyWith<$Res> {
  __$$UnitMeasureModelImplCopyWithImpl(_$UnitMeasureModelImpl _value,
      $Res Function(_$UnitMeasureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? codeProduct = null,
    Object? item = null,
    Object? relation = null,
    Object? discount = null,
    Object? description = null,
  }) {
    return _then(_$UnitMeasureModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      codeProduct: null == codeProduct
          ? _value.codeProduct
          : codeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as int,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitMeasureModelImpl implements _UnitMeasureModel {
  _$UnitMeasureModelImpl(
      {required this.code,
      required this.codeProduct,
      required this.item,
      required this.relation,
      required this.discount,
      required this.description});

  factory _$UnitMeasureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitMeasureModelImplFromJson(json);

  @override
  final int code;
  @override
  final String codeProduct;
  @override
  final int item;
  @override
  final double relation;
  @override
  final double discount;
  @override
  final String description;

  @override
  String toString() {
    return 'UnitMeasureModel(code: $code, codeProduct: $codeProduct, item: $item, relation: $relation, discount: $discount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitMeasureModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.codeProduct, codeProduct) ||
                other.codeProduct == codeProduct) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, codeProduct, item, relation, discount, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitMeasureModelImplCopyWith<_$UnitMeasureModelImpl> get copyWith =>
      __$$UnitMeasureModelImplCopyWithImpl<_$UnitMeasureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitMeasureModelImplToJson(
      this,
    );
  }
}

abstract class _UnitMeasureModel implements UnitMeasureModel {
  factory _UnitMeasureModel(
      {required final int code,
      required final String codeProduct,
      required final int item,
      required final double relation,
      required final double discount,
      required final String description}) = _$UnitMeasureModelImpl;

  factory _UnitMeasureModel.fromJson(Map<String, dynamic> json) =
      _$UnitMeasureModelImpl.fromJson;

  @override
  int get code;
  @override
  String get codeProduct;
  @override
  int get item;
  @override
  double get relation;
  @override
  double get discount;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$UnitMeasureModelImplCopyWith<_$UnitMeasureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
