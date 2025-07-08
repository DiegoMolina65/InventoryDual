import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/search_by_date_strategy.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/regular_search_strategy.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/search_strategy.dart';

enum TipoBusqueda { grupo, producto, ubicacion, codigo, regular, conFecha }

class StrategyFactory {
  static BusquedaStrategy obtenerStrategy(String tipoBusqueda) {

    TipoBusqueda tipo;
    try {
      tipo = TipoBusqueda.values.firstWhere(
        (e) => e.toString() == 'TipoBusqueda.$tipoBusqueda',
        orElse: () => TipoBusqueda.regular,
      );
    } catch (_) {
      tipo = TipoBusqueda.regular;
    }

    switch (tipo) {
      case TipoBusqueda.conFecha:
        return BusquedaConFechaStrategy();
      case TipoBusqueda.grupo:
      case TipoBusqueda.producto:
      case TipoBusqueda.ubicacion:
      case TipoBusqueda.codigo:
      case TipoBusqueda.regular:
      default:
        return BusquedaRegularStrategy();
    }
  }
}
