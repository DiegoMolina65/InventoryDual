import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/provider/lista_detalles_conteos_reporte_provider.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/widgets/cabecera_detalle_toma_inventario_widget.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/widgets/dialogs/finalizar_toma_dialogo.dart';
import 'package:m_dual_inventario/presentation/screens/reporte_tomas_inventario/lista_detalles_conteos_reporte/widgets/tabla_conteos_productos_widgets.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

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
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
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
      floatingActionButton: state.tomaInventario != null
          ? CustomFloatingActionButton(
              onPressed: () => _manejarFinalizarToma(state),
              icon: Icons.check,
              withContainer: true,
            )
          : null,
    );
  }

  void _manejarFinalizarToma(ListaDetallesConteosReporteState state) async {
    final toma = state.tomaInventario;

    if (toma == null) return;

    if ((toma.estado).toUpperCase() == 'FINALIZADO') {
      CustomSnackBar.show(context,
          message: 'La toma ya fue finalizada.', type: SnackBarType.info);
      return;
    }

    final resultadoValidacion = _validarEstadoProductos(state);

    if (!resultadoValidacion.todosCorrectos) {
      await DialogoDetalleReporteHelper.mostrarErrorValidacion(
        context,
        resultadoValidacion,
      );
      return;
    }

    final confirmado = await DialogoDetalleReporteHelper.confirmarFinalizarToma(
      context,
      ref,
    );

    if (confirmado) {
      _finalizarToma();
    }
  }

  Future<void> _finalizarToma() async {
    final toma = ref
        .read(listaDetallesConteosReporteProvider(codigoTomaInventario))
        .tomaInventario;

    if (toma == null) return;

    try {
      await ref
          .read(listaDetallesConteosReporteProvider(codigoTomaInventario)
              .notifier)
          .finalizarToma(toma);

      if (!mounted) return;

      CustomSnackBar.show(
        context,
        message: 'Toma de inventario finalizada correctamente',
        type: SnackBarType.success,
      );

      await Future.delayed(const Duration(microseconds: 500));

      await ref
          .read(listaDetallesConteosReporteProvider(codigoTomaInventario)
              .notifier)
          .cargarTomaConResultados();
    } catch (e) {
      rethrow;
    }
  }

  ValidationResult _validarEstadoProductos(
      ListaDetallesConteosReporteState state) {
    final productos = state.tomaInventario?.listaDetalleProducto ?? [];
    int correctos = 0;
    int conDiferencia = 0;
    int sinConteo = 0;

    for (final detalle in productos) {
      final resultado = _calcularResultadoProducto(detalle);
      switch (resultado.toLowerCase()) {
        case 'correcto':
          correctos++;
          break;
        case 'con diferencia':
          conDiferencia++;
          break;
        case 'sin conteo':
          sinConteo++;
          break;
      }
    }

    return ValidationResult(
      totalProductos: productos.length,
      correctos: correctos,
      conDiferencia: conDiferencia,
      sinConteo: sinConteo,
      todosCorrectos: conDiferencia == 0 && sinConteo == 0 && correctos > 0,
    );
  }

  String _calcularResultadoProducto(dynamic detalle) {
    final conteosAgrupados = <String, List<dynamic>>{};

    // Agrupar conteos por usuario
    for (final conteo in (detalle.listaConteoResultado ?? [])) {
      final nombreUsuario = conteo.nombreUsuario;
      if (conteosAgrupados.containsKey(nombreUsuario)) {
        conteosAgrupados[nombreUsuario]!.add(conteo);
      } else {
        conteosAgrupados[nombreUsuario] = [conteo];
      }
    }

    if (conteosAgrupados.isEmpty) {
      return 'Sin Conteo';
    }

    // Obtener cantidades válidas (mayores a 0)
    final todasLasCantidades = <double>[];
    for (final conteos in conteosAgrupados.values) {
      for (final conteo in conteos) {
        if (conteo.cantidadContada > 0) {
          todasLasCantidades.add(conteo.cantidadContada);
        }
      }
    }

    if (todasLasCantidades.isEmpty) {
      return 'Sin Conteo';
    }

    final primeraCantidad = todasLasCantidades.first;
    final todasIguales =
        todasLasCantidades.every((cantidad) => cantidad == primeraCantidad);

    return todasIguales ? 'Correcto' : 'Con Diferencia';
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
