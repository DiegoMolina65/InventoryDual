// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return _Usuario.fromJson(json);
}

/// @nodoc
mixin _$Usuario {
  int get codigo => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_local')
  int get codigoLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombre_local')
  String get nombreLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_almacen')
  int get codigoAlmacen => throw _privateConstructorUsedError;
  String get usuario => throw _privateConstructorUsedError;
  String get contrasenia => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_lista_precios')
  int get codigoListaPrecios => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_moneda')
  int get codigoMoneda => throw _privateConstructorUsedError;
  @JsonKey(name: 'valor_moneda')
  double get valorMoneda => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombre_cliente_predeterminado')
  String get nombreClientePredeterminado => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_cliente_predeterminado')
  int get codigoClientePredeterminado => throw _privateConstructorUsedError;
  @JsonKey(name: 'es_supervisor')
  bool get esSupervisor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioCopyWith<Usuario> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioCopyWith<$Res> {
  factory $UsuarioCopyWith(Usuario value, $Res Function(Usuario) then) =
      _$UsuarioCopyWithImpl<$Res, Usuario>;
  @useResult
  $Res call(
      {int codigo,
      String nombre,
      @JsonKey(name: 'codigo_local') int codigoLocal,
      @JsonKey(name: 'nombre_local') String nombreLocal,
      @JsonKey(name: 'codigo_almacen') int codigoAlmacen,
      String usuario,
      String contrasenia,
      @JsonKey(name: 'codigo_lista_precios') int codigoListaPrecios,
      @JsonKey(name: 'codigo_moneda') int codigoMoneda,
      @JsonKey(name: 'valor_moneda') double valorMoneda,
      @JsonKey(name: 'nombre_cliente_predeterminado')
      String nombreClientePredeterminado,
      @JsonKey(name: 'codigo_cliente_predeterminado')
      int codigoClientePredeterminado,
      @JsonKey(name: 'es_supervisor') bool esSupervisor});
}

/// @nodoc
class _$UsuarioCopyWithImpl<$Res, $Val extends Usuario>
    implements $UsuarioCopyWith<$Res> {
  _$UsuarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
    Object? codigoLocal = null,
    Object? nombreLocal = null,
    Object? codigoAlmacen = null,
    Object? usuario = null,
    Object? contrasenia = null,
    Object? codigoListaPrecios = null,
    Object? codigoMoneda = null,
    Object? valorMoneda = null,
    Object? nombreClientePredeterminado = null,
    Object? codigoClientePredeterminado = null,
    Object? esSupervisor = null,
  }) {
    return _then(_value.copyWith(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      codigoLocal: null == codigoLocal
          ? _value.codigoLocal
          : codigoLocal // ignore: cast_nullable_to_non_nullable
              as int,
      nombreLocal: null == nombreLocal
          ? _value.nombreLocal
          : nombreLocal // ignore: cast_nullable_to_non_nullable
              as String,
      codigoAlmacen: null == codigoAlmacen
          ? _value.codigoAlmacen
          : codigoAlmacen // ignore: cast_nullable_to_non_nullable
              as int,
      usuario: null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String,
      contrasenia: null == contrasenia
          ? _value.contrasenia
          : contrasenia // ignore: cast_nullable_to_non_nullable
              as String,
      codigoListaPrecios: null == codigoListaPrecios
          ? _value.codigoListaPrecios
          : codigoListaPrecios // ignore: cast_nullable_to_non_nullable
              as int,
      codigoMoneda: null == codigoMoneda
          ? _value.codigoMoneda
          : codigoMoneda // ignore: cast_nullable_to_non_nullable
              as int,
      valorMoneda: null == valorMoneda
          ? _value.valorMoneda
          : valorMoneda // ignore: cast_nullable_to_non_nullable
              as double,
      nombreClientePredeterminado: null == nombreClientePredeterminado
          ? _value.nombreClientePredeterminado
          : nombreClientePredeterminado // ignore: cast_nullable_to_non_nullable
              as String,
      codigoClientePredeterminado: null == codigoClientePredeterminado
          ? _value.codigoClientePredeterminado
          : codigoClientePredeterminado // ignore: cast_nullable_to_non_nullable
              as int,
      esSupervisor: null == esSupervisor
          ? _value.esSupervisor
          : esSupervisor // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioImplCopyWith<$Res> implements $UsuarioCopyWith<$Res> {
  factory _$$UsuarioImplCopyWith(
          _$UsuarioImpl value, $Res Function(_$UsuarioImpl) then) =
      __$$UsuarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codigo,
      String nombre,
      @JsonKey(name: 'codigo_local') int codigoLocal,
      @JsonKey(name: 'nombre_local') String nombreLocal,
      @JsonKey(name: 'codigo_almacen') int codigoAlmacen,
      String usuario,
      String contrasenia,
      @JsonKey(name: 'codigo_lista_precios') int codigoListaPrecios,
      @JsonKey(name: 'codigo_moneda') int codigoMoneda,
      @JsonKey(name: 'valor_moneda') double valorMoneda,
      @JsonKey(name: 'nombre_cliente_predeterminado')
      String nombreClientePredeterminado,
      @JsonKey(name: 'codigo_cliente_predeterminado')
      int codigoClientePredeterminado,
      @JsonKey(name: 'es_supervisor') bool esSupervisor});
}

/// @nodoc
class __$$UsuarioImplCopyWithImpl<$Res>
    extends _$UsuarioCopyWithImpl<$Res, _$UsuarioImpl>
    implements _$$UsuarioImplCopyWith<$Res> {
  __$$UsuarioImplCopyWithImpl(
      _$UsuarioImpl _value, $Res Function(_$UsuarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = null,
    Object? nombre = null,
    Object? codigoLocal = null,
    Object? nombreLocal = null,
    Object? codigoAlmacen = null,
    Object? usuario = null,
    Object? contrasenia = null,
    Object? codigoListaPrecios = null,
    Object? codigoMoneda = null,
    Object? valorMoneda = null,
    Object? nombreClientePredeterminado = null,
    Object? codigoClientePredeterminado = null,
    Object? esSupervisor = null,
  }) {
    return _then(_$UsuarioImpl(
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      codigoLocal: null == codigoLocal
          ? _value.codigoLocal
          : codigoLocal // ignore: cast_nullable_to_non_nullable
              as int,
      nombreLocal: null == nombreLocal
          ? _value.nombreLocal
          : nombreLocal // ignore: cast_nullable_to_non_nullable
              as String,
      codigoAlmacen: null == codigoAlmacen
          ? _value.codigoAlmacen
          : codigoAlmacen // ignore: cast_nullable_to_non_nullable
              as int,
      usuario: null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String,
      contrasenia: null == contrasenia
          ? _value.contrasenia
          : contrasenia // ignore: cast_nullable_to_non_nullable
              as String,
      codigoListaPrecios: null == codigoListaPrecios
          ? _value.codigoListaPrecios
          : codigoListaPrecios // ignore: cast_nullable_to_non_nullable
              as int,
      codigoMoneda: null == codigoMoneda
          ? _value.codigoMoneda
          : codigoMoneda // ignore: cast_nullable_to_non_nullable
              as int,
      valorMoneda: null == valorMoneda
          ? _value.valorMoneda
          : valorMoneda // ignore: cast_nullable_to_non_nullable
              as double,
      nombreClientePredeterminado: null == nombreClientePredeterminado
          ? _value.nombreClientePredeterminado
          : nombreClientePredeterminado // ignore: cast_nullable_to_non_nullable
              as String,
      codigoClientePredeterminado: null == codigoClientePredeterminado
          ? _value.codigoClientePredeterminado
          : codigoClientePredeterminado // ignore: cast_nullable_to_non_nullable
              as int,
      esSupervisor: null == esSupervisor
          ? _value.esSupervisor
          : esSupervisor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioImpl implements _Usuario {
  _$UsuarioImpl(
      {required this.codigo,
      required this.nombre,
      @JsonKey(name: 'codigo_local') required this.codigoLocal,
      @JsonKey(name: 'nombre_local') required this.nombreLocal,
      @JsonKey(name: 'codigo_almacen') required this.codigoAlmacen,
      required this.usuario,
      required this.contrasenia,
      @JsonKey(name: 'codigo_lista_precios') required this.codigoListaPrecios,
      @JsonKey(name: 'codigo_moneda') required this.codigoMoneda,
      @JsonKey(name: 'valor_moneda') required this.valorMoneda,
      @JsonKey(name: 'nombre_cliente_predeterminado')
      required this.nombreClientePredeterminado,
      @JsonKey(name: 'codigo_cliente_predeterminado')
      required this.codigoClientePredeterminado,
      @JsonKey(name: 'es_supervisor') required this.esSupervisor});

  factory _$UsuarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioImplFromJson(json);

  @override
  final int codigo;
  @override
  final String nombre;
  @override
  @JsonKey(name: 'codigo_local')
  final int codigoLocal;
  @override
  @JsonKey(name: 'nombre_local')
  final String nombreLocal;
  @override
  @JsonKey(name: 'codigo_almacen')
  final int codigoAlmacen;
  @override
  final String usuario;
  @override
  final String contrasenia;
  @override
  @JsonKey(name: 'codigo_lista_precios')
  final int codigoListaPrecios;
  @override
  @JsonKey(name: 'codigo_moneda')
  final int codigoMoneda;
  @override
  @JsonKey(name: 'valor_moneda')
  final double valorMoneda;
  @override
  @JsonKey(name: 'nombre_cliente_predeterminado')
  final String nombreClientePredeterminado;
  @override
  @JsonKey(name: 'codigo_cliente_predeterminado')
  final int codigoClientePredeterminado;
  @override
  @JsonKey(name: 'es_supervisor')
  final bool esSupervisor;

  @override
  String toString() {
    return 'Usuario(codigo: $codigo, nombre: $nombre, codigoLocal: $codigoLocal, nombreLocal: $nombreLocal, codigoAlmacen: $codigoAlmacen, usuario: $usuario, contrasenia: $contrasenia, codigoListaPrecios: $codigoListaPrecios, codigoMoneda: $codigoMoneda, valorMoneda: $valorMoneda, nombreClientePredeterminado: $nombreClientePredeterminado, codigoClientePredeterminado: $codigoClientePredeterminado, esSupervisor: $esSupervisor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsuarioImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.codigoLocal, codigoLocal) ||
                other.codigoLocal == codigoLocal) &&
            (identical(other.nombreLocal, nombreLocal) ||
                other.nombreLocal == nombreLocal) &&
            (identical(other.codigoAlmacen, codigoAlmacen) ||
                other.codigoAlmacen == codigoAlmacen) &&
            (identical(other.usuario, usuario) || other.usuario == usuario) &&
            (identical(other.contrasenia, contrasenia) ||
                other.contrasenia == contrasenia) &&
            (identical(other.codigoListaPrecios, codigoListaPrecios) ||
                other.codigoListaPrecios == codigoListaPrecios) &&
            (identical(other.codigoMoneda, codigoMoneda) ||
                other.codigoMoneda == codigoMoneda) &&
            (identical(other.valorMoneda, valorMoneda) ||
                other.valorMoneda == valorMoneda) &&
            (identical(other.nombreClientePredeterminado,
                    nombreClientePredeterminado) ||
                other.nombreClientePredeterminado ==
                    nombreClientePredeterminado) &&
            (identical(other.codigoClientePredeterminado,
                    codigoClientePredeterminado) ||
                other.codigoClientePredeterminado ==
                    codigoClientePredeterminado) &&
            (identical(other.esSupervisor, esSupervisor) ||
                other.esSupervisor == esSupervisor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codigo,
      nombre,
      codigoLocal,
      nombreLocal,
      codigoAlmacen,
      usuario,
      contrasenia,
      codigoListaPrecios,
      codigoMoneda,
      valorMoneda,
      nombreClientePredeterminado,
      codigoClientePredeterminado,
      esSupervisor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioImplCopyWith<_$UsuarioImpl> get copyWith =>
      __$$UsuarioImplCopyWithImpl<_$UsuarioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioImplToJson(
      this,
    );
  }
}

abstract class _Usuario implements Usuario {
  factory _Usuario(
          {required final int codigo,
          required final String nombre,
          @JsonKey(name: 'codigo_local') required final int codigoLocal,
          @JsonKey(name: 'nombre_local') required final String nombreLocal,
          @JsonKey(name: 'codigo_almacen') required final int codigoAlmacen,
          required final String usuario,
          required final String contrasenia,
          @JsonKey(name: 'codigo_lista_precios')
          required final int codigoListaPrecios,
          @JsonKey(name: 'codigo_moneda') required final int codigoMoneda,
          @JsonKey(name: 'valor_moneda') required final double valorMoneda,
          @JsonKey(name: 'nombre_cliente_predeterminado')
          required final String nombreClientePredeterminado,
          @JsonKey(name: 'codigo_cliente_predeterminado')
          required final int codigoClientePredeterminado,
          @JsonKey(name: 'es_supervisor') required final bool esSupervisor}) =
      _$UsuarioImpl;

  factory _Usuario.fromJson(Map<String, dynamic> json) = _$UsuarioImpl.fromJson;

  @override
  int get codigo;
  @override
  String get nombre;
  @override
  @JsonKey(name: 'codigo_local')
  int get codigoLocal;
  @override
  @JsonKey(name: 'nombre_local')
  String get nombreLocal;
  @override
  @JsonKey(name: 'codigo_almacen')
  int get codigoAlmacen;
  @override
  String get usuario;
  @override
  String get contrasenia;
  @override
  @JsonKey(name: 'codigo_lista_precios')
  int get codigoListaPrecios;
  @override
  @JsonKey(name: 'codigo_moneda')
  int get codigoMoneda;
  @override
  @JsonKey(name: 'valor_moneda')
  double get valorMoneda;
  @override
  @JsonKey(name: 'nombre_cliente_predeterminado')
  String get nombreClientePredeterminado;
  @override
  @JsonKey(name: 'codigo_cliente_predeterminado')
  int get codigoClientePredeterminado;
  @override
  @JsonKey(name: 'es_supervisor')
  bool get esSupervisor;
  @override
  @JsonKey(ignore: true)
  _$$UsuarioImplCopyWith<_$UsuarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
