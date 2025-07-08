// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subgroup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubgroupModel _$SubgroupModelFromJson(Map<String, dynamic> json) {
  return _SubgroupModel.fromJson(json);
}

/// @nodoc
mixin _$SubgroupModel {
  int get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get codeLine => throw _privateConstructorUsedError;
  int get codeGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubgroupModelCopyWith<SubgroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubgroupModelCopyWith<$Res> {
  factory $SubgroupModelCopyWith(
          SubgroupModel value, $Res Function(SubgroupModel) then) =
      _$SubgroupModelCopyWithImpl<$Res, SubgroupModel>;
  @useResult
  $Res call({int code, String description, int codeLine, int codeGroup});
}

/// @nodoc
class _$SubgroupModelCopyWithImpl<$Res, $Val extends SubgroupModel>
    implements $SubgroupModelCopyWith<$Res> {
  _$SubgroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? codeLine = null,
    Object? codeGroup = null,
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
      codeLine: null == codeLine
          ? _value.codeLine
          : codeLine // ignore: cast_nullable_to_non_nullable
              as int,
      codeGroup: null == codeGroup
          ? _value.codeGroup
          : codeGroup // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubgroupModelImplCopyWith<$Res>
    implements $SubgroupModelCopyWith<$Res> {
  factory _$$SubgroupModelImplCopyWith(
          _$SubgroupModelImpl value, $Res Function(_$SubgroupModelImpl) then) =
      __$$SubgroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String description, int codeLine, int codeGroup});
}

/// @nodoc
class __$$SubgroupModelImplCopyWithImpl<$Res>
    extends _$SubgroupModelCopyWithImpl<$Res, _$SubgroupModelImpl>
    implements _$$SubgroupModelImplCopyWith<$Res> {
  __$$SubgroupModelImplCopyWithImpl(
      _$SubgroupModelImpl _value, $Res Function(_$SubgroupModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? codeLine = null,
    Object? codeGroup = null,
  }) {
    return _then(_$SubgroupModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      codeLine: null == codeLine
          ? _value.codeLine
          : codeLine // ignore: cast_nullable_to_non_nullable
              as int,
      codeGroup: null == codeGroup
          ? _value.codeGroup
          : codeGroup // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubgroupModelImpl implements _SubgroupModel {
  _$SubgroupModelImpl(
      {required this.code,
      required this.description,
      required this.codeLine,
      required this.codeGroup});

  factory _$SubgroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubgroupModelImplFromJson(json);

  @override
  final int code;
  @override
  final String description;
  @override
  final int codeLine;
  @override
  final int codeGroup;

  @override
  String toString() {
    return 'SubgroupModel(code: $code, description: $description, codeLine: $codeLine, codeGroup: $codeGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubgroupModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.codeLine, codeLine) ||
                other.codeLine == codeLine) &&
            (identical(other.codeGroup, codeGroup) ||
                other.codeGroup == codeGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, description, codeLine, codeGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubgroupModelImplCopyWith<_$SubgroupModelImpl> get copyWith =>
      __$$SubgroupModelImplCopyWithImpl<_$SubgroupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubgroupModelImplToJson(
      this,
    );
  }
}

abstract class _SubgroupModel implements SubgroupModel {
  factory _SubgroupModel(
      {required final int code,
      required final String description,
      required final int codeLine,
      required final int codeGroup}) = _$SubgroupModelImpl;

  factory _SubgroupModel.fromJson(Map<String, dynamic> json) =
      _$SubgroupModelImpl.fromJson;

  @override
  int get code;
  @override
  String get description;
  @override
  int get codeLine;
  @override
  int get codeGroup;
  @override
  @JsonKey(ignore: true)
  _$$SubgroupModelImplCopyWith<_$SubgroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
