// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_count_results_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListCountResultsModel _$ListCountResultsModelFromJson(
    Map<String, dynamic> json) {
  return _ListCountResultsModel.fromJson(json);
}

/// @nodoc
mixin _$ListCountResultsModel {
  int get codeCountInventory => throw _privateConstructorUsedError;
  int get codeUser => throw _privateConstructorUsedError;
  String get nameUser => throw _privateConstructorUsedError;
  double get quantityCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListCountResultsModelCopyWith<ListCountResultsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCountResultsModelCopyWith<$Res> {
  factory $ListCountResultsModelCopyWith(ListCountResultsModel value,
          $Res Function(ListCountResultsModel) then) =
      _$ListCountResultsModelCopyWithImpl<$Res, ListCountResultsModel>;
  @useResult
  $Res call(
      {int codeCountInventory,
      int codeUser,
      String nameUser,
      double quantityCount});
}

/// @nodoc
class _$ListCountResultsModelCopyWithImpl<$Res,
        $Val extends ListCountResultsModel>
    implements $ListCountResultsModelCopyWith<$Res> {
  _$ListCountResultsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeCountInventory = null,
    Object? codeUser = null,
    Object? nameUser = null,
    Object? quantityCount = null,
  }) {
    return _then(_value.copyWith(
      codeCountInventory: null == codeCountInventory
          ? _value.codeCountInventory
          : codeCountInventory // ignore: cast_nullable_to_non_nullable
              as int,
      codeUser: null == codeUser
          ? _value.codeUser
          : codeUser // ignore: cast_nullable_to_non_nullable
              as int,
      nameUser: null == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String,
      quantityCount: null == quantityCount
          ? _value.quantityCount
          : quantityCount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListCountResultsModelImplCopyWith<$Res>
    implements $ListCountResultsModelCopyWith<$Res> {
  factory _$$ListCountResultsModelImplCopyWith(
          _$ListCountResultsModelImpl value,
          $Res Function(_$ListCountResultsModelImpl) then) =
      __$$ListCountResultsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codeCountInventory,
      int codeUser,
      String nameUser,
      double quantityCount});
}

/// @nodoc
class __$$ListCountResultsModelImplCopyWithImpl<$Res>
    extends _$ListCountResultsModelCopyWithImpl<$Res,
        _$ListCountResultsModelImpl>
    implements _$$ListCountResultsModelImplCopyWith<$Res> {
  __$$ListCountResultsModelImplCopyWithImpl(_$ListCountResultsModelImpl _value,
      $Res Function(_$ListCountResultsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeCountInventory = null,
    Object? codeUser = null,
    Object? nameUser = null,
    Object? quantityCount = null,
  }) {
    return _then(_$ListCountResultsModelImpl(
      codeCountInventory: null == codeCountInventory
          ? _value.codeCountInventory
          : codeCountInventory // ignore: cast_nullable_to_non_nullable
              as int,
      codeUser: null == codeUser
          ? _value.codeUser
          : codeUser // ignore: cast_nullable_to_non_nullable
              as int,
      nameUser: null == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String,
      quantityCount: null == quantityCount
          ? _value.quantityCount
          : quantityCount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListCountResultsModelImpl implements _ListCountResultsModel {
  const _$ListCountResultsModelImpl(
      {required this.codeCountInventory,
      required this.codeUser,
      required this.nameUser,
      required this.quantityCount});

  factory _$ListCountResultsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListCountResultsModelImplFromJson(json);

  @override
  final int codeCountInventory;
  @override
  final int codeUser;
  @override
  final String nameUser;
  @override
  final double quantityCount;

  @override
  String toString() {
    return 'ListCountResultsModel(codeCountInventory: $codeCountInventory, codeUser: $codeUser, nameUser: $nameUser, quantityCount: $quantityCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListCountResultsModelImpl &&
            (identical(other.codeCountInventory, codeCountInventory) ||
                other.codeCountInventory == codeCountInventory) &&
            (identical(other.codeUser, codeUser) ||
                other.codeUser == codeUser) &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            (identical(other.quantityCount, quantityCount) ||
                other.quantityCount == quantityCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, codeCountInventory, codeUser, nameUser, quantityCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListCountResultsModelImplCopyWith<_$ListCountResultsModelImpl>
      get copyWith => __$$ListCountResultsModelImplCopyWithImpl<
          _$ListCountResultsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListCountResultsModelImplToJson(
      this,
    );
  }
}

abstract class _ListCountResultsModel implements ListCountResultsModel {
  const factory _ListCountResultsModel(
      {required final int codeCountInventory,
      required final int codeUser,
      required final String nameUser,
      required final double quantityCount}) = _$ListCountResultsModelImpl;

  factory _ListCountResultsModel.fromJson(Map<String, dynamic> json) =
      _$ListCountResultsModelImpl.fromJson;

  @override
  int get codeCountInventory;
  @override
  int get codeUser;
  @override
  String get nameUser;
  @override
  double get quantityCount;
  @override
  @JsonKey(ignore: true)
  _$$ListCountResultsModelImplCopyWith<_$ListCountResultsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
