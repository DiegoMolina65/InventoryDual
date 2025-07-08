import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/provider/product_search_provider.dart';

abstract class BusquedaStrategy {
  String get titulo;
  String get placeholderBusqueda;

  Map<String, dynamic> obtenerParametros(Map<String, dynamic> parametrosBase);

  Future<void> buscarProductos({
    required BusquedaProductoNotifier notifier,
    required Map<String, dynamic> parametros,
    required Ref ref,
  });
}
