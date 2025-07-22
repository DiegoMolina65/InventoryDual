import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/domain/repository/toma_inventario/toma_inventario_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/toma_inventario/toma_inventario_provider.dart';

final listaDetallesConteosReporteProvider = StateNotifierProvider.family<
    ListaDetallesConteosReporteNotifier,
    ListaDetallesConteosReporteState,
    int>((ref, codigoTomaInventario) {
  final tomaInventarioRepository = ref.read(tomaInventarioRepositoryProvider);
  return ListaDetallesConteosReporteNotifier(
    tomaInventarioRepository: tomaInventarioRepository,
    codigoTomaInventario: codigoTomaInventario,
  );
});

class ListaDetallesConteosReporteNotifier
    extends StateNotifier<ListaDetallesConteosReporteState> {
  final TomaInventarioRepository tomaInventarioRepository;
  final int codigoTomaInventario;

  ListaDetallesConteosReporteNotifier({
    required this.tomaInventarioRepository,
    required this.codigoTomaInventario,
  }) : super(const ListaDetallesConteosReporteState());

  Future<void> cargarTomaConResultados() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final tomaConResultados = await tomaInventarioRepository
          .obtenerTomaConResultados(codigoTomaInventario);

      state = state.copyWith(
        tomaInventario: tomaConResultados,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> finalizarToma(TomasInventario tomaInventario) async {
    await tomaInventarioRepository.finalizarToma(tomaInventario.codigo);
  }
}

class ListaDetallesConteosReporteState {
  final TomasInventario? tomaInventario;
  final bool isLoading;
  final String? error;

  const ListaDetallesConteosReporteState({
    this.tomaInventario,
    this.isLoading = false,
    this.error,
  });

  ListaDetallesConteosReporteState copyWith({
    TomasInventario? tomaInventario,
    bool? isLoading,
    String? error,
  }) {
    return ListaDetallesConteosReporteState(
      tomaInventario: tomaInventario ?? this.tomaInventario,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
