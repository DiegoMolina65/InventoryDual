import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/provider/lista_detalles_conteos_reporte_provider.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/widgets/cabecera_detalle_toma_inventario_widget.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/widgets/tabla_conteos_productos_widgets.dart';

class ListaDetallesConteosReporteScreen extends ConsumerStatefulWidget {
  const ListaDetallesConteosReporteScreen({
    super.key,
    required this.parametros,
  });

  static const name = '/lista-detalles-conteos-reporte';
  final Map<String, dynamic> parametros;

  @override
  ConsumerState<ListaDetallesConteosReporteScreen> createState() =>
      _ListaDetallesConteosReporteScreenState();
}

class _ListaDetallesConteosReporteScreenState
    extends ConsumerState<ListaDetallesConteosReporteScreen> {
  late int codigoTomaInventario;

  @override
  void initState() {
    super.initState();

    // Extraer parámetros
    codigoTomaInventario = widget.parametros['codigoTomaInventario'] ?? 0;

    // Cargar datos después del primer frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(listaDetallesConteosReporteProvider(codigoTomaInventario)
              .notifier)
          .cargarTomaConResultados();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(listaDetallesConteosReporteProvider(codigoTomaInventario));
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Conteos'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (state.tomaInventario != null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref
                    .read(listaDetallesConteosReporteProvider(
                            codigoTomaInventario)
                        .notifier)
                    .cargarTomaConResultados();
              },
            ),
        ],
      ),
      body: _buildBody(state, primaryColor),
    );
  }

  Widget _buildBody(
      ListaDetallesConteosReporteState state, Color primaryColor) {
    if (state.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 3,
              color: primaryColor,
            ),
            const SizedBox(height: 16),
            const Text(
              'Cargando detalles de la toma...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (state.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'Error al cargar los datos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(listaDetallesConteosReporteProvider(
                              codigoTomaInventario)
                          .notifier)
                      .cargarTomaConResultados();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (state.tomaInventario == null) {
      return const Center(
        child: Text(
          'No se encontraron datos para esta toma',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    // Mostrar los widgets personalizados
    return Column(
      children: [
        // Widget de cabecera
        CabeceraDetalleTomaInventarioWidget(
          tomaInventario: state.tomaInventario!,
        ),

        // Widget de tabla de conteos
        Expanded(
          child: TablaConteosProductosWidget(
            listaDetalleProducto:
                state.tomaInventario!.listaDetalleProducto ?? [],
          ),
        ),
      ],
    );
  }
}
