import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';

@UseRowClass(Grupo)
class TblGrupo extends Table {
  IntColumn get codigo => integer()();
  TextColumn get descripcion => text()();
  IntColumn get lineaCodigo => integer()();

  @override
  Set<Column> get primaryKey => {codigo};
}