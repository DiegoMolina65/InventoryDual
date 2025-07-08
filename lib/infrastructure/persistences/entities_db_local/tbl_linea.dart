import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';

@UseRowClass(Linea)
class TblLinea extends Table {
  IntColumn get codigo => integer()();
  TextColumn get descripcion => text()();

  @override
  Set<Column> get primaryKey => {codigo};
}
