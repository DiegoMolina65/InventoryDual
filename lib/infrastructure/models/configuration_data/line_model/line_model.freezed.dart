// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LineModel _$LineModelFromJson(Map<String, dynamic> json) {
  return _LineModel.fromJson(json);
}

/// @nodoc
mixin _$LineModel {
  int get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineModelCopyWith<LineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineModelCopyWith<$Res> {
  factory $LineModelCopyWith(LineModel value, $Res Function(LineModel) then) =
      _$LineModelCopyWithImpl<$Res, LineModel>;
  @useResult
  $Res call({int code, String description});
}

/// @nodoc
class _$LineModelCopyWithImpl<$Res, $Val extends LineModel>
    implements $LineModelCopyWith<$Res> {
  _$LineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LineModelImplCopyWith<$Res>
    implements $LineModelCopyWith<$Res> {
  factory _$$LineModelImplCopyWith(
          _$LineModelImpl value, $Res Function(_$LineModelImpl) then) =
      __$$LineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String description});
}

/// @nodoc
class __$$LineModelImplCopyWithImpl<$Res>
    extends _$LineModelCopyWithImpl<$Res, _$LineModelImpl>
    implements _$$LineModelImplCopyWith<$Res> {
  __$$LineModelImplCopyWithImpl(
      _$LineModelImpl _value, $Res Function(_$LineModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_$LineModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineModelImpl implements _LineModel {
  _$LineModelImpl({required this.code, required this.description});

  factory _$LineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineModelImplFromJson(json);

  @override
  final int code;
  @override
  final String description;

  @override
  String toString() {
    return 'LineModel(code: $code, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineModelImplCopyWith<_$LineModelImpl> get copyWith =>
      __$$LineModelImplCopyWithImpl<_$LineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineModelImplToJson(
      this,
    );
  }
}

abstract class _LineModel implements LineModel {
  factory _LineModel(
      {required final int code,
      required final String description}) = _$LineModelImpl;

  factory _LineModel.fromJson(Map<String, dynamic> json) =
      _$LineModelImpl.fromJson;

  @override
  int get code;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$LineModelImplCopyWith<_$LineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
