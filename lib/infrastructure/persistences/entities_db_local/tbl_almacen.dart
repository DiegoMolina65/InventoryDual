import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/almacen/almacen.dart';

@UseRowClass(Almacen)
class TblAlmacen extends Table {
  IntColumn get codigo => integer()();
  TextColumn get nombre => text()();

  @override
  Set<Column> get primaryKey => {codigo};
}
