import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/subgrupo/subgrupo_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class SubgrupoLocalDatasourceImpl extends SubgrupoLocalDatasource {
  final database = AppDatabase();

  @override
  Future<bool> guardarSubgrupo(ObtenerDatosApp obtenerDatosApp) async {
    try {
      await database.transaction(() async {
        await (database.delete(database.tblSubgrupo)).go();

        for (var subgrupo in obtenerDatosApp.subgrupos) {
          await database.into(database.tblSubgrupo).insert(
                TblSubgrupoCompanion.insert(
                  codigo: Value(subgrupo.codigo),
                  descripcion: subgrupo.descripcion,
                  grupoCodigo: subgrupo.grupoCodigo,
                  lineaCodigo: subgrupo.lineaCodigo,
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
  Future<List<Subgrupo>> obtenerSubgrupos() async {
    try {
      final query = database.select(database.tblSubgrupo);
      return await query.get();
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<Subgrupo>> obtenerSubgruposPorGrupo(int codigoGrupo) async {
    try {
      final query = database.select(database.tblSubgrupo)
        ..where((tbl) => tbl.grupoCodigo.equals(codigoGrupo));
      return await query.get();
    } catch (ex) {
      rethrow;
    }
  }
}
