import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';

@UseRowClass(AlmacenXLocal)
class TblAlmacenxlocal extends Table {
  IntColumn get codigo => integer()();
  TextColumn get nombre => text()();

  @override
  Set<Column> get primaryKey => {codigo};
}
