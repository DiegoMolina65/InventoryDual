import 'package:drift/drift.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';

@UseRowClass(Usuario)
class TblUsuario extends Table {
  IntColumn get codigo => integer()();
  TextColumn get nombre => text()();
  IntColumn get codigoLocal => integer()();
  TextColumn get nombreLocal => text()();
  IntColumn get codigoAlmacen => integer()();
  TextColumn get usuario => text()();
  TextColumn get contrasenia => text()();
  IntColumn get codigoListaPrecios => integer()();
  IntColumn get codigoMoneda => integer()();
  RealColumn get valorMoneda => real()();
  TextColumn get nombreClientePredeterminado => text()();
  IntColumn get codigoClientePredeterminado => integer()();
  BoolColumn get esSupervisor => boolean()();

  @override
  Set<Column> get primaryKey => {codigo};
}
