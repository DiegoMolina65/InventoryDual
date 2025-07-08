import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';

@UseRowClass(UnidadMedida)
class TblUnidadmedida extends Table {
  IntColumn get codigo => integer()();
  TextColumn get codigoProducto => text()();
  IntColumn get articulo => integer()();
  RealColumn get relacion => real()();
  RealColumn get descuento => real()();
  TextColumn get descripcion => text()();

  @override
  Set<Column> get primaryKey => {codigo};
}
