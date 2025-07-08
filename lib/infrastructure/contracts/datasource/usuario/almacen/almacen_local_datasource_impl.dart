import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/almacen/almacen_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class AlmacenLocalDatasourceImpl extends AlmacenLocalDatasource {
  final database = AppDatabase();

  @override
  Future<bool> guardarAlmacen(ObtenerDatosApp obtenerDatosApp) async {
    try {
      await database.transaction(() async {
        await (database.delete(database.tblAlmacen)).go();

        for (var almacen in obtenerDatosApp.almacenes) {
          await database.into(database.tblAlmacen).insert(
                TblAlmacenCompanion.insert(
                  codigo: Value(almacen.codigo),
                  nombre: almacen.nombre,
                ),
              );
        }
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
