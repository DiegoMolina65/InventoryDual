import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/datasource/conteo/conteo_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class ConteoLocalDatasourceImpl implements ConteoLocalDatasource {
  final database = AppDatabase();

  @override
  Future<bool> guardarRegistroConteoProductoLocal(
      RegistroConteoProducto registro) async {
    final companion = TblRegistroconteoproductoCompanion(
      codigo: registro.codigo != null
          ? Value(registro.codigo!)
          : const Value.absent(),
      codigoConteo: Value(registro.codigoConteo),
      codigoProducto: Value(registro.codigoProducto),
      codigoLote: Value(registro.codigoLote),
      cantidadContada: Value(registro.cantidadContada),
      fechaContada: Value(registro.fechaContada),
      sincronizadoServidor: Value(registro.sincronizadoServidor),
      esConfirmado: Value(registro.esConfirmado),
    );
    await database.into(database.tblRegistroconteoproducto).insert(
          companion,
          mode: InsertMode.insertOrReplace,
        );
    return true;
  }

  @override
  Future<RegistroConteoProducto?> obtenerRegistroConteoProductoPorLote({
    required int codigoConteo,
    required String codigoProducto,
    required String codigoLote,
  }) async {
    final query = database.select(database.tblRegistroconteoproducto)
      ..where((tbl) => tbl.codigoConteo.equals(codigoConteo))
      ..where((tbl) => tbl.codigoProducto.equals(codigoProducto))
      ..where((tbl) => tbl.codigoLote.equals(codigoLote));

    return await query.getSingleOrNull();
  }

  @override
  Future<List<RegistroConteoProducto>> obtenerRegistrosPendientes() async {
    final noSincronizado = database.select(database.tblRegistroconteoproducto)
      ..where((tbl) => tbl.sincronizadoServidor.equals(0)); 

    return await noSincronizado.get();
  }

  @override
  Future<void> marcarSincronizado(List<int> codigos) async {
    await database.batch((batch) {
      batch.update(
        database.tblRegistroconteoproducto,
        const TblRegistroconteoproductoCompanion(
          sincronizadoServidor: Value(1), // 1 para true
        ),
        where: (tbl) => tbl.codigo.isIn(codigos),
      );
    });
  }
}