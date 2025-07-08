import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';

abstract class GrupoRepository {
  Future<List<Grupo>> obtenerGrupos();
  Future<List<Grupo>> obtenerGruposPorLinea(int codigoLinea);
}
