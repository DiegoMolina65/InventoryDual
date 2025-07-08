import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/producto/producto_provider.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/producto_mapper/producto_mapper.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/search_strategy.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/provider/product_search_provider.dart';

class BusquedaConFechaStrategy implements BusquedaStrategy {
  @override
  String get titulo => 'Búsqueda con Fecha';

  @override
  String get placeholderBusqueda => 'Buscar por nombre, código o ubicación';

  @override
  Map<String, dynamic> obtenerParametros(Map<String, dynamic> parametrosBase) {
    final Map<String, dynamic> parametros = {};
    if (parametrosBase['codigoAlmacen'] != null &&
        parametrosBase['codigoAlmacen'] > 0) {
      parametros['codigoAlmacen'] = parametrosBase['codigoAlmacen'];
    } else {
      return {};
    }
    if (parametrosBase['fecha'] != null &&
        parametrosBase['fecha'].toString().isNotEmpty) {
      try {
        if (parametrosBase['fecha'] is DateTime) {
          parametros['fechaToma'] = parametrosBase['fecha'];
        } else {
          final fecha = DateTime.tryParse(parametrosBase['fecha'].toString());
          if (fecha != null) {
            parametros['fechaToma'] = fecha;
          } else {
            return {};
          }
        }
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }

    if (parametrosBase['codigoLinea'] != null &&
        parametrosBase['codigoLinea'] > 0) {
      parametros['codigoLinea'] = parametrosBase['codigoLinea'];
    }

    if (parametrosBase['codigoGrupo'] != null &&
        parametrosBase['codigoGrupo'] > 0) {
      parametros['codigoGrupo'] = parametrosBase['codigoGrupo'];
    }

    if (parametrosBase['codigoSubgrupo'] != null &&
        parametrosBase['codigoSubgrupo'] > 0) {
      parametros['codigoSubgrupo'] = parametrosBase['codigoSubgrupo'];
    }

    if (parametrosBase['nombreProducto']?.toString().isNotEmpty == true) {
      parametros['nombreProducto'] = parametrosBase['nombreProducto'];
    }

    if (parametrosBase['ubicacion']?.toString().isNotEmpty == true) {
      parametros['ubicacion'] = parametrosBase['ubicacion'];
    }

    if (parametrosBase['codigoBarra']?.toString().isNotEmpty == true) {
      parametros['codigoBarra'] = parametrosBase['codigoBarra'];
    }

    return parametros;
  }

  @override
  Future<void> buscarProductos({
    required BusquedaProductoNotifier notifier,
    required Map<String, dynamic> parametros,
    required Ref ref,
  }) async {
    try {
      notifier.establecerCargando();
      final repository = ref.read(productoRepositoryProvider);
      final productosModel = await repository.buscarProductosPorAlmacenXFecha(
        codigoAlmacen: parametros['codigoAlmacen'] ?? 0,
        fecha: parametros['fechaToma'],
        codigoLinea: parametros['codigoLinea'] ?? 0,
        codigoGrupo: parametros['codigoGrupo'] ?? 0,
        codigoSubgrupo: parametros['codigoSubgrupo'] ?? 0,
        nombreProducto: parametros['nombreProducto'] ?? '',
        ubicacion: parametros['ubicacion'],
        codigoBarra: parametros['codigoBarra'],
      );
      final productos = productosModel
          .map((producto) => ProductoMapper.mapearProducto(producto))
          .toList();

      notifier.actualizarProductos(productos);
    } catch (e) {
      rethrow;
    }
  }
}
