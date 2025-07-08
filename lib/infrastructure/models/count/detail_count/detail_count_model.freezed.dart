// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCountModel _$DetailCountModelFromJson(Map<String, dynamic> json) {
  return _DetailCountModel.fromJson(json);
}

/// @nodoc
mixin _$DetailCountModel {
  int get codeUnitMeasure => throw _privateConstructorUsedError;
  String get nameUnitMeasure => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get quantityBase => throw _privateConstructorUsedError;
  DateTime get timeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCountModelCopyWith<DetailCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCountModelCopyWith<$Res> {
  factory $DetailCountModelCopyWith(
          DetailCountModel value, $Res Function(DetailCountModel) then) =
      _$DetailCountModelCopyWithImpl<$Res, DetailCountModel>;
  @useResult
  $Res call(
      {int codeUnitMeasure,
      String nameUnitMeasure,
      double quantity,
      double quantityBase,
      DateTime timeCount});
}

/// @nodoc
class _$DetailCountModelCopyWithImpl<$Res, $Val extends DetailCountModel>
    implements $DetailCountModelCopyWith<$Res> {
  _$DetailCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeUnitMeasure = null,
    Object? nameUnitMeasure = null,
    Object? quantity = null,
    Object? quantityBase = null,
    Object? timeCount = null,
  }) {
    return _then(_value.copyWith(
      codeUnitMeasure: null == codeUnitMeasure
          ? _value.codeUnitMeasure
          : codeUnitMeasure // ignore: cast_nullable_to_non_nullable
              as int,
      nameUnitMeasure: null == nameUnitMeasure
          ? _value.nameUnitMeasure
          : nameUnitMeasure // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      quantityBase: null == quantityBase
          ? _value.quantityBase
          : quantityBase // ignore: cast_nullable_to_non_nullable
              as double,
      timeCount: null == timeCount
          ? _value.timeCount
          : timeCount // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCountModelImplCopyWith<$Res>
    implements $DetailCountModelCopyWith<$Res> {
  factory _$$DetailCountModelImplCopyWith(_$DetailCountModelImpl value,
          $Res Function(_$DetailCountModelImpl) then) =
      __$$DetailCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codeUnitMeasure,
      String nameUnitMeasure,
      double quantity,
      double quantityBase,
      DateTime timeCount});
}

/// @nodoc
class __$$DetailCountModelImplCopyWithImpl<$Res>
    extends _$DetailCountModelCopyWithImpl<$Res, _$DetailCountModelImpl>
    implements _$$DetailCountModelImplCopyWith<$Res> {
  __$$DetailCountModelImplCopyWithImpl(_$DetailCountModelImpl _value,
      $Res Function(_$DetailCountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeUnitMeasure = null,
    Object? nameUnitMeasure = null,
    Object? quantity = null,
    Object? quantityBase = null,
    Object? timeCount = null,
  }) {
    return _then(_$DetailCountModelImpl(
      codeUnitMeasure: null == codeUnitMeasure
          ? _value.codeUnitMeasure
          : codeUnitMeasure // ignore: cast_nullable_to_non_nullable
              as int,
      nameUnitMeasure: null == nameUnitMeasure
          ? _value.nameUnitMeasure
          : nameUnitMeasure // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      quantityBase: null == quantityBase
          ? _value.quantityBase
          : quantityBase // ignore: cast_nullable_to_non_nullable
              as double,
      timeCount: null == timeCount
          ? _value.timeCount
          : timeCount // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCountModelImpl implements _DetailCountModel {
  _$DetailCountModelImpl(
      {required this.codeUnitMeasure,
      required this.nameUnitMeasure,
      required this.quantity,
      required this.quantityBase,
      required this.timeCount});

  factory _$DetailCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCountModelImplFromJson(json);

  @override
  final int codeUnitMeasure;
  @override
  final String nameUnitMeasure;
  @override
  final double quantity;
  @override
  final double quantityBase;
  @override
  final DateTime timeCount;

  @override
  String toString() {
    return 'DetailCountModel(codeUnitMeasure: $codeUnitMeasure, nameUnitMeasure: $nameUnitMeasure, quantity: $quantity, quantityBase: $quantityBase, timeCount: $timeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCountModelImpl &&
            (identical(other.codeUnitMeasure, codeUnitMeasure) ||
                other.codeUnitMeasure == codeUnitMeasure) &&
            (identical(other.nameUnitMeasure, nameUnitMeasure) ||
                other.nameUnitMeasure == nameUnitMeasure) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.quantityBase, quantityBase) ||
                other.quantityBase == quantityBase) &&
            (identical(other.timeCount, timeCount) ||
                other.timeCount == timeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codeUnitMeasure, nameUnitMeasure,
      quantity, quantityBase, timeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCountModelImplCopyWith<_$DetailCountModelImpl> get copyWith =>
      __$$DetailCountModelImplCopyWithImpl<_$DetailCountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCountModelImplToJson(
      this,
    );
  }
}

abstract class _DetailCountModel implements DetailCountModel {
  factory _DetailCountModel(
      {required final int codeUnitMeasure,
      required final String nameUnitMeasure,
      required final double quantity,
      required final double quantityBase,
      required final DateTime timeCount}) = _$DetailCountModelImpl;

  factory _DetailCountModel.fromJson(Map<String, dynamic> json) =
      _$DetailCountModelImpl.fromJson;

  @override
  int get codeUnitMeasure;
  @override
  String get nameUnitMeasure;
  @override
  double get quantity;
  @override
  double get quantityBase;
  @override
  DateTime get timeCount;
  @override
  @JsonKey(ignore: true)
  _$$DetailCountModelImplCopyWith<_$DetailCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
