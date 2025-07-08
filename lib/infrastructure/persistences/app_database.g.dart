// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TblUsuarioTable extends TblUsuario
    with TableInfo<$TblUsuarioTable, Usuario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblUsuarioTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codigoLocalMeta =
      const VerificationMeta('codigoLocal');
  @override
  late final GeneratedColumn<int> codigoLocal = GeneratedColumn<int>(
      'codigo_local', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nombreLocalMeta =
      const VerificationMeta('nombreLocal');
  @override
  late final GeneratedColumn<String> nombreLocal = GeneratedColumn<String>(
      'nombre_local', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codigoAlmacenMeta =
      const VerificationMeta('codigoAlmacen');
  @override
  late final GeneratedColumn<int> codigoAlmacen = GeneratedColumn<int>(
      'codigo_almacen', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _usuarioMeta =
      const VerificationMeta('usuario');
  @override
  late final GeneratedColumn<String> usuario = GeneratedColumn<String>(
      'usuario', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contraseniaMeta =
      const VerificationMeta('contrasenia');
  @override
  late final GeneratedColumn<String> contrasenia = GeneratedColumn<String>(
      'contrasenia', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codigoListaPreciosMeta =
      const VerificationMeta('codigoListaPrecios');
  @override
  late final GeneratedColumn<int> codigoListaPrecios = GeneratedColumn<int>(
      'codigo_lista_precios', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _codigoMonedaMeta =
      const VerificationMeta('codigoMoneda');
  @override
  late final GeneratedColumn<int> codigoMoneda = GeneratedColumn<int>(
      'codigo_moneda', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _valorMonedaMeta =
      const VerificationMeta('valorMoneda');
  @override
  late final GeneratedColumn<double> valorMoneda = GeneratedColumn<double>(
      'valor_moneda', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nombreClientePredeterminadoMeta =
      const VerificationMeta('nombreClientePredeterminado');
  @override
  late final GeneratedColumn<String> nombreClientePredeterminado =
      GeneratedColumn<String>(
          'nombre_cliente_predeterminado', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codigoClientePredeterminadoMeta =
      const VerificationMeta('codigoClientePredeterminado');
  @override
  late final GeneratedColumn<int> codigoClientePredeterminado =
      GeneratedColumn<int>('codigo_cliente_predeterminado', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _esSupervisorMeta =
      const VerificationMeta('esSupervisor');
  @override
  late final GeneratedColumn<bool> esSupervisor = GeneratedColumn<bool>(
      'es_supervisor', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("es_supervisor" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
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
        esSupervisor
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_usuario';
  @override
  VerificationContext validateIntegrity(Insertable<Usuario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('codigo_local')) {
      context.handle(
          _codigoLocalMeta,
          codigoLocal.isAcceptableOrUnknown(
              data['codigo_local']!, _codigoLocalMeta));
    } else if (isInserting) {
      context.missing(_codigoLocalMeta);
    }
    if (data.containsKey('nombre_local')) {
      context.handle(
          _nombreLocalMeta,
          nombreLocal.isAcceptableOrUnknown(
              data['nombre_local']!, _nombreLocalMeta));
    } else if (isInserting) {
      context.missing(_nombreLocalMeta);
    }
    if (data.containsKey('codigo_almacen')) {
      context.handle(
          _codigoAlmacenMeta,
          codigoAlmacen.isAcceptableOrUnknown(
              data['codigo_almacen']!, _codigoAlmacenMeta));
    } else if (isInserting) {
      context.missing(_codigoAlmacenMeta);
    }
    if (data.containsKey('usuario')) {
      context.handle(_usuarioMeta,
          usuario.isAcceptableOrUnknown(data['usuario']!, _usuarioMeta));
    } else if (isInserting) {
      context.missing(_usuarioMeta);
    }
    if (data.containsKey('contrasenia')) {
      context.handle(
          _contraseniaMeta,
          contrasenia.isAcceptableOrUnknown(
              data['contrasenia']!, _contraseniaMeta));
    } else if (isInserting) {
      context.missing(_contraseniaMeta);
    }
    if (data.containsKey('codigo_lista_precios')) {
      context.handle(
          _codigoListaPreciosMeta,
          codigoListaPrecios.isAcceptableOrUnknown(
              data['codigo_lista_precios']!, _codigoListaPreciosMeta));
    } else if (isInserting) {
      context.missing(_codigoListaPreciosMeta);
    }
    if (data.containsKey('codigo_moneda')) {
      context.handle(
          _codigoMonedaMeta,
          codigoMoneda.isAcceptableOrUnknown(
              data['codigo_moneda']!, _codigoMonedaMeta));
    } else if (isInserting) {
      context.missing(_codigoMonedaMeta);
    }
    if (data.containsKey('valor_moneda')) {
      context.handle(
          _valorMonedaMeta,
          valorMoneda.isAcceptableOrUnknown(
              data['valor_moneda']!, _valorMonedaMeta));
    } else if (isInserting) {
      context.missing(_valorMonedaMeta);
    }
    if (data.containsKey('nombre_cliente_predeterminado')) {
      context.handle(
          _nombreClientePredeterminadoMeta,
          nombreClientePredeterminado.isAcceptableOrUnknown(
              data['nombre_cliente_predeterminado']!,
              _nombreClientePredeterminadoMeta));
    } else if (isInserting) {
      context.missing(_nombreClientePredeterminadoMeta);
    }
    if (data.containsKey('codigo_cliente_predeterminado')) {
      context.handle(
          _codigoClientePredeterminadoMeta,
          codigoClientePredeterminado.isAcceptableOrUnknown(
              data['codigo_cliente_predeterminado']!,
              _codigoClientePredeterminadoMeta));
    } else if (isInserting) {
      context.missing(_codigoClientePredeterminadoMeta);
    }
    if (data.containsKey('es_supervisor')) {
      context.handle(
          _esSupervisorMeta,
          esSupervisor.isAcceptableOrUnknown(
              data['es_supervisor']!, _esSupervisorMeta));
    } else if (isInserting) {
      context.missing(_esSupervisorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Usuario(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      codigoLocal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo_local'])!,
      nombreLocal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre_local'])!,
      codigoAlmacen: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo_almacen'])!,
      usuario: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}usuario'])!,
      contrasenia: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contrasenia'])!,
      codigoListaPrecios: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}codigo_lista_precios'])!,
      codigoMoneda: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo_moneda'])!,
      valorMoneda: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}valor_moneda'])!,
      nombreClientePredeterminado: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}nombre_cliente_predeterminado'])!,
      codigoClientePredeterminado: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}codigo_cliente_predeterminado'])!,
      esSupervisor: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}es_supervisor'])!,
    );
  }

  @override
  $TblUsuarioTable createAlias(String alias) {
    return $TblUsuarioTable(attachedDatabase, alias);
  }
}

class TblUsuarioCompanion extends UpdateCompanion<Usuario> {
  final Value<int> codigo;
  final Value<String> nombre;
  final Value<int> codigoLocal;
  final Value<String> nombreLocal;
  final Value<int> codigoAlmacen;
  final Value<String> usuario;
  final Value<String> contrasenia;
  final Value<int> codigoListaPrecios;
  final Value<int> codigoMoneda;
  final Value<double> valorMoneda;
  final Value<String> nombreClientePredeterminado;
  final Value<int> codigoClientePredeterminado;
  final Value<bool> esSupervisor;
  const TblUsuarioCompanion({
    this.codigo = const Value.absent(),
    this.nombre = const Value.absent(),
    this.codigoLocal = const Value.absent(),
    this.nombreLocal = const Value.absent(),
    this.codigoAlmacen = const Value.absent(),
    this.usuario = const Value.absent(),
    this.contrasenia = const Value.absent(),
    this.codigoListaPrecios = const Value.absent(),
    this.codigoMoneda = const Value.absent(),
    this.valorMoneda = const Value.absent(),
    this.nombreClientePredeterminado = const Value.absent(),
    this.codigoClientePredeterminado = const Value.absent(),
    this.esSupervisor = const Value.absent(),
  });
  TblUsuarioCompanion.insert({
    this.codigo = const Value.absent(),
    required String nombre,
    required int codigoLocal,
    required String nombreLocal,
    required int codigoAlmacen,
    required String usuario,
    required String contrasenia,
    required int codigoListaPrecios,
    required int codigoMoneda,
    required double valorMoneda,
    required String nombreClientePredeterminado,
    required int codigoClientePredeterminado,
    required bool esSupervisor,
  })  : nombre = Value(nombre),
        codigoLocal = Value(codigoLocal),
        nombreLocal = Value(nombreLocal),
        codigoAlmacen = Value(codigoAlmacen),
        usuario = Value(usuario),
        contrasenia = Value(contrasenia),
        codigoListaPrecios = Value(codigoListaPrecios),
        codigoMoneda = Value(codigoMoneda),
        valorMoneda = Value(valorMoneda),
        nombreClientePredeterminado = Value(nombreClientePredeterminado),
        codigoClientePredeterminado = Value(codigoClientePredeterminado),
        esSupervisor = Value(esSupervisor);
  static Insertable<Usuario> custom({
    Expression<int>? codigo,
    Expression<String>? nombre,
    Expression<int>? codigoLocal,
    Expression<String>? nombreLocal,
    Expression<int>? codigoAlmacen,
    Expression<String>? usuario,
    Expression<String>? contrasenia,
    Expression<int>? codigoListaPrecios,
    Expression<int>? codigoMoneda,
    Expression<double>? valorMoneda,
    Expression<String>? nombreClientePredeterminado,
    Expression<int>? codigoClientePredeterminado,
    Expression<bool>? esSupervisor,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (nombre != null) 'nombre': nombre,
      if (codigoLocal != null) 'codigo_local': codigoLocal,
      if (nombreLocal != null) 'nombre_local': nombreLocal,
      if (codigoAlmacen != null) 'codigo_almacen': codigoAlmacen,
      if (usuario != null) 'usuario': usuario,
      if (contrasenia != null) 'contrasenia': contrasenia,
      if (codigoListaPrecios != null)
        'codigo_lista_precios': codigoListaPrecios,
      if (codigoMoneda != null) 'codigo_moneda': codigoMoneda,
      if (valorMoneda != null) 'valor_moneda': valorMoneda,
      if (nombreClientePredeterminado != null)
        'nombre_cliente_predeterminado': nombreClientePredeterminado,
      if (codigoClientePredeterminado != null)
        'codigo_cliente_predeterminado': codigoClientePredeterminado,
      if (esSupervisor != null) 'es_supervisor': esSupervisor,
    });
  }

  TblUsuarioCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? nombre,
      Value<int>? codigoLocal,
      Value<String>? nombreLocal,
      Value<int>? codigoAlmacen,
      Value<String>? usuario,
      Value<String>? contrasenia,
      Value<int>? codigoListaPrecios,
      Value<int>? codigoMoneda,
      Value<double>? valorMoneda,
      Value<String>? nombreClientePredeterminado,
      Value<int>? codigoClientePredeterminado,
      Value<bool>? esSupervisor}) {
    return TblUsuarioCompanion(
      codigo: codigo ?? this.codigo,
      nombre: nombre ?? this.nombre,
      codigoLocal: codigoLocal ?? this.codigoLocal,
      nombreLocal: nombreLocal ?? this.nombreLocal,
      codigoAlmacen: codigoAlmacen ?? this.codigoAlmacen,
      usuario: usuario ?? this.usuario,
      contrasenia: contrasenia ?? this.contrasenia,
      codigoListaPrecios: codigoListaPrecios ?? this.codigoListaPrecios,
      codigoMoneda: codigoMoneda ?? this.codigoMoneda,
      valorMoneda: valorMoneda ?? this.valorMoneda,
      nombreClientePredeterminado:
          nombreClientePredeterminado ?? this.nombreClientePredeterminado,
      codigoClientePredeterminado:
          codigoClientePredeterminado ?? this.codigoClientePredeterminado,
      esSupervisor: esSupervisor ?? this.esSupervisor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (codigoLocal.present) {
      map['codigo_local'] = Variable<int>(codigoLocal.value);
    }
    if (nombreLocal.present) {
      map['nombre_local'] = Variable<String>(nombreLocal.value);
    }
    if (codigoAlmacen.present) {
      map['codigo_almacen'] = Variable<int>(codigoAlmacen.value);
    }
    if (usuario.present) {
      map['usuario'] = Variable<String>(usuario.value);
    }
    if (contrasenia.present) {
      map['contrasenia'] = Variable<String>(contrasenia.value);
    }
    if (codigoListaPrecios.present) {
      map['codigo_lista_precios'] = Variable<int>(codigoListaPrecios.value);
    }
    if (codigoMoneda.present) {
      map['codigo_moneda'] = Variable<int>(codigoMoneda.value);
    }
    if (valorMoneda.present) {
      map['valor_moneda'] = Variable<double>(valorMoneda.value);
    }
    if (nombreClientePredeterminado.present) {
      map['nombre_cliente_predeterminado'] =
          Variable<String>(nombreClientePredeterminado.value);
    }
    if (codigoClientePredeterminado.present) {
      map['codigo_cliente_predeterminado'] =
          Variable<int>(codigoClientePredeterminado.value);
    }
    if (esSupervisor.present) {
      map['es_supervisor'] = Variable<bool>(esSupervisor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblUsuarioCompanion(')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre, ')
          ..write('codigoLocal: $codigoLocal, ')
          ..write('nombreLocal: $nombreLocal, ')
          ..write('codigoAlmacen: $codigoAlmacen, ')
          ..write('usuario: $usuario, ')
          ..write('contrasenia: $contrasenia, ')
          ..write('codigoListaPrecios: $codigoListaPrecios, ')
          ..write('codigoMoneda: $codigoMoneda, ')
          ..write('valorMoneda: $valorMoneda, ')
          ..write('nombreClientePredeterminado: $nombreClientePredeterminado, ')
          ..write('codigoClientePredeterminado: $codigoClientePredeterminado, ')
          ..write('esSupervisor: $esSupervisor')
          ..write(')'))
        .toString();
  }
}

class $TblUnidadmedidaTable extends TblUnidadmedida
    with TableInfo<$TblUnidadmedidaTable, UnidadMedida> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblUnidadmedidaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _codigoProductoMeta =
      const VerificationMeta('codigoProducto');
  @override
  late final GeneratedColumn<String> codigoProducto = GeneratedColumn<String>(
      'codigo_producto', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _articuloMeta =
      const VerificationMeta('articulo');
  @override
  late final GeneratedColumn<int> articulo = GeneratedColumn<int>(
      'articulo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _relacionMeta =
      const VerificationMeta('relacion');
  @override
  late final GeneratedColumn<double> relacion = GeneratedColumn<double>(
      'relacion', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descuentoMeta =
      const VerificationMeta('descuento');
  @override
  late final GeneratedColumn<double> descuento = GeneratedColumn<double>(
      'descuento', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [codigo, codigoProducto, articulo, relacion, descuento, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_unidadmedida';
  @override
  VerificationContext validateIntegrity(Insertable<UnidadMedida> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('codigo_producto')) {
      context.handle(
          _codigoProductoMeta,
          codigoProducto.isAcceptableOrUnknown(
              data['codigo_producto']!, _codigoProductoMeta));
    } else if (isInserting) {
      context.missing(_codigoProductoMeta);
    }
    if (data.containsKey('articulo')) {
      context.handle(_articuloMeta,
          articulo.isAcceptableOrUnknown(data['articulo']!, _articuloMeta));
    } else if (isInserting) {
      context.missing(_articuloMeta);
    }
    if (data.containsKey('relacion')) {
      context.handle(_relacionMeta,
          relacion.isAcceptableOrUnknown(data['relacion']!, _relacionMeta));
    } else if (isInserting) {
      context.missing(_relacionMeta);
    }
    if (data.containsKey('descuento')) {
      context.handle(_descuentoMeta,
          descuento.isAcceptableOrUnknown(data['descuento']!, _descuentoMeta));
    } else if (isInserting) {
      context.missing(_descuentoMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  UnidadMedida map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnidadMedida(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      codigoProducto: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}codigo_producto'])!,
      articulo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}articulo'])!,
      relacion: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}relacion'])!,
      descuento: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}descuento'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
    );
  }

  @override
  $TblUnidadmedidaTable createAlias(String alias) {
    return $TblUnidadmedidaTable(attachedDatabase, alias);
  }
}

class TblUnidadmedidaCompanion extends UpdateCompanion<UnidadMedida> {
  final Value<int> codigo;
  final Value<String> codigoProducto;
  final Value<int> articulo;
  final Value<double> relacion;
  final Value<double> descuento;
  final Value<String> descripcion;
  const TblUnidadmedidaCompanion({
    this.codigo = const Value.absent(),
    this.codigoProducto = const Value.absent(),
    this.articulo = const Value.absent(),
    this.relacion = const Value.absent(),
    this.descuento = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  TblUnidadmedidaCompanion.insert({
    this.codigo = const Value.absent(),
    required String codigoProducto,
    required int articulo,
    required double relacion,
    required double descuento,
    required String descripcion,
  })  : codigoProducto = Value(codigoProducto),
        articulo = Value(articulo),
        relacion = Value(relacion),
        descuento = Value(descuento),
        descripcion = Value(descripcion);
  static Insertable<UnidadMedida> custom({
    Expression<int>? codigo,
    Expression<String>? codigoProducto,
    Expression<int>? articulo,
    Expression<double>? relacion,
    Expression<double>? descuento,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (codigoProducto != null) 'codigo_producto': codigoProducto,
      if (articulo != null) 'articulo': articulo,
      if (relacion != null) 'relacion': relacion,
      if (descuento != null) 'descuento': descuento,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  TblUnidadmedidaCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? codigoProducto,
      Value<int>? articulo,
      Value<double>? relacion,
      Value<double>? descuento,
      Value<String>? descripcion}) {
    return TblUnidadmedidaCompanion(
      codigo: codigo ?? this.codigo,
      codigoProducto: codigoProducto ?? this.codigoProducto,
      articulo: articulo ?? this.articulo,
      relacion: relacion ?? this.relacion,
      descuento: descuento ?? this.descuento,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (codigoProducto.present) {
      map['codigo_producto'] = Variable<String>(codigoProducto.value);
    }
    if (articulo.present) {
      map['articulo'] = Variable<int>(articulo.value);
    }
    if (relacion.present) {
      map['relacion'] = Variable<double>(relacion.value);
    }
    if (descuento.present) {
      map['descuento'] = Variable<double>(descuento.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblUnidadmedidaCompanion(')
          ..write('codigo: $codigo, ')
          ..write('codigoProducto: $codigoProducto, ')
          ..write('articulo: $articulo, ')
          ..write('relacion: $relacion, ')
          ..write('descuento: $descuento, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $TblLineaTable extends TblLinea with TableInfo<$TblLineaTable, Linea> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblLineaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_linea';
  @override
  VerificationContext validateIntegrity(Insertable<Linea> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Linea map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Linea(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
    );
  }

  @override
  $TblLineaTable createAlias(String alias) {
    return $TblLineaTable(attachedDatabase, alias);
  }
}

class TblLineaCompanion extends UpdateCompanion<Linea> {
  final Value<int> codigo;
  final Value<String> descripcion;
  const TblLineaCompanion({
    this.codigo = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  TblLineaCompanion.insert({
    this.codigo = const Value.absent(),
    required String descripcion,
  }) : descripcion = Value(descripcion);
  static Insertable<Linea> custom({
    Expression<int>? codigo,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  TblLineaCompanion copyWith({Value<int>? codigo, Value<String>? descripcion}) {
    return TblLineaCompanion(
      codigo: codigo ?? this.codigo,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblLineaCompanion(')
          ..write('codigo: $codigo, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $TblGrupoTable extends TblGrupo with TableInfo<$TblGrupoTable, Grupo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblGrupoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lineaCodigoMeta =
      const VerificationMeta('lineaCodigo');
  @override
  late final GeneratedColumn<int> lineaCodigo = GeneratedColumn<int>(
      'linea_codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, descripcion, lineaCodigo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_grupo';
  @override
  VerificationContext validateIntegrity(Insertable<Grupo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('linea_codigo')) {
      context.handle(
          _lineaCodigoMeta,
          lineaCodigo.isAcceptableOrUnknown(
              data['linea_codigo']!, _lineaCodigoMeta));
    } else if (isInserting) {
      context.missing(_lineaCodigoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Grupo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Grupo(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      lineaCodigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}linea_codigo'])!,
    );
  }

  @override
  $TblGrupoTable createAlias(String alias) {
    return $TblGrupoTable(attachedDatabase, alias);
  }
}

class TblGrupoCompanion extends UpdateCompanion<Grupo> {
  final Value<int> codigo;
  final Value<String> descripcion;
  final Value<int> lineaCodigo;
  const TblGrupoCompanion({
    this.codigo = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.lineaCodigo = const Value.absent(),
  });
  TblGrupoCompanion.insert({
    this.codigo = const Value.absent(),
    required String descripcion,
    required int lineaCodigo,
  })  : descripcion = Value(descripcion),
        lineaCodigo = Value(lineaCodigo);
  static Insertable<Grupo> custom({
    Expression<int>? codigo,
    Expression<String>? descripcion,
    Expression<int>? lineaCodigo,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (descripcion != null) 'descripcion': descripcion,
      if (lineaCodigo != null) 'linea_codigo': lineaCodigo,
    });
  }

  TblGrupoCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? descripcion,
      Value<int>? lineaCodigo}) {
    return TblGrupoCompanion(
      codigo: codigo ?? this.codigo,
      descripcion: descripcion ?? this.descripcion,
      lineaCodigo: lineaCodigo ?? this.lineaCodigo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (lineaCodigo.present) {
      map['linea_codigo'] = Variable<int>(lineaCodigo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblGrupoCompanion(')
          ..write('codigo: $codigo, ')
          ..write('descripcion: $descripcion, ')
          ..write('lineaCodigo: $lineaCodigo')
          ..write(')'))
        .toString();
  }
}

class $TblSubgrupoTable extends TblSubgrupo
    with TableInfo<$TblSubgrupoTable, Subgrupo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblSubgrupoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lineaCodigoMeta =
      const VerificationMeta('lineaCodigo');
  @override
  late final GeneratedColumn<int> lineaCodigo = GeneratedColumn<int>(
      'linea_codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _grupoCodigoMeta =
      const VerificationMeta('grupoCodigo');
  @override
  late final GeneratedColumn<int> grupoCodigo = GeneratedColumn<int>(
      'grupo_codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [codigo, descripcion, lineaCodigo, grupoCodigo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_subgrupo';
  @override
  VerificationContext validateIntegrity(Insertable<Subgrupo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('linea_codigo')) {
      context.handle(
          _lineaCodigoMeta,
          lineaCodigo.isAcceptableOrUnknown(
              data['linea_codigo']!, _lineaCodigoMeta));
    } else if (isInserting) {
      context.missing(_lineaCodigoMeta);
    }
    if (data.containsKey('grupo_codigo')) {
      context.handle(
          _grupoCodigoMeta,
          grupoCodigo.isAcceptableOrUnknown(
              data['grupo_codigo']!, _grupoCodigoMeta));
    } else if (isInserting) {
      context.missing(_grupoCodigoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Subgrupo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subgrupo(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      lineaCodigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}linea_codigo'])!,
      grupoCodigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grupo_codigo'])!,
    );
  }

  @override
  $TblSubgrupoTable createAlias(String alias) {
    return $TblSubgrupoTable(attachedDatabase, alias);
  }
}

class TblSubgrupoCompanion extends UpdateCompanion<Subgrupo> {
  final Value<int> codigo;
  final Value<String> descripcion;
  final Value<int> lineaCodigo;
  final Value<int> grupoCodigo;
  const TblSubgrupoCompanion({
    this.codigo = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.lineaCodigo = const Value.absent(),
    this.grupoCodigo = const Value.absent(),
  });
  TblSubgrupoCompanion.insert({
    this.codigo = const Value.absent(),
    required String descripcion,
    required int lineaCodigo,
    required int grupoCodigo,
  })  : descripcion = Value(descripcion),
        lineaCodigo = Value(lineaCodigo),
        grupoCodigo = Value(grupoCodigo);
  static Insertable<Subgrupo> custom({
    Expression<int>? codigo,
    Expression<String>? descripcion,
    Expression<int>? lineaCodigo,
    Expression<int>? grupoCodigo,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (descripcion != null) 'descripcion': descripcion,
      if (lineaCodigo != null) 'linea_codigo': lineaCodigo,
      if (grupoCodigo != null) 'grupo_codigo': grupoCodigo,
    });
  }

  TblSubgrupoCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? descripcion,
      Value<int>? lineaCodigo,
      Value<int>? grupoCodigo}) {
    return TblSubgrupoCompanion(
      codigo: codigo ?? this.codigo,
      descripcion: descripcion ?? this.descripcion,
      lineaCodigo: lineaCodigo ?? this.lineaCodigo,
      grupoCodigo: grupoCodigo ?? this.grupoCodigo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (lineaCodigo.present) {
      map['linea_codigo'] = Variable<int>(lineaCodigo.value);
    }
    if (grupoCodigo.present) {
      map['grupo_codigo'] = Variable<int>(grupoCodigo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblSubgrupoCompanion(')
          ..write('codigo: $codigo, ')
          ..write('descripcion: $descripcion, ')
          ..write('lineaCodigo: $lineaCodigo, ')
          ..write('grupoCodigo: $grupoCodigo')
          ..write(')'))
        .toString();
  }
}

class $TblAlmacenTable extends TblAlmacen
    with TableInfo<$TblAlmacenTable, Almacen> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblAlmacenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_almacen';
  @override
  VerificationContext validateIntegrity(Insertable<Almacen> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Almacen map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Almacen(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
    );
  }

  @override
  $TblAlmacenTable createAlias(String alias) {
    return $TblAlmacenTable(attachedDatabase, alias);
  }
}

class TblAlmacenCompanion extends UpdateCompanion<Almacen> {
  final Value<int> codigo;
  final Value<String> nombre;
  const TblAlmacenCompanion({
    this.codigo = const Value.absent(),
    this.nombre = const Value.absent(),
  });
  TblAlmacenCompanion.insert({
    this.codigo = const Value.absent(),
    required String nombre,
  }) : nombre = Value(nombre);
  static Insertable<Almacen> custom({
    Expression<int>? codigo,
    Expression<String>? nombre,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (nombre != null) 'nombre': nombre,
    });
  }

  TblAlmacenCompanion copyWith({Value<int>? codigo, Value<String>? nombre}) {
    return TblAlmacenCompanion(
      codigo: codigo ?? this.codigo,
      nombre: nombre ?? this.nombre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblAlmacenCompanion(')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }
}

class $TblAlmacenxlocalTable extends TblAlmacenxlocal
    with TableInfo<$TblAlmacenxlocalTable, AlmacenXLocal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblAlmacenxlocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_almacenxlocal';
  @override
  VerificationContext validateIntegrity(Insertable<AlmacenXLocal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  AlmacenXLocal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlmacenXLocal(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
    );
  }

  @override
  $TblAlmacenxlocalTable createAlias(String alias) {
    return $TblAlmacenxlocalTable(attachedDatabase, alias);
  }
}

class TblAlmacenxlocalCompanion extends UpdateCompanion<AlmacenXLocal> {
  final Value<int> codigo;
  final Value<String> nombre;
  const TblAlmacenxlocalCompanion({
    this.codigo = const Value.absent(),
    this.nombre = const Value.absent(),
  });
  TblAlmacenxlocalCompanion.insert({
    this.codigo = const Value.absent(),
    required String nombre,
  }) : nombre = Value(nombre);
  static Insertable<AlmacenXLocal> custom({
    Expression<int>? codigo,
    Expression<String>? nombre,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (nombre != null) 'nombre': nombre,
    });
  }

  TblAlmacenxlocalCompanion copyWith(
      {Value<int>? codigo, Value<String>? nombre}) {
    return TblAlmacenxlocalCompanion(
      codigo: codigo ?? this.codigo,
      nombre: nombre ?? this.nombre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblAlmacenxlocalCompanion(')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }
}

class $TblRegistroconteoproductoTable extends TblRegistroconteoproducto
    with TableInfo<$TblRegistroconteoproductoTable, RegistroConteoProducto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TblRegistroconteoproductoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codigoConteoMeta =
      const VerificationMeta('codigoConteo');
  @override
  late final GeneratedColumn<int> codigoConteo = GeneratedColumn<int>(
      'codigo_conteo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _codigoProductoMeta =
      const VerificationMeta('codigoProducto');
  @override
  late final GeneratedColumn<String> codigoProducto = GeneratedColumn<String>(
      'codigo_producto', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cantidadContadaMeta =
      const VerificationMeta('cantidadContada');
  @override
  late final GeneratedColumn<double> cantidadContada = GeneratedColumn<double>(
      'cantidad_contada', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fechaContadaMeta =
      const VerificationMeta('fechaContada');
  @override
  late final GeneratedColumn<String> fechaContada = GeneratedColumn<String>(
      'fecha_contada', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sincronizadoServidorMeta =
      const VerificationMeta('sincronizadoServidor');
  @override
  late final GeneratedColumn<int> sincronizadoServidor = GeneratedColumn<int>(
      'sincronizado_servidor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _esConfirmadoMeta =
      const VerificationMeta('esConfirmado');
  @override
  late final GeneratedColumn<int> esConfirmado = GeneratedColumn<int>(
      'es_confirmado', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _codigoLoteMeta =
      const VerificationMeta('codigoLote');
  @override
  late final GeneratedColumn<String> codigoLote = GeneratedColumn<String>(
      'codigo_lote', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        codigo,
        codigoConteo,
        codigoProducto,
        cantidadContada,
        fechaContada,
        sincronizadoServidor,
        esConfirmado,
        codigoLote
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl_registroconteoproducto';
  @override
  VerificationContext validateIntegrity(
      Insertable<RegistroConteoProducto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('codigo_conteo')) {
      context.handle(
          _codigoConteoMeta,
          codigoConteo.isAcceptableOrUnknown(
              data['codigo_conteo']!, _codigoConteoMeta));
    } else if (isInserting) {
      context.missing(_codigoConteoMeta);
    }
    if (data.containsKey('codigo_producto')) {
      context.handle(
          _codigoProductoMeta,
          codigoProducto.isAcceptableOrUnknown(
              data['codigo_producto']!, _codigoProductoMeta));
    } else if (isInserting) {
      context.missing(_codigoProductoMeta);
    }
    if (data.containsKey('cantidad_contada')) {
      context.handle(
          _cantidadContadaMeta,
          cantidadContada.isAcceptableOrUnknown(
              data['cantidad_contada']!, _cantidadContadaMeta));
    } else if (isInserting) {
      context.missing(_cantidadContadaMeta);
    }
    if (data.containsKey('fecha_contada')) {
      context.handle(
          _fechaContadaMeta,
          fechaContada.isAcceptableOrUnknown(
              data['fecha_contada']!, _fechaContadaMeta));
    } else if (isInserting) {
      context.missing(_fechaContadaMeta);
    }
    if (data.containsKey('sincronizado_servidor')) {
      context.handle(
          _sincronizadoServidorMeta,
          sincronizadoServidor.isAcceptableOrUnknown(
              data['sincronizado_servidor']!, _sincronizadoServidorMeta));
    } else if (isInserting) {
      context.missing(_sincronizadoServidorMeta);
    }
    if (data.containsKey('es_confirmado')) {
      context.handle(
          _esConfirmadoMeta,
          esConfirmado.isAcceptableOrUnknown(
              data['es_confirmado']!, _esConfirmadoMeta));
    }
    if (data.containsKey('codigo_lote')) {
      context.handle(
          _codigoLoteMeta,
          codigoLote.isAcceptableOrUnknown(
              data['codigo_lote']!, _codigoLoteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {codigoConteo, codigoProducto, codigoLote},
      ];
  @override
  RegistroConteoProducto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistroConteoProducto(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      codigoConteo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo_conteo'])!,
      codigoProducto: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}codigo_producto'])!,
      cantidadContada: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}cantidad_contada'])!,
      fechaContada: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fecha_contada'])!,
      sincronizadoServidor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}sincronizado_servidor'])!,
      esConfirmado: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}es_confirmado'])!,
      codigoLote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}codigo_lote'])!,
    );
  }

  @override
  $TblRegistroconteoproductoTable createAlias(String alias) {
    return $TblRegistroconteoproductoTable(attachedDatabase, alias);
  }
}

class TblRegistroconteoproductoCompanion
    extends UpdateCompanion<RegistroConteoProducto> {
  final Value<int> codigo;
  final Value<int> codigoConteo;
  final Value<String> codigoProducto;
  final Value<double> cantidadContada;
  final Value<String> fechaContada;
  final Value<int> sincronizadoServidor;
  final Value<int> esConfirmado;
  final Value<String> codigoLote;
  const TblRegistroconteoproductoCompanion({
    this.codigo = const Value.absent(),
    this.codigoConteo = const Value.absent(),
    this.codigoProducto = const Value.absent(),
    this.cantidadContada = const Value.absent(),
    this.fechaContada = const Value.absent(),
    this.sincronizadoServidor = const Value.absent(),
    this.esConfirmado = const Value.absent(),
    this.codigoLote = const Value.absent(),
  });
  TblRegistroconteoproductoCompanion.insert({
    this.codigo = const Value.absent(),
    required int codigoConteo,
    required String codigoProducto,
    required double cantidadContada,
    required String fechaContada,
    required int sincronizadoServidor,
    this.esConfirmado = const Value.absent(),
    this.codigoLote = const Value.absent(),
  })  : codigoConteo = Value(codigoConteo),
        codigoProducto = Value(codigoProducto),
        cantidadContada = Value(cantidadContada),
        fechaContada = Value(fechaContada),
        sincronizadoServidor = Value(sincronizadoServidor);
  static Insertable<RegistroConteoProducto> custom({
    Expression<int>? codigo,
    Expression<int>? codigoConteo,
    Expression<String>? codigoProducto,
    Expression<double>? cantidadContada,
    Expression<String>? fechaContada,
    Expression<int>? sincronizadoServidor,
    Expression<int>? esConfirmado,
    Expression<String>? codigoLote,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (codigoConteo != null) 'codigo_conteo': codigoConteo,
      if (codigoProducto != null) 'codigo_producto': codigoProducto,
      if (cantidadContada != null) 'cantidad_contada': cantidadContada,
      if (fechaContada != null) 'fecha_contada': fechaContada,
      if (sincronizadoServidor != null)
        'sincronizado_servidor': sincronizadoServidor,
      if (esConfirmado != null) 'es_confirmado': esConfirmado,
      if (codigoLote != null) 'codigo_lote': codigoLote,
    });
  }

  TblRegistroconteoproductoCompanion copyWith(
      {Value<int>? codigo,
      Value<int>? codigoConteo,
      Value<String>? codigoProducto,
      Value<double>? cantidadContada,
      Value<String>? fechaContada,
      Value<int>? sincronizadoServidor,
      Value<int>? esConfirmado,
      Value<String>? codigoLote}) {
    return TblRegistroconteoproductoCompanion(
      codigo: codigo ?? this.codigo,
      codigoConteo: codigoConteo ?? this.codigoConteo,
      codigoProducto: codigoProducto ?? this.codigoProducto,
      cantidadContada: cantidadContada ?? this.cantidadContada,
      fechaContada: fechaContada ?? this.fechaContada,
      sincronizadoServidor: sincronizadoServidor ?? this.sincronizadoServidor,
      esConfirmado: esConfirmado ?? this.esConfirmado,
      codigoLote: codigoLote ?? this.codigoLote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (codigoConteo.present) {
      map['codigo_conteo'] = Variable<int>(codigoConteo.value);
    }
    if (codigoProducto.present) {
      map['codigo_producto'] = Variable<String>(codigoProducto.value);
    }
    if (cantidadContada.present) {
      map['cantidad_contada'] = Variable<double>(cantidadContada.value);
    }
    if (fechaContada.present) {
      map['fecha_contada'] = Variable<String>(fechaContada.value);
    }
    if (sincronizadoServidor.present) {
      map['sincronizado_servidor'] = Variable<int>(sincronizadoServidor.value);
    }
    if (esConfirmado.present) {
      map['es_confirmado'] = Variable<int>(esConfirmado.value);
    }
    if (codigoLote.present) {
      map['codigo_lote'] = Variable<String>(codigoLote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TblRegistroconteoproductoCompanion(')
          ..write('codigo: $codigo, ')
          ..write('codigoConteo: $codigoConteo, ')
          ..write('codigoProducto: $codigoProducto, ')
          ..write('cantidadContada: $cantidadContada, ')
          ..write('fechaContada: $fechaContada, ')
          ..write('sincronizadoServidor: $sincronizadoServidor, ')
          ..write('esConfirmado: $esConfirmado, ')
          ..write('codigoLote: $codigoLote')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TblUsuarioTable tblUsuario = $TblUsuarioTable(this);
  late final $TblUnidadmedidaTable tblUnidadmedida =
      $TblUnidadmedidaTable(this);
  late final $TblLineaTable tblLinea = $TblLineaTable(this);
  late final $TblGrupoTable tblGrupo = $TblGrupoTable(this);
  late final $TblSubgrupoTable tblSubgrupo = $TblSubgrupoTable(this);
  late final $TblAlmacenTable tblAlmacen = $TblAlmacenTable(this);
  late final $TblAlmacenxlocalTable tblAlmacenxlocal =
      $TblAlmacenxlocalTable(this);
  late final $TblRegistroconteoproductoTable tblRegistroconteoproducto =
      $TblRegistroconteoproductoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tblUsuario,
        tblUnidadmedida,
        tblLinea,
        tblGrupo,
        tblSubgrupo,
        tblAlmacen,
        tblAlmacenxlocal,
        tblRegistroconteoproducto
      ];
}

typedef $$TblUsuarioTableCreateCompanionBuilder = TblUsuarioCompanion Function({
  Value<int> codigo,
  required String nombre,
  required int codigoLocal,
  required String nombreLocal,
  required int codigoAlmacen,
  required String usuario,
  required String contrasenia,
  required int codigoListaPrecios,
  required int codigoMoneda,
  required double valorMoneda,
  required String nombreClientePredeterminado,
  required int codigoClientePredeterminado,
  required bool esSupervisor,
});
typedef $$TblUsuarioTableUpdateCompanionBuilder = TblUsuarioCompanion Function({
  Value<int> codigo,
  Value<String> nombre,
  Value<int> codigoLocal,
  Value<String> nombreLocal,
  Value<int> codigoAlmacen,
  Value<String> usuario,
  Value<String> contrasenia,
  Value<int> codigoListaPrecios,
  Value<int> codigoMoneda,
  Value<double> valorMoneda,
  Value<String> nombreClientePredeterminado,
  Value<int> codigoClientePredeterminado,
  Value<bool> esSupervisor,
});

class $$TblUsuarioTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblUsuarioTable> {
  $$TblUsuarioTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codigoLocal => $state.composableBuilder(
      column: $state.table.codigoLocal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nombreLocal => $state.composableBuilder(
      column: $state.table.nombreLocal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codigoAlmacen => $state.composableBuilder(
      column: $state.table.codigoAlmacen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get usuario => $state.composableBuilder(
      column: $state.table.usuario,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get contrasenia => $state.composableBuilder(
      column: $state.table.contrasenia,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codigoListaPrecios => $state.composableBuilder(
      column: $state.table.codigoListaPrecios,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codigoMoneda => $state.composableBuilder(
      column: $state.table.codigoMoneda,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get valorMoneda => $state.composableBuilder(
      column: $state.table.valorMoneda,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nombreClientePredeterminado => $state
      .composableBuilder(
          column: $state.table.nombreClientePredeterminado,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codigoClientePredeterminado =>
      $state.composableBuilder(
          column: $state.table.codigoClientePredeterminado,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get esSupervisor => $state.composableBuilder(
      column: $state.table.esSupervisor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblUsuarioTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblUsuarioTable> {
  $$TblUsuarioTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codigoLocal => $state.composableBuilder(
      column: $state.table.codigoLocal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nombreLocal => $state.composableBuilder(
      column: $state.table.nombreLocal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codigoAlmacen => $state.composableBuilder(
      column: $state.table.codigoAlmacen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get usuario => $state.composableBuilder(
      column: $state.table.usuario,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get contrasenia => $state.composableBuilder(
      column: $state.table.contrasenia,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codigoListaPrecios => $state.composableBuilder(
      column: $state.table.codigoListaPrecios,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codigoMoneda => $state.composableBuilder(
      column: $state.table.codigoMoneda,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get valorMoneda => $state.composableBuilder(
      column: $state.table.valorMoneda,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nombreClientePredeterminado =>
      $state.composableBuilder(
          column: $state.table.nombreClientePredeterminado,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codigoClientePredeterminado =>
      $state.composableBuilder(
          column: $state.table.codigoClientePredeterminado,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get esSupervisor => $state.composableBuilder(
      column: $state.table.esSupervisor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblUsuarioTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblUsuarioTable,
    Usuario,
    $$TblUsuarioTableFilterComposer,
    $$TblUsuarioTableOrderingComposer,
    $$TblUsuarioTableCreateCompanionBuilder,
    $$TblUsuarioTableUpdateCompanionBuilder,
    (Usuario, BaseReferences<_$AppDatabase, $TblUsuarioTable, Usuario>),
    Usuario,
    PrefetchHooks Function()> {
  $$TblUsuarioTableTableManager(_$AppDatabase db, $TblUsuarioTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblUsuarioTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblUsuarioTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> nombre = const Value.absent(),
            Value<int> codigoLocal = const Value.absent(),
            Value<String> nombreLocal = const Value.absent(),
            Value<int> codigoAlmacen = const Value.absent(),
            Value<String> usuario = const Value.absent(),
            Value<String> contrasenia = const Value.absent(),
            Value<int> codigoListaPrecios = const Value.absent(),
            Value<int> codigoMoneda = const Value.absent(),
            Value<double> valorMoneda = const Value.absent(),
            Value<String> nombreClientePredeterminado = const Value.absent(),
            Value<int> codigoClientePredeterminado = const Value.absent(),
            Value<bool> esSupervisor = const Value.absent(),
          }) =>
              TblUsuarioCompanion(
            codigo: codigo,
            nombre: nombre,
            codigoLocal: codigoLocal,
            nombreLocal: nombreLocal,
            codigoAlmacen: codigoAlmacen,
            usuario: usuario,
            contrasenia: contrasenia,
            codigoListaPrecios: codigoListaPrecios,
            codigoMoneda: codigoMoneda,
            valorMoneda: valorMoneda,
            nombreClientePredeterminado: nombreClientePredeterminado,
            codigoClientePredeterminado: codigoClientePredeterminado,
            esSupervisor: esSupervisor,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String nombre,
            required int codigoLocal,
            required String nombreLocal,
            required int codigoAlmacen,
            required String usuario,
            required String contrasenia,
            required int codigoListaPrecios,
            required int codigoMoneda,
            required double valorMoneda,
            required String nombreClientePredeterminado,
            required int codigoClientePredeterminado,
            required bool esSupervisor,
          }) =>
              TblUsuarioCompanion.insert(
            codigo: codigo,
            nombre: nombre,
            codigoLocal: codigoLocal,
            nombreLocal: nombreLocal,
            codigoAlmacen: codigoAlmacen,
            usuario: usuario,
            contrasenia: contrasenia,
            codigoListaPrecios: codigoListaPrecios,
            codigoMoneda: codigoMoneda,
            valorMoneda: valorMoneda,
            nombreClientePredeterminado: nombreClientePredeterminado,
            codigoClientePredeterminado: codigoClientePredeterminado,
            esSupervisor: esSupervisor,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblUsuarioTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblUsuarioTable,
    Usuario,
    $$TblUsuarioTableFilterComposer,
    $$TblUsuarioTableOrderingComposer,
    $$TblUsuarioTableCreateCompanionBuilder,
    $$TblUsuarioTableUpdateCompanionBuilder,
    (Usuario, BaseReferences<_$AppDatabase, $TblUsuarioTable, Usuario>),
    Usuario,
    PrefetchHooks Function()>;
typedef $$TblUnidadmedidaTableCreateCompanionBuilder = TblUnidadmedidaCompanion
    Function({
  Value<int> codigo,
  required String codigoProducto,
  required int articulo,
  required double relacion,
  required double descuento,
  required String descripcion,
});
typedef $$TblUnidadmedidaTableUpdateCompanionBuilder = TblUnidadmedidaCompanion
    Function({
  Value<int> codigo,
  Value<String> codigoProducto,
  Value<int> articulo,
  Value<double> relacion,
  Value<double> descuento,
  Value<String> descripcion,
});

class $$TblUnidadmedidaTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblUnidadmedidaTable> {
  $$TblUnidadmedidaTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get codigoProducto => $state.composableBuilder(
      column: $state.table.codigoProducto,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get articulo => $state.composableBuilder(
      column: $state.table.articulo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get relacion => $state.composableBuilder(
      column: $state.table.relacion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get descuento => $state.composableBuilder(
      column: $state.table.descuento,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblUnidadmedidaTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblUnidadmedidaTable> {
  $$TblUnidadmedidaTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get codigoProducto => $state.composableBuilder(
      column: $state.table.codigoProducto,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get articulo => $state.composableBuilder(
      column: $state.table.articulo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get relacion => $state.composableBuilder(
      column: $state.table.relacion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get descuento => $state.composableBuilder(
      column: $state.table.descuento,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblUnidadmedidaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblUnidadmedidaTable,
    UnidadMedida,
    $$TblUnidadmedidaTableFilterComposer,
    $$TblUnidadmedidaTableOrderingComposer,
    $$TblUnidadmedidaTableCreateCompanionBuilder,
    $$TblUnidadmedidaTableUpdateCompanionBuilder,
    (
      UnidadMedida,
      BaseReferences<_$AppDatabase, $TblUnidadmedidaTable, UnidadMedida>
    ),
    UnidadMedida,
    PrefetchHooks Function()> {
  $$TblUnidadmedidaTableTableManager(
      _$AppDatabase db, $TblUnidadmedidaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblUnidadmedidaTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblUnidadmedidaTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> codigoProducto = const Value.absent(),
            Value<int> articulo = const Value.absent(),
            Value<double> relacion = const Value.absent(),
            Value<double> descuento = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
          }) =>
              TblUnidadmedidaCompanion(
            codigo: codigo,
            codigoProducto: codigoProducto,
            articulo: articulo,
            relacion: relacion,
            descuento: descuento,
            descripcion: descripcion,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String codigoProducto,
            required int articulo,
            required double relacion,
            required double descuento,
            required String descripcion,
          }) =>
              TblUnidadmedidaCompanion.insert(
            codigo: codigo,
            codigoProducto: codigoProducto,
            articulo: articulo,
            relacion: relacion,
            descuento: descuento,
            descripcion: descripcion,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblUnidadmedidaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblUnidadmedidaTable,
    UnidadMedida,
    $$TblUnidadmedidaTableFilterComposer,
    $$TblUnidadmedidaTableOrderingComposer,
    $$TblUnidadmedidaTableCreateCompanionBuilder,
    $$TblUnidadmedidaTableUpdateCompanionBuilder,
    (
      UnidadMedida,
      BaseReferences<_$AppDatabase, $TblUnidadmedidaTable, UnidadMedida>
    ),
    UnidadMedida,
    PrefetchHooks Function()>;
typedef $$TblLineaTableCreateCompanionBuilder = TblLineaCompanion Function({
  Value<int> codigo,
  required String descripcion,
});
typedef $$TblLineaTableUpdateCompanionBuilder = TblLineaCompanion Function({
  Value<int> codigo,
  Value<String> descripcion,
});

class $$TblLineaTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblLineaTable> {
  $$TblLineaTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblLineaTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblLineaTable> {
  $$TblLineaTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblLineaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblLineaTable,
    Linea,
    $$TblLineaTableFilterComposer,
    $$TblLineaTableOrderingComposer,
    $$TblLineaTableCreateCompanionBuilder,
    $$TblLineaTableUpdateCompanionBuilder,
    (Linea, BaseReferences<_$AppDatabase, $TblLineaTable, Linea>),
    Linea,
    PrefetchHooks Function()> {
  $$TblLineaTableTableManager(_$AppDatabase db, $TblLineaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblLineaTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblLineaTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
          }) =>
              TblLineaCompanion(
            codigo: codigo,
            descripcion: descripcion,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String descripcion,
          }) =>
              TblLineaCompanion.insert(
            codigo: codigo,
            descripcion: descripcion,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblLineaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblLineaTable,
    Linea,
    $$TblLineaTableFilterComposer,
    $$TblLineaTableOrderingComposer,
    $$TblLineaTableCreateCompanionBuilder,
    $$TblLineaTableUpdateCompanionBuilder,
    (Linea, BaseReferences<_$AppDatabase, $TblLineaTable, Linea>),
    Linea,
    PrefetchHooks Function()>;
typedef $$TblGrupoTableCreateCompanionBuilder = TblGrupoCompanion Function({
  Value<int> codigo,
  required String descripcion,
  required int lineaCodigo,
});
typedef $$TblGrupoTableUpdateCompanionBuilder = TblGrupoCompanion Function({
  Value<int> codigo,
  Value<String> descripcion,
  Value<int> lineaCodigo,
});

class $$TblGrupoTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblGrupoTable> {
  $$TblGrupoTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lineaCodigo => $state.composableBuilder(
      column: $state.table.lineaCodigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblGrupoTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblGrupoTable> {
  $$TblGrupoTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lineaCodigo => $state.composableBuilder(
      column: $state.table.lineaCodigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblGrupoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblGrupoTable,
    Grupo,
    $$TblGrupoTableFilterComposer,
    $$TblGrupoTableOrderingComposer,
    $$TblGrupoTableCreateCompanionBuilder,
    $$TblGrupoTableUpdateCompanionBuilder,
    (Grupo, BaseReferences<_$AppDatabase, $TblGrupoTable, Grupo>),
    Grupo,
    PrefetchHooks Function()> {
  $$TblGrupoTableTableManager(_$AppDatabase db, $TblGrupoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblGrupoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblGrupoTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
            Value<int> lineaCodigo = const Value.absent(),
          }) =>
              TblGrupoCompanion(
            codigo: codigo,
            descripcion: descripcion,
            lineaCodigo: lineaCodigo,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String descripcion,
            required int lineaCodigo,
          }) =>
              TblGrupoCompanion.insert(
            codigo: codigo,
            descripcion: descripcion,
            lineaCodigo: lineaCodigo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblGrupoTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblGrupoTable,
    Grupo,
    $$TblGrupoTableFilterComposer,
    $$TblGrupoTableOrderingComposer,
    $$TblGrupoTableCreateCompanionBuilder,
    $$TblGrupoTableUpdateCompanionBuilder,
    (Grupo, BaseReferences<_$AppDatabase, $TblGrupoTable, Grupo>),
    Grupo,
    PrefetchHooks Function()>;
typedef $$TblSubgrupoTableCreateCompanionBuilder = TblSubgrupoCompanion
    Function({
  Value<int> codigo,
  required String descripcion,
  required int lineaCodigo,
  required int grupoCodigo,
});
typedef $$TblSubgrupoTableUpdateCompanionBuilder = TblSubgrupoCompanion
    Function({
  Value<int> codigo,
  Value<String> descripcion,
  Value<int> lineaCodigo,
  Value<int> grupoCodigo,
});

class $$TblSubgrupoTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblSubgrupoTable> {
  $$TblSubgrupoTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lineaCodigo => $state.composableBuilder(
      column: $state.table.lineaCodigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get grupoCodigo => $state.composableBuilder(
      column: $state.table.grupoCodigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblSubgrupoTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblSubgrupoTable> {
  $$TblSubgrupoTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lineaCodigo => $state.composableBuilder(
      column: $state.table.lineaCodigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get grupoCodigo => $state.composableBuilder(
      column: $state.table.grupoCodigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblSubgrupoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblSubgrupoTable,
    Subgrupo,
    $$TblSubgrupoTableFilterComposer,
    $$TblSubgrupoTableOrderingComposer,
    $$TblSubgrupoTableCreateCompanionBuilder,
    $$TblSubgrupoTableUpdateCompanionBuilder,
    (Subgrupo, BaseReferences<_$AppDatabase, $TblSubgrupoTable, Subgrupo>),
    Subgrupo,
    PrefetchHooks Function()> {
  $$TblSubgrupoTableTableManager(_$AppDatabase db, $TblSubgrupoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblSubgrupoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblSubgrupoTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
            Value<int> lineaCodigo = const Value.absent(),
            Value<int> grupoCodigo = const Value.absent(),
          }) =>
              TblSubgrupoCompanion(
            codigo: codigo,
            descripcion: descripcion,
            lineaCodigo: lineaCodigo,
            grupoCodigo: grupoCodigo,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String descripcion,
            required int lineaCodigo,
            required int grupoCodigo,
          }) =>
              TblSubgrupoCompanion.insert(
            codigo: codigo,
            descripcion: descripcion,
            lineaCodigo: lineaCodigo,
            grupoCodigo: grupoCodigo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblSubgrupoTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblSubgrupoTable,
    Subgrupo,
    $$TblSubgrupoTableFilterComposer,
    $$TblSubgrupoTableOrderingComposer,
    $$TblSubgrupoTableCreateCompanionBuilder,
    $$TblSubgrupoTableUpdateCompanionBuilder,
    (Subgrupo, BaseReferences<_$AppDatabase, $TblSubgrupoTable, Subgrupo>),
    Subgrupo,
    PrefetchHooks Function()>;
typedef $$TblAlmacenTableCreateCompanionBuilder = TblAlmacenCompanion Function({
  Value<int> codigo,
  required String nombre,
});
typedef $$TblAlmacenTableUpdateCompanionBuilder = TblAlmacenCompanion Function({
  Value<int> codigo,
  Value<String> nombre,
});

class $$TblAlmacenTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblAlmacenTable> {
  $$TblAlmacenTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblAlmacenTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblAlmacenTable> {
  $$TblAlmacenTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblAlmacenTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblAlmacenTable,
    Almacen,
    $$TblAlmacenTableFilterComposer,
    $$TblAlmacenTableOrderingComposer,
    $$TblAlmacenTableCreateCompanionBuilder,
    $$TblAlmacenTableUpdateCompanionBuilder,
    (Almacen, BaseReferences<_$AppDatabase, $TblAlmacenTable, Almacen>),
    Almacen,
    PrefetchHooks Function()> {
  $$TblAlmacenTableTableManager(_$AppDatabase db, $TblAlmacenTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblAlmacenTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblAlmacenTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> nombre = const Value.absent(),
          }) =>
              TblAlmacenCompanion(
            codigo: codigo,
            nombre: nombre,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String nombre,
          }) =>
              TblAlmacenCompanion.insert(
            codigo: codigo,
            nombre: nombre,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblAlmacenTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblAlmacenTable,
    Almacen,
    $$TblAlmacenTableFilterComposer,
    $$TblAlmacenTableOrderingComposer,
    $$TblAlmacenTableCreateCompanionBuilder,
    $$TblAlmacenTableUpdateCompanionBuilder,
    (Almacen, BaseReferences<_$AppDatabase, $TblAlmacenTable, Almacen>),
    Almacen,
    PrefetchHooks Function()>;
typedef $$TblAlmacenxlocalTableCreateCompanionBuilder
    = TblAlmacenxlocalCompanion Function({
  Value<int> codigo,
  required String nombre,
});
typedef $$TblAlmacenxlocalTableUpdateCompanionBuilder
    = TblAlmacenxlocalCompanion Function({
  Value<int> codigo,
  Value<String> nombre,
});

class $$TblAlmacenxlocalTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblAlmacenxlocalTable> {
  $$TblAlmacenxlocalTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblAlmacenxlocalTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblAlmacenxlocalTable> {
  $$TblAlmacenxlocalTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblAlmacenxlocalTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblAlmacenxlocalTable,
    AlmacenXLocal,
    $$TblAlmacenxlocalTableFilterComposer,
    $$TblAlmacenxlocalTableOrderingComposer,
    $$TblAlmacenxlocalTableCreateCompanionBuilder,
    $$TblAlmacenxlocalTableUpdateCompanionBuilder,
    (
      AlmacenXLocal,
      BaseReferences<_$AppDatabase, $TblAlmacenxlocalTable, AlmacenXLocal>
    ),
    AlmacenXLocal,
    PrefetchHooks Function()> {
  $$TblAlmacenxlocalTableTableManager(
      _$AppDatabase db, $TblAlmacenxlocalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TblAlmacenxlocalTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TblAlmacenxlocalTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> nombre = const Value.absent(),
          }) =>
              TblAlmacenxlocalCompanion(
            codigo: codigo,
            nombre: nombre,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String nombre,
          }) =>
              TblAlmacenxlocalCompanion.insert(
            codigo: codigo,
            nombre: nombre,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblAlmacenxlocalTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TblAlmacenxlocalTable,
    AlmacenXLocal,
    $$TblAlmacenxlocalTableFilterComposer,
    $$TblAlmacenxlocalTableOrderingComposer,
    $$TblAlmacenxlocalTableCreateCompanionBuilder,
    $$TblAlmacenxlocalTableUpdateCompanionBuilder,
    (
      AlmacenXLocal,
      BaseReferences<_$AppDatabase, $TblAlmacenxlocalTable, AlmacenXLocal>
    ),
    AlmacenXLocal,
    PrefetchHooks Function()>;
typedef $$TblRegistroconteoproductoTableCreateCompanionBuilder
    = TblRegistroconteoproductoCompanion Function({
  Value<int> codigo,
  required int codigoConteo,
  required String codigoProducto,
  required double cantidadContada,
  required String fechaContada,
  required int sincronizadoServidor,
  Value<int> esConfirmado,
  Value<String> codigoLote,
});
typedef $$TblRegistroconteoproductoTableUpdateCompanionBuilder
    = TblRegistroconteoproductoCompanion Function({
  Value<int> codigo,
  Value<int> codigoConteo,
  Value<String> codigoProducto,
  Value<double> cantidadContada,
  Value<String> fechaContada,
  Value<int> sincronizadoServidor,
  Value<int> esConfirmado,
  Value<String> codigoLote,
});

class $$TblRegistroconteoproductoTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TblRegistroconteoproductoTable> {
  $$TblRegistroconteoproductoTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codigoConteo => $state.composableBuilder(
      column: $state.table.codigoConteo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get codigoProducto => $state.composableBuilder(
      column: $state.table.codigoProducto,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cantidadContada => $state.composableBuilder(
      column: $state.table.cantidadContada,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fechaContada => $state.composableBuilder(
      column: $state.table.fechaContada,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sincronizadoServidor => $state.composableBuilder(
      column: $state.table.sincronizadoServidor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get esConfirmado => $state.composableBuilder(
      column: $state.table.esConfirmado,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get codigoLote => $state.composableBuilder(
      column: $state.table.codigoLote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TblRegistroconteoproductoTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TblRegistroconteoproductoTable> {
  $$TblRegistroconteoproductoTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codigoConteo => $state.composableBuilder(
      column: $state.table.codigoConteo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get codigoProducto => $state.composableBuilder(
      column: $state.table.codigoProducto,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cantidadContada => $state.composableBuilder(
      column: $state.table.cantidadContada,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fechaContada => $state.composableBuilder(
      column: $state.table.fechaContada,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sincronizadoServidor => $state.composableBuilder(
      column: $state.table.sincronizadoServidor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get esConfirmado => $state.composableBuilder(
      column: $state.table.esConfirmado,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get codigoLote => $state.composableBuilder(
      column: $state.table.codigoLote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TblRegistroconteoproductoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TblRegistroconteoproductoTable,
    RegistroConteoProducto,
    $$TblRegistroconteoproductoTableFilterComposer,
    $$TblRegistroconteoproductoTableOrderingComposer,
    $$TblRegistroconteoproductoTableCreateCompanionBuilder,
    $$TblRegistroconteoproductoTableUpdateCompanionBuilder,
    (
      RegistroConteoProducto,
      BaseReferences<_$AppDatabase, $TblRegistroconteoproductoTable,
          RegistroConteoProducto>
    ),
    RegistroConteoProducto,
    PrefetchHooks Function()> {
  $$TblRegistroconteoproductoTableTableManager(
      _$AppDatabase db, $TblRegistroconteoproductoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$TblRegistroconteoproductoTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$TblRegistroconteoproductoTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<int> codigoConteo = const Value.absent(),
            Value<String> codigoProducto = const Value.absent(),
            Value<double> cantidadContada = const Value.absent(),
            Value<String> fechaContada = const Value.absent(),
            Value<int> sincronizadoServidor = const Value.absent(),
            Value<int> esConfirmado = const Value.absent(),
            Value<String> codigoLote = const Value.absent(),
          }) =>
              TblRegistroconteoproductoCompanion(
            codigo: codigo,
            codigoConteo: codigoConteo,
            codigoProducto: codigoProducto,
            cantidadContada: cantidadContada,
            fechaContada: fechaContada,
            sincronizadoServidor: sincronizadoServidor,
            esConfirmado: esConfirmado,
            codigoLote: codigoLote,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required int codigoConteo,
            required String codigoProducto,
            required double cantidadContada,
            required String fechaContada,
            required int sincronizadoServidor,
            Value<int> esConfirmado = const Value.absent(),
            Value<String> codigoLote = const Value.absent(),
          }) =>
              TblRegistroconteoproductoCompanion.insert(
            codigo: codigo,
            codigoConteo: codigoConteo,
            codigoProducto: codigoProducto,
            cantidadContada: cantidadContada,
            fechaContada: fechaContada,
            sincronizadoServidor: sincronizadoServidor,
            esConfirmado: esConfirmado,
            codigoLote: codigoLote,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TblRegistroconteoproductoTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TblRegistroconteoproductoTable,
        RegistroConteoProducto,
        $$TblRegistroconteoproductoTableFilterComposer,
        $$TblRegistroconteoproductoTableOrderingComposer,
        $$TblRegistroconteoproductoTableCreateCompanionBuilder,
        $$TblRegistroconteoproductoTableUpdateCompanionBuilder,
        (
          RegistroConteoProducto,
          BaseReferences<_$AppDatabase, $TblRegistroconteoproductoTable,
              RegistroConteoProducto>
        ),
        RegistroConteoProducto,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TblUsuarioTableTableManager get tblUsuario =>
      $$TblUsuarioTableTableManager(_db, _db.tblUsuario);
  $$TblUnidadmedidaTableTableManager get tblUnidadmedida =>
      $$TblUnidadmedidaTableTableManager(_db, _db.tblUnidadmedida);
  $$TblLineaTableTableManager get tblLinea =>
      $$TblLineaTableTableManager(_db, _db.tblLinea);
  $$TblGrupoTableTableManager get tblGrupo =>
      $$TblGrupoTableTableManager(_db, _db.tblGrupo);
  $$TblSubgrupoTableTableManager get tblSubgrupo =>
      $$TblSubgrupoTableTableManager(_db, _db.tblSubgrupo);
  $$TblAlmacenTableTableManager get tblAlmacen =>
      $$TblAlmacenTableTableManager(_db, _db.tblAlmacen);
  $$TblAlmacenxlocalTableTableManager get tblAlmacenxlocal =>
      $$TblAlmacenxlocalTableTableManager(_db, _db.tblAlmacenxlocal);
  $$TblRegistroconteoproductoTableTableManager get tblRegistroconteoproducto =>
      $$TblRegistroconteoproductoTableTableManager(
          _db, _db.tblRegistroconteoproducto);
}
