import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:m_dual_inventario/domain/datasource/almacen/almacen_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class AlmacenLocalDatasourceImpl extends AlmacenLocalDatasource {
  final database = AppDatabase();

//Guardar datos /Almacen/listarActivosPorLocal
  @override
  Future<bool> guardarDatosAlmacen(List<AlmacenXLocal> almacenXLocal) async {
    try {
      await database.transaction(() async {
        await (database.delete(database.tblAlmacenxlocal)).go();

        for (var almacen in almacenXLocal) {
          await database.into(database.tblAlmacenxlocal).insert(
                TblAlmacenxlocalCompanion.insert(
                  codigo: Value(almacen.codigo),
                  nombre: almacen.nombre,
                ),
              );
        }
      });
      return true;
    } catch (ex) {
      if (kDebugMode) {
        print("Error AlmacenXLocalDatasourceImpl->guardarALmacenXLocal: $ex");
      }
      rethrow;
    }
  }

  @override
  Future<List<AlmacenXLocal>> obtenerAlmacenesPorLocal() async {
    try {
      final query = database.select(database.tblAlmacenxlocal);

      return await query.get();
    } catch (ex) {
      if (kDebugMode) {
        print(
            "Error AlmacenXLocalDatasourceImpl->obtenerAlmacenesPorLocal: $ex");
      }
      rethrow;
    }
  }
}
