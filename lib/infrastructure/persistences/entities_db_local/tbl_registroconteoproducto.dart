import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';

@UseRowClass(RegistroConteoProducto)
class TblRegistroconteoproducto extends Table {
  IntColumn get codigo => integer().autoIncrement()();
  IntColumn get codigoConteo => integer()();
  TextColumn get codigoProducto => text()();
  RealColumn get cantidadContada => real()();
  TextColumn get fechaContada => text()();
  IntColumn get sincronizadoServidor => integer()();
  IntColumn get esConfirmado => integer().withDefault(const Constant(0))();
  TextColumn get codigoLote => text().withDefault(const Constant(''))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {codigoConteo, codigoProducto, codigoLote},
      ];
}
