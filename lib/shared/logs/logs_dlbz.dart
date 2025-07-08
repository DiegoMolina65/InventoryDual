import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:path/path.dart' as path;

import 'package:path_provider/path_provider.dart';

class LogsDlbz {
  static const String nombreBaseArchivo = "m_dual_inventario";
  static Future<void> guardarLog(String mensaje) async {
    try {
      final archivo = await obtenerArchivoLog(DateTime.now());
      // File('${directorio.path}/app_logs.txt');
      final timestamp =
          DateTime.now().getStringFormat("yyyy-MM-yy HH:mm:ss.mmmuuu");
      await archivo.writeAsString("$timestamp: $mensaje\n",
          mode: FileMode.append);
    } catch (e) {
      if (kDebugMode) {
        print("Debug Error al guardar el log: $e");
      }
    }
  }

  static Future<File> obtenerArchivoLog(DateTime fecha) async {
    final directorio = await obtenerDirectorio();
    File archivoLog = File(path.join(directorio.path,
        "log_${LogsDlbz.nombreBaseArchivo}_${fecha.getStringFormat("yyyy-MM-dd")}.txt"));
    // 🔹 Si el archivo no existe, crearlo
    if (!await archivoLog.exists()) {
      archivoLog = await archivoLog.create();
      await archivoLog
          .writeAsString("Archivo de log creado el ${DateTime.now()}\n");
    }
    return archivoLog;
  }

  static Future<Directory> obtenerDirectorio() async {
    final directorio = await getApplicationDocumentsDirectory();
    Directory dbFolder = Directory(path.join(directorio.path, 'logs'));

    // if (await dbFolder.exists()) {
    //   await dbFolder.delete();
    // }

    if (!await dbFolder.exists()) {
      // Crear la carpeta "database" si no existe
      dbFolder = await dbFolder.create(recursive: true);
    }
    return dbFolder;
  }

  static Future<List<File>> obtenerTodosLosArchivosLog() async {
    final directorioLogs = await obtenerDirectorio();
    List<FileSystemEntity> entities = directorioLogs.listSync(recursive: false);
    List<File> logFiles = [];
    for (var entity in entities) {
      if (entity is File &&
          path
              .basename(entity.path)
              .startsWith('log_${LogsDlbz.nombreBaseArchivo}_')) {
        logFiles.add(entity);
      }
    }
    // Ordenar los archivos por fecha (los más recientes primero)
    logFiles.sort((a, b) {
      String nameA = path.basenameWithoutExtension(a.path);
      String nameB = path.basenameWithoutExtension(b.path);
      // Extraer la parte de la fecha del nombre del archivo (ej. log_m_dual_inventario_YYYY-MM-DD)
      String dateStringA = nameA.substring(
          nameA.length - 10); // Asumiendo YYYY-MM-DD siempre al final
      String dateStringB = nameB.substring(nameB.length - 10);
      return dateStringB.compareTo(dateStringA); // Orden descendente
    });
    return logFiles;
  }
}
