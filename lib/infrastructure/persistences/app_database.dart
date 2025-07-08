import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:m_dual_inventario/config/constant/constantes.dart';
import 'package:m_dual_inventario/infrastructure/persistences/entities_db_local/entidades_tablas_export.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TblUsuario,
    TblUnidadmedida,
    TblLinea,
    TblGrupo,
    TblSubgrupo,
    TblAlmacen,
    TblAlmacenxlocal,
    TblRegistroconteoproducto,
  ],
)
class AppDatabase extends _$AppDatabase {
  // Instancia única de la base de datos
  static AppDatabase? _instance;

  // Constructor privado para evitar crear nuevas instancias
  AppDatabase._internal() : super(_openConnection());
  // AppDatabase() : super(_openConnection());

  // Método para obtener la instancia única
  factory AppDatabase() {
    return _instance ??= AppDatabase._internal();
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // No hacer nada en la migración
        },
      );

  Future<File> exportarBaseDeDatos(File file) async {
    // Make sure the directory of the target file exists
    await file.parent.create(recursive: true);

    // Override an existing backup, sqlite expects the target file to be empty
    if (file.existsSync()) {
      file.deleteSync();
    }

    await customStatement('VACUUM INTO ?', [file.path]);
    return file;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // final dbFolder = await getApplicationDocumentsDirectory();
    // return NativeDatabase.createInBackground(file, logStatements: true);
    final dbFolder = await obtenerDirectorioBaseDeDatos();
    final fileDB =
        File(path.join(dbFolder.path, ConfigDefaultDatabase.nombreBaseDeDatos));
    if (!await fileDB.exists()) {
      // Crear la carpeta "database" si no existe
      await fileDB.parent.create(recursive: true);
      // Copiar base de datos desde el assets
      final data = await rootBundle
          .load('assets/db/${ConfigDefaultDatabase.nombreBaseDeDatos}');
      final bytes = data.buffer.asUint8List();
      await fileDB.writeAsBytes(bytes);
    }
    return NativeDatabase(fileDB);
  });
}

Future<File> obtenerDirectorioBaseDeDatos() async {
  final documentosAppFolder = await getApplicationDocumentsDirectory();
  // final file = File(path.join(dbFolder.path, 'db.movil.dual'));
  final dbFolder = File(path.join(documentosAppFolder.path, 'database'));

  return dbFolder;
}
