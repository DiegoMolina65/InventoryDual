import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_unit_measure/provider/assigned_count_unit_measure_provider.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_unit_measure/widgets/input_unit_measure_widget.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_unit_measure/widgets/item_card_widget_product.dart';

class UnidadDeMedidadConteoAsignado extends ConsumerStatefulWidget {
  final DetalleRecuentoInventario detalleProducto;
  final double cantidadActual;
  final UnidadMedida unidadMedida;

  const UnidadDeMedidadConteoAsignado({
    super.key,
    required this.detalleProducto,
    required this.cantidadActual,
    required this.unidadMedida,
  });

  static const name = '/assigned-count-unit-measure';

  @override
  ConsumerState<UnidadDeMedidadConteoAsignado> createState() =>
      _AssignedCountUnitMeasureScreenState();
}

class _AssignedCountUnitMeasureScreenState
    extends ConsumerState<UnidadDeMedidadConteoAsignado> {
  double _cantidadTotal = 0.0;
  bool _isFormDirty = false;

  @override
  void initState() {
    super.initState();
    _cantidadTotal = widget.cantidadActual;
  }

  String _generarDescripcionConteo() {
    final state =
        ref.read(assignedCountUnitMeasureProvider(widget.detalleProducto));
    List<String> descripciones = [];
    state.conteosPorUnidad.forEach((codigoUnidad, cantidad) {
      if (cantidad > 0) {
        final unidadMedida =
            widget.detalleProducto.producto?.listaUnidadMedida.firstWhere(
          (um) => um.codigo == codigoUnidad,
          orElse: () =>
              widget.detalleProducto.producto!.listaUnidadMedida.first,
        );

        String cantidadFormateada = cantidad % 1 == 0
            ? cantidad.toInt().toString()
            : cantidad.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');

        descripciones
            .add('$cantidadFormateada ${unidadMedida?.descripcion ?? 'UND'}');
      }
    });
    return descripciones.join(' y ');
  }

  Map<String, dynamic> _crearResultado() {
    final cantidadFormateada = _cantidadTotal % 1 == 0
        ? _cantidadTotal.toInt().toDouble()
        : double.parse(_cantidadTotal.toStringAsFixed(2));

    return {
      'cantidad': cantidadFormateada,
      'descripcion': _generarDescripcionConteo(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final state =
        ref.watch(assignedCountUnitMeasureProvider(widget.detalleProducto));

    if (_cantidadTotal != state.total) {
      setState(() {
        _cantidadTotal = state.total;
        _isFormDirty = true;
      });
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: _buildAppBar(colorScheme),
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomBar(theme),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(ColorScheme colorScheme) {
    return AppBar(
      title: const Text(
        'Registro de Unidades',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      elevation: 0,
      backgroundColor: colorScheme.primary,
      foregroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemCardWidgetProduct(
                  detalleRecuentoInventario: widget.detalleProducto),
              InputUnitMeasureWidget(
                detalleRecuentoInventario: widget.detalleProducto,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  final resultado = _crearResultado();
                  context.pop(resultado);
                },
                icon: const Icon(Icons.save),
                label: const Text('Guardar Conteo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DetalleRecuentoInventario get producto => widget.detalleProducto;
}
