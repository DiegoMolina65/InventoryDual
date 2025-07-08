// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) {
  return _BatchModel.fromJson(json);
}

/// @nodoc
mixin _$BatchModel {
  String get code => throw _privateConstructorUsedError;
  DateTime get expirationDate => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchModelCopyWith<BatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchModelCopyWith<$Res> {
  factory $BatchModelCopyWith(
          BatchModel value, $Res Function(BatchModel) then) =
      _$BatchModelCopyWithImpl<$Res, BatchModel>;
  @useResult
  $Res call({String code, DateTime expirationDate, double stock});
}

/// @nodoc
class _$BatchModelCopyWithImpl<$Res, $Val extends BatchModel>
    implements $BatchModelCopyWith<$Res> {
  _$BatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? expirationDate = null,
    Object? stock = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchModelImplCopyWith<$Res>
    implements $BatchModelCopyWith<$Res> {
  factory _$$BatchModelImplCopyWith(
          _$BatchModelImpl value, $Res Function(_$BatchModelImpl) then) =
      __$$BatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, DateTime expirationDate, double stock});
}

/// @nodoc
class __$$BatchModelImplCopyWithImpl<$Res>
    extends _$BatchModelCopyWithImpl<$Res, _$BatchModelImpl>
    implements _$$BatchModelImplCopyWith<$Res> {
  __$$BatchModelImplCopyWithImpl(
      _$BatchModelImpl _value, $Res Function(_$BatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? expirationDate = null,
    Object? stock = null,
  }) {
    return _then(_$BatchModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchModelImpl implements _BatchModel {
  _$BatchModelImpl(
      {required this.code, required this.expirationDate, required this.stock});

  factory _$BatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchModelImplFromJson(json);

  @override
  final String code;
  @override
  final DateTime expirationDate;
  @override
  final double stock;

  @override
  String toString() {
    return 'BatchModel(code: $code, expirationDate: $expirationDate, stock: $stock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.stock, stock) || other.stock == stock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, expirationDate, stock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchModelImplCopyWith<_$BatchModelImpl> get copyWith =>
      __$$BatchModelImplCopyWithImpl<_$BatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchModelImplToJson(
      this,
    );
  }
}

abstract class _BatchModel implements BatchModel {
  factory _BatchModel(
      {required final String code,
      required final DateTime expirationDate,
      required final double stock}) = _$BatchModelImpl;

  factory _BatchModel.fromJson(Map<String, dynamic> json) =
      _$BatchModelImpl.fromJson;

  @override
  String get code;
  @override
  DateTime get expirationDate;
  @override
  double get stock;
  @override
  @JsonKey(ignore: true)
  _$$BatchModelImplCopyWith<_$BatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
