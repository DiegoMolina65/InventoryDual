// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) {
  return _WarehouseModel.fromJson(json);
}

/// @nodoc
mixin _$WarehouseModel {
  int get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WarehouseModelCopyWith<WarehouseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseModelCopyWith<$Res> {
  factory $WarehouseModelCopyWith(
          WarehouseModel value, $Res Function(WarehouseModel) then) =
      _$WarehouseModelCopyWithImpl<$Res, WarehouseModel>;
  @useResult
  $Res call({int code, String name});
}

/// @nodoc
class _$WarehouseModelCopyWithImpl<$Res, $Val extends WarehouseModel>
    implements $WarehouseModelCopyWith<$Res> {
  _$WarehouseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WarehouseModelImplCopyWith<$Res>
    implements $WarehouseModelCopyWith<$Res> {
  factory _$$WarehouseModelImplCopyWith(_$WarehouseModelImpl value,
          $Res Function(_$WarehouseModelImpl) then) =
      __$$WarehouseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String name});
}

/// @nodoc
class __$$WarehouseModelImplCopyWithImpl<$Res>
    extends _$WarehouseModelCopyWithImpl<$Res, _$WarehouseModelImpl>
    implements _$$WarehouseModelImplCopyWith<$Res> {
  __$$WarehouseModelImplCopyWithImpl(
      _$WarehouseModelImpl _value, $Res Function(_$WarehouseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$WarehouseModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WarehouseModelImpl implements _WarehouseModel {
  _$WarehouseModelImpl({required this.code, required this.name});

  factory _$WarehouseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WarehouseModelImplFromJson(json);

  @override
  final int code;
  @override
  final String name;

  @override
  String toString() {
    return 'WarehouseModel(code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseModelImplCopyWith<_$WarehouseModelImpl> get copyWith =>
      __$$WarehouseModelImplCopyWithImpl<_$WarehouseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WarehouseModelImplToJson(
      this,
    );
  }
}

abstract class _WarehouseModel implements WarehouseModel {
  factory _WarehouseModel(
      {required final int code,
      required final String name}) = _$WarehouseModelImpl;

  factory _WarehouseModel.fromJson(Map<String, dynamic> json) =
      _$WarehouseModelImpl.fromJson;

  @override
  int get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$WarehouseModelImplCopyWith<_$WarehouseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
