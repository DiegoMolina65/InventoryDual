import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';

abstract class SubgrupoLocalDatasource {
  Future<bool> guardarSubgrupo(ObtenerDatosApp obtenerDatosApp);

  // Obtener todos los subgrupos
  Future<List<Subgrupo>> obtenerSubgrupos();

  // Obtener subgrupos por grupo
  Future<List<Subgrupo>> obtenerSubgruposPorGrupo(int codigoGrupo);
}
