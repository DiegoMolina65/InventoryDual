import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';

abstract class SubGrupoRepository {
  Future<List<Subgrupo>> obtenerSubgruposPorGrupo(int codigoGrupo);
  Future<List<Subgrupo>> obtenerSubgrupos();
}
