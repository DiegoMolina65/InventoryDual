import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/unidad_medida/unidad_medida__local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class UnidadMedidaLocalDatasourceImpl extends UnidadMedidaLocalDatasource {
  @override
  Future<bool> guardarUnidadMedida(ObtenerDatosApp obtenerDatosApp) async {
    final database = AppDatabase();

    try {
      await database.transaction(() async {
        await (database.delete(database.tblUnidadmedida)).go();
        for (var unidad in obtenerDatosApp.unidadmedida ?? []) {
          await database.into(database.tblUnidadmedida).insert(
                TblUnidadmedidaCompanion.insert(
                  codigo: Value(unidad.codigo),
                  codigoProducto: unidad.codigoProducto,
                  articulo: unidad.articulo,
                  relacion: unidad.relacion,
                  descuento: unidad.descuento,
                  descripcion: unidad.descripcion,
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
