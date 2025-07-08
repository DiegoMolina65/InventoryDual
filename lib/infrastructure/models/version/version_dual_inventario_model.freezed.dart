// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_dual_inventario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VersionDualInventarioModel _$VersionDualInventarioModelFromJson(
    Map<String, dynamic> json) {
  return _VersionDualInventarioModel.fromJson(json);
}

/// @nodoc
mixin _$VersionDualInventarioModel {
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionDualInventarioModelCopyWith<VersionDualInventarioModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionDualInventarioModelCopyWith<$Res> {
  factory $VersionDualInventarioModelCopyWith(VersionDualInventarioModel value,
          $Res Function(VersionDualInventarioModel) then) =
      _$VersionDualInventarioModelCopyWithImpl<$Res,
          VersionDualInventarioModel>;
  @useResult
  $Res call({String version});
}

/// @nodoc
class _$VersionDualInventarioModelCopyWithImpl<$Res,
        $Val extends VersionDualInventarioModel>
    implements $VersionDualInventarioModelCopyWith<$Res> {
  _$VersionDualInventarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionDualInventarioModelImplCopyWith<$Res>
    implements $VersionDualInventarioModelCopyWith<$Res> {
  factory _$$VersionDualInventarioModelImplCopyWith(
          _$VersionDualInventarioModelImpl value,
          $Res Function(_$VersionDualInventarioModelImpl) then) =
      __$$VersionDualInventarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version});
}

/// @nodoc
class __$$VersionDualInventarioModelImplCopyWithImpl<$Res>
    extends _$VersionDualInventarioModelCopyWithImpl<$Res,
        _$VersionDualInventarioModelImpl>
    implements _$$VersionDualInventarioModelImplCopyWith<$Res> {
  __$$VersionDualInventarioModelImplCopyWithImpl(
      _$VersionDualInventarioModelImpl _value,
      $Res Function(_$VersionDualInventarioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$VersionDualInventarioModelImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionDualInventarioModelImpl implements _VersionDualInventarioModel {
  const _$VersionDualInventarioModelImpl({required this.version});

  factory _$VersionDualInventarioModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VersionDualInventarioModelImplFromJson(json);

  @override
  final String version;

  @override
  String toString() {
    return 'VersionDualInventarioModel(version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionDualInventarioModelImpl &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionDualInventarioModelImplCopyWith<_$VersionDualInventarioModelImpl>
      get copyWith => __$$VersionDualInventarioModelImplCopyWithImpl<
          _$VersionDualInventarioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionDualInventarioModelImplToJson(
      this,
    );
  }
}

abstract class _VersionDualInventarioModel
    implements VersionDualInventarioModel {
  const factory _VersionDualInventarioModel({required final String version}) =
      _$VersionDualInventarioModelImpl;

  factory _VersionDualInventarioModel.fromJson(Map<String, dynamic> json) =
      _$VersionDualInventarioModelImpl.fromJson;

  @override
  String get version;
  @override
  @JsonKey(ignore: true)
  _$$VersionDualInventarioModelImplCopyWith<_$VersionDualInventarioModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
