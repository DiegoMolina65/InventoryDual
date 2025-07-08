import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/linea/linea_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/linea/linea.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class LineaLocalDatasourceImpl extends LineaLocalDatasource {
  final database = AppDatabase();

  @override
  Future<bool> guardarLinea(ObtenerDatosApp obtenerDatosApp) async {
    try {
      await database.transaction(() async {
        await (database.delete(database.tblLinea)).go();

        for (var linea in obtenerDatosApp.lineas) {
          await database.into(database.tblLinea).insert(
                TblLineaCompanion.insert(
                  codigo: Value(linea.codigo),
                  descripcion: linea.descripcion,
                ),
              );
        }
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Linea>> obtenerLineas() async {
    try {
      final query = database.select(database.tblLinea);
      return await query.get();
    } catch (ex) {
      rethrow;
    }
  }
}
