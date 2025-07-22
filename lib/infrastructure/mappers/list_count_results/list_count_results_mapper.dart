import 'package:m_dual_inventario/domain/entities/lista_conteo_resultados/lista_conteo_resultados_entidad.dart';
import 'package:m_dual_inventario/infrastructure/models/list_count_results/list_count_results_model.dart';

class ListCountResultsMapper {

  // Mapea un modelo (ListCountResultsModel) a una entidad (ListaConteoResultadosEntidad)
  static ListaConteoResultadosEntidad mapearListaConteoResultado(
      ListCountResultsModel listCountResultModel) {
    return ListaConteoResultadosEntidad(
        codigoConteoInventario: listCountResultModel.codeCountInventory,
        codigoUsuario: listCountResultModel.codeUser,
        nombreUsuario: listCountResultModel.nameUser,
        cantidadContada: listCountResultModel.quantityCount);
  }


   // Mapea una entidad (ListaConteoResultadosEntidad) a un modelo (ListCountResultsModel)
  static ListCountResultsModel mapearAListaConteoResultado(
      ListaConteoResultadosEntidad listaConteoResultado) {
    return ListCountResultsModel(
        codeCountInventory: listaConteoResultado.codigoConteoInventario,
        codeUser: listaConteoResultado.codigoUsuario,
        nameUser: listaConteoResultado.nombreUsuario,
        quantityCount: listaConteoResultado.cantidadContada);
  }
}
