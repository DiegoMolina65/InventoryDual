// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'almacen_x_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlmacenXLocalModel _$AlmacenXLocalModelFromJson(Map<String, dynamic> json) {
  return _AlmacenXLocalModel.fromJson(json);
}

/// @nodoc
mixin _$AlmacenXLocalModel {
  int get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlmacenXLocalModelCopyWith<AlmacenXLocalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlmacenXLocalModelCopyWith<$Res> {
  factory $AlmacenXLocalModelCopyWith(
          AlmacenXLocalModel value, $Res Function(AlmacenXLocalModel) then) =
      _$AlmacenXLocalModelCopyWithImpl<$Res, AlmacenXLocalModel>;
  @useResult
  $Res call({int code, String name});
}

/// @nodoc
class _$AlmacenXLocalModelCopyWithImpl<$Res, $Val extends AlmacenXLocalModel>
    implements $AlmacenXLocalModelCopyWith<$Res> {
  _$AlmacenXLocalModelCopyWithImpl(this._value, this._then);

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
abstract class _$$AlmacenXLocalModelImplCopyWith<$Res>
    implements $AlmacenXLocalModelCopyWith<$Res> {
  factory _$$AlmacenXLocalModelImplCopyWith(_$AlmacenXLocalModelImpl value,
          $Res Function(_$AlmacenXLocalModelImpl) then) =
      __$$AlmacenXLocalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String name});
}

/// @nodoc
class __$$AlmacenXLocalModelImplCopyWithImpl<$Res>
    extends _$AlmacenXLocalModelCopyWithImpl<$Res, _$AlmacenXLocalModelImpl>
    implements _$$AlmacenXLocalModelImplCopyWith<$Res> {
  __$$AlmacenXLocalModelImplCopyWithImpl(_$AlmacenXLocalModelImpl _value,
      $Res Function(_$AlmacenXLocalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$AlmacenXLocalModelImpl(
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
class _$AlmacenXLocalModelImpl implements _AlmacenXLocalModel {
  _$AlmacenXLocalModelImpl({required this.code, required this.name});

  factory _$AlmacenXLocalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlmacenXLocalModelImplFromJson(json);

  @override
  final int code;
  @override
  final String name;

  @override
  String toString() {
    return 'AlmacenXLocalModel(code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlmacenXLocalModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlmacenXLocalModelImplCopyWith<_$AlmacenXLocalModelImpl> get copyWith =>
      __$$AlmacenXLocalModelImplCopyWithImpl<_$AlmacenXLocalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlmacenXLocalModelImplToJson(
      this,
    );
  }
}

abstract class _AlmacenXLocalModel implements AlmacenXLocalModel {
  factory _AlmacenXLocalModel(
      {required final int code,
      required final String name}) = _$AlmacenXLocalModelImpl;

  factory _AlmacenXLocalModel.fromJson(Map<String, dynamic> json) =
      _$AlmacenXLocalModelImpl.fromJson;

  @override
  int get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$AlmacenXLocalModelImplCopyWith<_$AlmacenXLocalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
