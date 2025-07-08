// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageCountModel _$ImageCountModelFromJson(Map<String, dynamic> json) {
  return _ImageCountModel.fromJson(json);
}

/// @nodoc
mixin _$ImageCountModel {
  String get codeProduct => throw _privateConstructorUsedError;
  int get codeCountInventory => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get observation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCountModelCopyWith<ImageCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCountModelCopyWith<$Res> {
  factory $ImageCountModelCopyWith(
          ImageCountModel value, $Res Function(ImageCountModel) then) =
      _$ImageCountModelCopyWithImpl<$Res, ImageCountModel>;
  @useResult
  $Res call(
      {String codeProduct,
      int codeCountInventory,
      String image,
      String observation});
}

/// @nodoc
class _$ImageCountModelCopyWithImpl<$Res, $Val extends ImageCountModel>
    implements $ImageCountModelCopyWith<$Res> {
  _$ImageCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeProduct = null,
    Object? codeCountInventory = null,
    Object? image = null,
    Object? observation = null,
  }) {
    return _then(_value.copyWith(
      codeProduct: null == codeProduct
          ? _value.codeProduct
          : codeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      codeCountInventory: null == codeCountInventory
          ? _value.codeCountInventory
          : codeCountInventory // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageCountModelImplCopyWith<$Res>
    implements $ImageCountModelCopyWith<$Res> {
  factory _$$ImageCountModelImplCopyWith(_$ImageCountModelImpl value,
          $Res Function(_$ImageCountModelImpl) then) =
      __$$ImageCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String codeProduct,
      int codeCountInventory,
      String image,
      String observation});
}

/// @nodoc
class __$$ImageCountModelImplCopyWithImpl<$Res>
    extends _$ImageCountModelCopyWithImpl<$Res, _$ImageCountModelImpl>
    implements _$$ImageCountModelImplCopyWith<$Res> {
  __$$ImageCountModelImplCopyWithImpl(
      _$ImageCountModelImpl _value, $Res Function(_$ImageCountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeProduct = null,
    Object? codeCountInventory = null,
    Object? image = null,
    Object? observation = null,
  }) {
    return _then(_$ImageCountModelImpl(
      codeProduct: null == codeProduct
          ? _value.codeProduct
          : codeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      codeCountInventory: null == codeCountInventory
          ? _value.codeCountInventory
          : codeCountInventory // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageCountModelImpl implements _ImageCountModel {
  _$ImageCountModelImpl(
      {required this.codeProduct,
      required this.codeCountInventory,
      required this.image,
      required this.observation});

  factory _$ImageCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageCountModelImplFromJson(json);

  @override
  final String codeProduct;
  @override
  final int codeCountInventory;
  @override
  final String image;
  @override
  final String observation;

  @override
  String toString() {
    return 'ImageCountModel(codeProduct: $codeProduct, codeCountInventory: $codeCountInventory, image: $image, observation: $observation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageCountModelImpl &&
            (identical(other.codeProduct, codeProduct) ||
                other.codeProduct == codeProduct) &&
            (identical(other.codeCountInventory, codeCountInventory) ||
                other.codeCountInventory == codeCountInventory) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.observation, observation) ||
                other.observation == observation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, codeProduct, codeCountInventory, image, observation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageCountModelImplCopyWith<_$ImageCountModelImpl> get copyWith =>
      __$$ImageCountModelImplCopyWithImpl<_$ImageCountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageCountModelImplToJson(
      this,
    );
  }
}

abstract class _ImageCountModel implements ImageCountModel {
  factory _ImageCountModel(
      {required final String codeProduct,
      required final int codeCountInventory,
      required final String image,
      required final String observation}) = _$ImageCountModelImpl;

  factory _ImageCountModel.fromJson(Map<String, dynamic> json) =
      _$ImageCountModelImpl.fromJson;

  @override
  String get codeProduct;
  @override
  int get codeCountInventory;
  @override
  String get image;
  @override
  String get observation;
  @override
  @JsonKey(ignore: true)
  _$$ImageCountModelImplCopyWith<_$ImageCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
