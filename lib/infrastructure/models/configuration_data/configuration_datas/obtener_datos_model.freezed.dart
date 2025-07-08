// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obtener_datos_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ObtenerDatosModel _$ObtenerDatosModelFromJson(Map<String, dynamic> json) {
  return _ObtenerDatosModel.fromJson(json);
}

/// @nodoc
mixin _$ObtenerDatosModel {
  List<UnitMeasureModel>? get listUnitMeasure =>
      throw _privateConstructorUsedError;
  List<LineModel> get listLine => throw _privateConstructorUsedError;
  List<GroupModel> get listGroup => throw _privateConstructorUsedError;
  List<SubgroupModel> get listSubGroup => throw _privateConstructorUsedError;
  List<WarehouseModel> get listWarehouse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObtenerDatosModelCopyWith<ObtenerDatosModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObtenerDatosModelCopyWith<$Res> {
  factory $ObtenerDatosModelCopyWith(
          ObtenerDatosModel value, $Res Function(ObtenerDatosModel) then) =
      _$ObtenerDatosModelCopyWithImpl<$Res, ObtenerDatosModel>;
  @useResult
  $Res call(
      {List<UnitMeasureModel>? listUnitMeasure,
      List<LineModel> listLine,
      List<GroupModel> listGroup,
      List<SubgroupModel> listSubGroup,
      List<WarehouseModel> listWarehouse});
}

/// @nodoc
class _$ObtenerDatosModelCopyWithImpl<$Res, $Val extends ObtenerDatosModel>
    implements $ObtenerDatosModelCopyWith<$Res> {
  _$ObtenerDatosModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listUnitMeasure = freezed,
    Object? listLine = null,
    Object? listGroup = null,
    Object? listSubGroup = null,
    Object? listWarehouse = null,
  }) {
    return _then(_value.copyWith(
      listUnitMeasure: freezed == listUnitMeasure
          ? _value.listUnitMeasure
          : listUnitMeasure // ignore: cast_nullable_to_non_nullable
              as List<UnitMeasureModel>?,
      listLine: null == listLine
          ? _value.listLine
          : listLine // ignore: cast_nullable_to_non_nullable
              as List<LineModel>,
      listGroup: null == listGroup
          ? _value.listGroup
          : listGroup // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
      listSubGroup: null == listSubGroup
          ? _value.listSubGroup
          : listSubGroup // ignore: cast_nullable_to_non_nullable
              as List<SubgroupModel>,
      listWarehouse: null == listWarehouse
          ? _value.listWarehouse
          : listWarehouse // ignore: cast_nullable_to_non_nullable
              as List<WarehouseModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObtenerDatosModelImplCopyWith<$Res>
    implements $ObtenerDatosModelCopyWith<$Res> {
  factory _$$ObtenerDatosModelImplCopyWith(_$ObtenerDatosModelImpl value,
          $Res Function(_$ObtenerDatosModelImpl) then) =
      __$$ObtenerDatosModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UnitMeasureModel>? listUnitMeasure,
      List<LineModel> listLine,
      List<GroupModel> listGroup,
      List<SubgroupModel> listSubGroup,
      List<WarehouseModel> listWarehouse});
}

/// @nodoc
class __$$ObtenerDatosModelImplCopyWithImpl<$Res>
    extends _$ObtenerDatosModelCopyWithImpl<$Res, _$ObtenerDatosModelImpl>
    implements _$$ObtenerDatosModelImplCopyWith<$Res> {
  __$$ObtenerDatosModelImplCopyWithImpl(_$ObtenerDatosModelImpl _value,
      $Res Function(_$ObtenerDatosModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listUnitMeasure = freezed,
    Object? listLine = null,
    Object? listGroup = null,
    Object? listSubGroup = null,
    Object? listWarehouse = null,
  }) {
    return _then(_$ObtenerDatosModelImpl(
      listUnitMeasure: freezed == listUnitMeasure
          ? _value._listUnitMeasure
          : listUnitMeasure // ignore: cast_nullable_to_non_nullable
              as List<UnitMeasureModel>?,
      listLine: null == listLine
          ? _value._listLine
          : listLine // ignore: cast_nullable_to_non_nullable
              as List<LineModel>,
      listGroup: null == listGroup
          ? _value._listGroup
          : listGroup // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
      listSubGroup: null == listSubGroup
          ? _value._listSubGroup
          : listSubGroup // ignore: cast_nullable_to_non_nullable
              as List<SubgroupModel>,
      listWarehouse: null == listWarehouse
          ? _value._listWarehouse
          : listWarehouse // ignore: cast_nullable_to_non_nullable
              as List<WarehouseModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObtenerDatosModelImpl implements _ObtenerDatosModel {
  _$ObtenerDatosModelImpl(
      {final List<UnitMeasureModel>? listUnitMeasure,
      required final List<LineModel> listLine,
      required final List<GroupModel> listGroup,
      required final List<SubgroupModel> listSubGroup,
      required final List<WarehouseModel> listWarehouse})
      : _listUnitMeasure = listUnitMeasure,
        _listLine = listLine,
        _listGroup = listGroup,
        _listSubGroup = listSubGroup,
        _listWarehouse = listWarehouse;

  factory _$ObtenerDatosModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObtenerDatosModelImplFromJson(json);

  final List<UnitMeasureModel>? _listUnitMeasure;
  @override
  List<UnitMeasureModel>? get listUnitMeasure {
    final value = _listUnitMeasure;
    if (value == null) return null;
    if (_listUnitMeasure is EqualUnmodifiableListView) return _listUnitMeasure;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LineModel> _listLine;
  @override
  List<LineModel> get listLine {
    if (_listLine is EqualUnmodifiableListView) return _listLine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listLine);
  }

  final List<GroupModel> _listGroup;
  @override
  List<GroupModel> get listGroup {
    if (_listGroup is EqualUnmodifiableListView) return _listGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listGroup);
  }

  final List<SubgroupModel> _listSubGroup;
  @override
  List<SubgroupModel> get listSubGroup {
    if (_listSubGroup is EqualUnmodifiableListView) return _listSubGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listSubGroup);
  }

  final List<WarehouseModel> _listWarehouse;
  @override
  List<WarehouseModel> get listWarehouse {
    if (_listWarehouse is EqualUnmodifiableListView) return _listWarehouse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listWarehouse);
  }

  @override
  String toString() {
    return 'ObtenerDatosModel(listUnitMeasure: $listUnitMeasure, listLine: $listLine, listGroup: $listGroup, listSubGroup: $listSubGroup, listWarehouse: $listWarehouse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObtenerDatosModelImpl &&
            const DeepCollectionEquality()
                .equals(other._listUnitMeasure, _listUnitMeasure) &&
            const DeepCollectionEquality().equals(other._listLine, _listLine) &&
            const DeepCollectionEquality()
                .equals(other._listGroup, _listGroup) &&
            const DeepCollectionEquality()
                .equals(other._listSubGroup, _listSubGroup) &&
            const DeepCollectionEquality()
                .equals(other._listWarehouse, _listWarehouse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listUnitMeasure),
      const DeepCollectionEquality().hash(_listLine),
      const DeepCollectionEquality().hash(_listGroup),
      const DeepCollectionEquality().hash(_listSubGroup),
      const DeepCollectionEquality().hash(_listWarehouse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObtenerDatosModelImplCopyWith<_$ObtenerDatosModelImpl> get copyWith =>
      __$$ObtenerDatosModelImplCopyWithImpl<_$ObtenerDatosModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObtenerDatosModelImplToJson(
      this,
    );
  }
}

abstract class _ObtenerDatosModel implements ObtenerDatosModel {
  factory _ObtenerDatosModel(
          {final List<UnitMeasureModel>? listUnitMeasure,
          required final List<LineModel> listLine,
          required final List<GroupModel> listGroup,
          required final List<SubgroupModel> listSubGroup,
          required final List<WarehouseModel> listWarehouse}) =
      _$ObtenerDatosModelImpl;

  factory _ObtenerDatosModel.fromJson(Map<String, dynamic> json) =
      _$ObtenerDatosModelImpl.fromJson;

  @override
  List<UnitMeasureModel>? get listUnitMeasure;
  @override
  List<LineModel> get listLine;
  @override
  List<GroupModel> get listGroup;
  @override
  List<SubgroupModel> get listSubGroup;
  @override
  List<WarehouseModel> get listWarehouse;
  @override
  @JsonKey(ignore: true)
  _$$ObtenerDatosModelImplCopyWith<_$ObtenerDatosModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
