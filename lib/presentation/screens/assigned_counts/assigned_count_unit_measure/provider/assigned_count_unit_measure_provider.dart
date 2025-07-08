import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';

class EntradaConteo {
  final double cantidad;
  final UnidadMedida unidadMedida;
  final double cantidadEnUnidadBase;
  final DateTime fecha;

  EntradaConteo({
    required this.cantidad,
    required this.unidadMedida,
    required this.cantidadEnUnidadBase,
    required this.fecha,
  });
}

class AssignedCountUnitMeasureState {
  final List<EntradaConteo> entradas;
  final UnidadMedida unidadSeleccionada;
  final UnidadMedida unidadBase;
  final double total;

  AssignedCountUnitMeasureState({
    required this.entradas,
    required this.unidadSeleccionada,
    required this.unidadBase,
    required this.total,
  });

  Map<int, double> get conteosPorUnidad {
    final Map<int, double> conteos = {};

    for (final entrada in entradas) {
      final codigoUnidad = entrada.unidadMedida.codigo;
      conteos[codigoUnidad] = (conteos[codigoUnidad] ?? 0) + entrada.cantidad;
    }

    return conteos;
  }

  AssignedCountUnitMeasureState copyWith({
    List<EntradaConteo>? entradas,
    UnidadMedida? unidadSeleccionada,
    UnidadMedida? unidadBase,
    double? total,
  }) {
    return AssignedCountUnitMeasureState(
      entradas: entradas ?? this.entradas,
      unidadSeleccionada: unidadSeleccionada ?? this.unidadSeleccionada,
      unidadBase: unidadBase ?? this.unidadBase,
      total: total ?? this.total,
    );
  }

  factory AssignedCountUnitMeasureState.initial({
    required UnidadMedida unidadInicial,
    required UnidadMedida unidadBase,
    double cantidadInicial = 0.0,
  }) {
    final List<EntradaConteo> entrada = cantidadInicial > 0
        ? [
            EntradaConteo(
              cantidad: cantidadInicial,
              unidadMedida: unidadBase,
              cantidadEnUnidadBase: cantidadInicial,
              fecha: DateTime.now(),
            )
          ]
        : <EntradaConteo>[];

    return AssignedCountUnitMeasureState(
      entradas: entrada,
      unidadSeleccionada: unidadInicial,
      unidadBase: unidadBase,
      total: cantidadInicial,
    );
  }
}

class AssignedCountUnitMeasureNotifier
    extends StateNotifier<AssignedCountUnitMeasureState> {
  AssignedCountUnitMeasureNotifier(AssignedCountUnitMeasureState initial)
      : super(initial);

  void cambiarUnidadSeleccionada(UnidadMedida unidad) {
    state = state.copyWith(unidadSeleccionada: unidad);
  }

  void agregarEntrada(double cantidad) {
    if (cantidad <= 0) return;

    final cantidadBase = cantidad * state.unidadSeleccionada.relacion;

    final nuevaEntrada = EntradaConteo(
      cantidad: cantidad,
      unidadMedida: state.unidadSeleccionada,
      cantidadEnUnidadBase: cantidadBase,
      fecha: DateTime.now(),
    );

    final nuevasEntradas = [...state.entradas, nuevaEntrada];
    final total = nuevasEntradas.fold<double>(
        0.0, (sum, e) => sum + e.cantidadEnUnidadBase);

    state = state.copyWith(
      entradas: nuevasEntradas,
      total: total,
    );
  }

  void eliminarEntrada(int index) {
    final nuevasEntradas = [...state.entradas]..removeAt(index);
    final total = nuevasEntradas.fold<double>(
        0.0, (sum, e) => sum + e.cantidadEnUnidadBase);

    state = state.copyWith(
      entradas: nuevasEntradas,
      total: total,
    );
  }
}

final assignedCountUnitMeasureProvider = StateNotifierProvider.autoDispose
    .family<AssignedCountUnitMeasureNotifier, AssignedCountUnitMeasureState,
        DetalleRecuentoInventario>(
  (ref, producto) {
    final unidadBase = producto.producto!.listaUnidadMedida.firstWhere(
      (u) => u.relacion == 1.0,
      orElse: () => producto.producto!.listaUnidadMedida.first,
    );
    return AssignedCountUnitMeasureNotifier(
      AssignedCountUnitMeasureState.initial(
        unidadInicial: unidadBase,
        unidadBase: unidadBase,
        cantidadInicial: producto.cantidadConteo,
      ),
    );
  },
);
