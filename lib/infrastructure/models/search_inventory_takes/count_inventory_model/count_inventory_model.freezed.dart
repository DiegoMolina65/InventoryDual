// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountInventoryModel _$CountInventoryModelFromJson(Map<String, dynamic> json) {
  return _CountInventoryModel.fromJson(json);
}

/// @nodoc
mixin _$CountInventoryModel {
  int get code => throw _privateConstructorUsedError;
  int get numberCount => throw _privateConstructorUsedError;
  int get codeTI => throw _privateConstructorUsedError;
  int get codeWarehouse => throw _privateConstructorUsedError;
  int get codeUserAsigned => throw _privateConstructorUsedError;
  DateTime get dateCreation => throw _privateConstructorUsedError;
  DateTime get dateStart => throw _privateConstructorUsedError;
  DateTime get dateEnd => throw _privateConstructorUsedError;
  String get statusCount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get nameTakeInventory => throw _privateConstructorUsedError;
  String? get workShift => throw _privateConstructorUsedError;
  List<CountInventoryDetailModel> get lstCountInventoryDetail =>
      throw _privateConstructorUsedError;
  Usuario? get usuarioAsignado => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountInventoryModelCopyWith<CountInventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountInventoryModelCopyWith<$Res> {
  factory $CountInventoryModelCopyWith(
          CountInventoryModel value, $Res Function(CountInventoryModel) then) =
      _$CountInventoryModelCopyWithImpl<$Res, CountInventoryModel>;
  @useResult
  $Res call(
      {int code,
      int numberCount,
      int codeTI,
      int codeWarehouse,
      int codeUserAsigned,
      DateTime dateCreation,
      DateTime dateStart,
      DateTime dateEnd,
      String statusCount,
      String type,
      String nameTakeInventory,
      String? workShift,
      List<CountInventoryDetailModel> lstCountInventoryDetail,
      Usuario? usuarioAsignado});

  $UsuarioCopyWith<$Res>? get usuarioAsignado;
}

/// @nodoc
class _$CountInventoryModelCopyWithImpl<$Res, $Val extends CountInventoryModel>
    implements $CountInventoryModelCopyWith<$Res> {
  _$CountInventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? numberCount = null,
    Object? codeTI = null,
    Object? codeWarehouse = null,
    Object? codeUserAsigned = null,
    Object? dateCreation = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? statusCount = null,
    Object? type = null,
    Object? nameTakeInventory = null,
    Object? workShift = freezed,
    Object? lstCountInventoryDetail = null,
    Object? usuarioAsignado = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      numberCount: null == numberCount
          ? _value.numberCount
          : numberCount // ignore: cast_nullable_to_non_nullable
              as int,
      codeTI: null == codeTI
          ? _value.codeTI
          : codeTI // ignore: cast_nullable_to_non_nullable
              as int,
      codeWarehouse: null == codeWarehouse
          ? _value.codeWarehouse
          : codeWarehouse // ignore: cast_nullable_to_non_nullable
              as int,
      codeUserAsigned: null == codeUserAsigned
          ? _value.codeUserAsigned
          : codeUserAsigned // ignore: cast_nullable_to_non_nullable
              as int,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusCount: null == statusCount
          ? _value.statusCount
          : statusCount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      nameTakeInventory: null == nameTakeInventory
          ? _value.nameTakeInventory
          : nameTakeInventory // ignore: cast_nullable_to_non_nullable
              as String,
      workShift: freezed == workShift
          ? _value.workShift
          : workShift // ignore: cast_nullable_to_non_nullable
              as String?,
      lstCountInventoryDetail: null == lstCountInventoryDetail
          ? _value.lstCountInventoryDetail
          : lstCountInventoryDetail // ignore: cast_nullable_to_non_nullable
              as List<CountInventoryDetailModel>,
      usuarioAsignado: freezed == usuarioAsignado
          ? _value.usuarioAsignado
          : usuarioAsignado // ignore: cast_nullable_to_non_nullable
              as Usuario?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioCopyWith<$Res>? get usuarioAsignado {
    if (_value.usuarioAsignado == null) {
      return null;
    }

    return $UsuarioCopyWith<$Res>(_value.usuarioAsignado!, (value) {
      return _then(_value.copyWith(usuarioAsignado: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CountInventoryModelImplCopyWith<$Res>
    implements $CountInventoryModelCopyWith<$Res> {
  factory _$$CountInventoryModelImplCopyWith(_$CountInventoryModelImpl value,
          $Res Function(_$CountInventoryModelImpl) then) =
      __$$CountInventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int code,
      int numberCount,
      int codeTI,
      int codeWarehouse,
      int codeUserAsigned,
      DateTime dateCreation,
      DateTime dateStart,
      DateTime dateEnd,
      String statusCount,
      String type,
      String nameTakeInventory,
      String? workShift,
      List<CountInventoryDetailModel> lstCountInventoryDetail,
      Usuario? usuarioAsignado});

  @override
  $UsuarioCopyWith<$Res>? get usuarioAsignado;
}

/// @nodoc
class __$$CountInventoryModelImplCopyWithImpl<$Res>
    extends _$CountInventoryModelCopyWithImpl<$Res, _$CountInventoryModelImpl>
    implements _$$CountInventoryModelImplCopyWith<$Res> {
  __$$CountInventoryModelImplCopyWithImpl(_$CountInventoryModelImpl _value,
      $Res Function(_$CountInventoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? numberCount = null,
    Object? codeTI = null,
    Object? codeWarehouse = null,
    Object? codeUserAsigned = null,
    Object? dateCreation = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? statusCount = null,
    Object? type = null,
    Object? nameTakeInventory = null,
    Object? workShift = freezed,
    Object? lstCountInventoryDetail = null,
    Object? usuarioAsignado = freezed,
  }) {
    return _then(_$CountInventoryModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      numberCount: null == numberCount
          ? _value.numberCount
          : numberCount // ignore: cast_nullable_to_non_nullable
              as int,
      codeTI: null == codeTI
          ? _value.codeTI
          : codeTI // ignore: cast_nullable_to_non_nullable
              as int,
      codeWarehouse: null == codeWarehouse
          ? _value.codeWarehouse
          : codeWarehouse // ignore: cast_nullable_to_non_nullable
              as int,
      codeUserAsigned: null == codeUserAsigned
          ? _value.codeUserAsigned
          : codeUserAsigned // ignore: cast_nullable_to_non_nullable
              as int,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusCount: null == statusCount
          ? _value.statusCount
          : statusCount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      nameTakeInventory: null == nameTakeInventory
          ? _value.nameTakeInventory
          : nameTakeInventory // ignore: cast_nullable_to_non_nullable
              as String,
      workShift: freezed == workShift
          ? _value.workShift
          : workShift // ignore: cast_nullable_to_non_nullable
              as String?,
      lstCountInventoryDetail: null == lstCountInventoryDetail
          ? _value._lstCountInventoryDetail
          : lstCountInventoryDetail // ignore: cast_nullable_to_non_nullable
              as List<CountInventoryDetailModel>,
      usuarioAsignado: freezed == usuarioAsignado
          ? _value.usuarioAsignado
          : usuarioAsignado // ignore: cast_nullable_to_non_nullable
              as Usuario?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountInventoryModelImpl implements _CountInventoryModel {
  _$CountInventoryModelImpl(
      {required this.code,
      required this.numberCount,
      required this.codeTI,
      required this.codeWarehouse,
      required this.codeUserAsigned,
      required this.dateCreation,
      required this.dateStart,
      required this.dateEnd,
      required this.statusCount,
      required this.type,
      required this.nameTakeInventory,
      required this.workShift,
      required final List<CountInventoryDetailModel> lstCountInventoryDetail,
      required this.usuarioAsignado})
      : _lstCountInventoryDetail = lstCountInventoryDetail;

  factory _$CountInventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountInventoryModelImplFromJson(json);

  @override
  final int code;
  @override
  final int numberCount;
  @override
  final int codeTI;
  @override
  final int codeWarehouse;
  @override
  final int codeUserAsigned;
  @override
  final DateTime dateCreation;
  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;
  @override
  final String statusCount;
  @override
  final String type;
  @override
  final String nameTakeInventory;
  @override
  final String? workShift;
  final List<CountInventoryDetailModel> _lstCountInventoryDetail;
  @override
  List<CountInventoryDetailModel> get lstCountInventoryDetail {
    if (_lstCountInventoryDetail is EqualUnmodifiableListView)
      return _lstCountInventoryDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstCountInventoryDetail);
  }

  @override
  final Usuario? usuarioAsignado;

  @override
  String toString() {
    return 'CountInventoryModel(code: $code, numberCount: $numberCount, codeTI: $codeTI, codeWarehouse: $codeWarehouse, codeUserAsigned: $codeUserAsigned, dateCreation: $dateCreation, dateStart: $dateStart, dateEnd: $dateEnd, statusCount: $statusCount, type: $type, nameTakeInventory: $nameTakeInventory, workShift: $workShift, lstCountInventoryDetail: $lstCountInventoryDetail, usuarioAsignado: $usuarioAsignado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountInventoryModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.numberCount, numberCount) ||
                other.numberCount == numberCount) &&
            (identical(other.codeTI, codeTI) || other.codeTI == codeTI) &&
            (identical(other.codeWarehouse, codeWarehouse) ||
                other.codeWarehouse == codeWarehouse) &&
            (identical(other.codeUserAsigned, codeUserAsigned) ||
                other.codeUserAsigned == codeUserAsigned) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.statusCount, statusCount) ||
                other.statusCount == statusCount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nameTakeInventory, nameTakeInventory) ||
                other.nameTakeInventory == nameTakeInventory) &&
            (identical(other.workShift, workShift) ||
                other.workShift == workShift) &&
            const DeepCollectionEquality().equals(
                other._lstCountInventoryDetail, _lstCountInventoryDetail) &&
            (identical(other.usuarioAsignado, usuarioAsignado) ||
                other.usuarioAsignado == usuarioAsignado));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      numberCount,
      codeTI,
      codeWarehouse,
      codeUserAsigned,
      dateCreation,
      dateStart,
      dateEnd,
      statusCount,
      type,
      nameTakeInventory,
      workShift,
      const DeepCollectionEquality().hash(_lstCountInventoryDetail),
      usuarioAsignado);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountInventoryModelImplCopyWith<_$CountInventoryModelImpl> get copyWith =>
      __$$CountInventoryModelImplCopyWithImpl<_$CountInventoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountInventoryModelImplToJson(
      this,
    );
  }
}

abstract class _CountInventoryModel implements CountInventoryModel {
  factory _CountInventoryModel(
      {required final int code,
      required final int numberCount,
      required final int codeTI,
      required final int codeWarehouse,
      required final int codeUserAsigned,
      required final DateTime dateCreation,
      required final DateTime dateStart,
      required final DateTime dateEnd,
      required final String statusCount,
      required final String type,
      required final String nameTakeInventory,
      required final String? workShift,
      required final List<CountInventoryDetailModel> lstCountInventoryDetail,
      required final Usuario? usuarioAsignado}) = _$CountInventoryModelImpl;

  factory _CountInventoryModel.fromJson(Map<String, dynamic> json) =
      _$CountInventoryModelImpl.fromJson;

  @override
  int get code;
  @override
  int get numberCount;
  @override
  int get codeTI;
  @override
  int get codeWarehouse;
  @override
  int get codeUserAsigned;
  @override
  DateTime get dateCreation;
  @override
  DateTime get dateStart;
  @override
  DateTime get dateEnd;
  @override
  String get statusCount;
  @override
  String get type;
  @override
  String get nameTakeInventory;
  @override
  String? get workShift;
  @override
  List<CountInventoryDetailModel> get lstCountInventoryDetail;
  @override
  Usuario? get usuarioAsignado;
  @override
  @JsonKey(ignore: true)
  _$$CountInventoryModelImplCopyWith<_$CountInventoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
