import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/grupo/grupo_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class GrupoLocalDatasourceImpl extends GrupoLocalDatasource {
  final database = AppDatabase();

  @override
  Future<bool> guardarGrupo(ObtenerDatosApp obtenerDatosApp) async {
    try {
      await database.transaction(() async {
        await (database.delete(database.tblGrupo)).go();

        for (var grupo in obtenerDatosApp.grupos) {
          await database.into(database.tblGrupo).insert(
                TblGrupoCompanion.insert(
                  codigo: Value(grupo.codigo),
                  descripcion: grupo.descripcion,
                  lineaCodigo: grupo.lineaCodigo,
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
  Future<List<Grupo>> obtenerGrupos() async {
    try {
      final query = database.select(database.tblGrupo);
      return await query.get();
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<Grupo>> obtenerGruposPorLinea(int codigoLinea) async {
    try {
      final query = database.select(database.tblGrupo)
        ..where((tbl) => tbl.lineaCodigo.equals(codigoLinea));
      return await query.get();
    } catch (ex) {
      rethrow;
    }
  }
}
