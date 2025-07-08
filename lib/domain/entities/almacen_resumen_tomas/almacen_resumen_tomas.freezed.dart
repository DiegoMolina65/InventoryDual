// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'almacen_resumen_tomas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlmacenResumenTomas _$AlmacenResumenTomasFromJson(Map<String, dynamic> json) {
  return _AlmacenResumenTomas.fromJson(json);
}

/// @nodoc
mixin _$AlmacenResumenTomas {
  AlmacenXLocal get almacen => throw _privateConstructorUsedError;
  int get pendientes => throw _privateConstructorUsedError;
  int get contando => throw _privateConstructorUsedError;
  int get finalizados => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlmacenResumenTomasCopyWith<AlmacenResumenTomas> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlmacenResumenTomasCopyWith<$Res> {
  factory $AlmacenResumenTomasCopyWith(
          AlmacenResumenTomas value, $Res Function(AlmacenResumenTomas) then) =
      _$AlmacenResumenTomasCopyWithImpl<$Res, AlmacenResumenTomas>;
  @useResult
  $Res call(
      {AlmacenXLocal almacen, int pendientes, int contando, int finalizados});

  $AlmacenXLocalCopyWith<$Res> get almacen;
}

/// @nodoc
class _$AlmacenResumenTomasCopyWithImpl<$Res, $Val extends AlmacenResumenTomas>
    implements $AlmacenResumenTomasCopyWith<$Res> {
  _$AlmacenResumenTomasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? almacen = null,
    Object? pendientes = null,
    Object? contando = null,
    Object? finalizados = null,
  }) {
    return _then(_value.copyWith(
      almacen: null == almacen
          ? _value.almacen
          : almacen // ignore: cast_nullable_to_non_nullable
              as AlmacenXLocal,
      pendientes: null == pendientes
          ? _value.pendientes
          : pendientes // ignore: cast_nullable_to_non_nullable
              as int,
      contando: null == contando
          ? _value.contando
          : contando // ignore: cast_nullable_to_non_nullable
              as int,
      finalizados: null == finalizados
          ? _value.finalizados
          : finalizados // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlmacenXLocalCopyWith<$Res> get almacen {
    return $AlmacenXLocalCopyWith<$Res>(_value.almacen, (value) {
      return _then(_value.copyWith(almacen: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlmacenResumenTomasImplCopyWith<$Res>
    implements $AlmacenResumenTomasCopyWith<$Res> {
  factory _$$AlmacenResumenTomasImplCopyWith(_$AlmacenResumenTomasImpl value,
          $Res Function(_$AlmacenResumenTomasImpl) then) =
      __$$AlmacenResumenTomasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AlmacenXLocal almacen, int pendientes, int contando, int finalizados});

  @override
  $AlmacenXLocalCopyWith<$Res> get almacen;
}

/// @nodoc
class __$$AlmacenResumenTomasImplCopyWithImpl<$Res>
    extends _$AlmacenResumenTomasCopyWithImpl<$Res, _$AlmacenResumenTomasImpl>
    implements _$$AlmacenResumenTomasImplCopyWith<$Res> {
  __$$AlmacenResumenTomasImplCopyWithImpl(_$AlmacenResumenTomasImpl _value,
      $Res Function(_$AlmacenResumenTomasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? almacen = null,
    Object? pendientes = null,
    Object? contando = null,
    Object? finalizados = null,
  }) {
    return _then(_$AlmacenResumenTomasImpl(
      almacen: null == almacen
          ? _value.almacen
          : almacen // ignore: cast_nullable_to_non_nullable
              as AlmacenXLocal,
      pendientes: null == pendientes
          ? _value.pendientes
          : pendientes // ignore: cast_nullable_to_non_nullable
              as int,
      contando: null == contando
          ? _value.contando
          : contando // ignore: cast_nullable_to_non_nullable
              as int,
      finalizados: null == finalizados
          ? _value.finalizados
          : finalizados // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlmacenResumenTomasImpl implements _AlmacenResumenTomas {
  _$AlmacenResumenTomasImpl(
      {required this.almacen,
      required this.pendientes,
      required this.contando,
      required this.finalizados});

  factory _$AlmacenResumenTomasImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlmacenResumenTomasImplFromJson(json);

  @override
  final AlmacenXLocal almacen;
  @override
  final int pendientes;
  @override
  final int contando;
  @override
  final int finalizados;

  @override
  String toString() {
    return 'AlmacenResumenTomas(almacen: $almacen, pendientes: $pendientes, contando: $contando, finalizados: $finalizados)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlmacenResumenTomasImpl &&
            (identical(other.almacen, almacen) || other.almacen == almacen) &&
            (identical(other.pendientes, pendientes) ||
                other.pendientes == pendientes) &&
            (identical(other.contando, contando) ||
                other.contando == contando) &&
            (identical(other.finalizados, finalizados) ||
                other.finalizados == finalizados));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, almacen, pendientes, contando, finalizados);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlmacenResumenTomasImplCopyWith<_$AlmacenResumenTomasImpl> get copyWith =>
      __$$AlmacenResumenTomasImplCopyWithImpl<_$AlmacenResumenTomasImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlmacenResumenTomasImplToJson(
      this,
    );
  }
}

abstract class _AlmacenResumenTomas implements AlmacenResumenTomas {
  factory _AlmacenResumenTomas(
      {required final AlmacenXLocal almacen,
      required final int pendientes,
      required final int contando,
      required final int finalizados}) = _$AlmacenResumenTomasImpl;

  factory _AlmacenResumenTomas.fromJson(Map<String, dynamic> json) =
      _$AlmacenResumenTomasImpl.fromJson;

  @override
  AlmacenXLocal get almacen;
  @override
  int get pendientes;
  @override
  int get contando;
  @override
  int get finalizados;
  @override
  @JsonKey(ignore: true)
  _$$AlmacenResumenTomasImplCopyWith<_$AlmacenResumenTomasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
