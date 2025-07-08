import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';

abstract class GrupoLocalDatasource {
  Future<bool> guardarGrupo(ObtenerDatosApp obtenerDatosApp);

  // Obtener todos los grupos
  Future<List<Grupo>> obtenerGrupos();

  // Obtener grupos por línea
  Future<List<Grupo>> obtenerGruposPorLinea(int codigoLinea);
}
