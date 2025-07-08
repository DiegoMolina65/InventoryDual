import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/provider/assigned_counts_provider.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/widgets/counts_list_widget.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/assigned_count_details_screen.dart';
import 'package:m_dual_inventario/shared/widgets/custom_filters/custom_filters_widget.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class ConteosAsignadosScreen extends ConsumerStatefulWidget {
  const ConteosAsignadosScreen({super.key});

  static const name = '/conteos-asignado';

  @override
  ConsumerState<ConteosAsignadosScreen> createState() =>
      _ConteosAsignadosScreenState();
}

class _ConteosAsignadosScreenState
    extends ConsumerState<ConteosAsignadosScreen> {
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(conteosAsignadosProvider.notifier).inicializarDatos();
    });
  }

  Future<void> _refrescarDatos() async {
    if (_isRefreshing) return;

    setState(() {
      _isRefreshing = true;
    });

    try {
      await ref.read(conteosAsignadosProvider.notifier).refrescarConteos();
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
        });
      }
    }
  }

  void _navegarADetalleConteo(Map<String, dynamic> parametros) async {
    ref.read(navegacionDetalleProvider.notifier).state = parametros;

    final resultado = await context.push(
      DetalleConteoAsignadoScreen.name,
      extra: {
        'tdi': parametros['tdi'],
        'nombre': parametros['nombre'],
        'nroConteo': parametros['nroConteo'],
        'usar_provider': true,
      },
    );

    ref.read(navegacionDetalleProvider.notifier).state = null;

    if (resultado == true && mounted) {
      CustomSnackBar.show(context,
          message: 'Actualizando lista de conteos...', type: SnackBarType.info);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(conteosAsignadosProvider);
    final conteosProvider = ref.read(conteosAsignadosProvider.notifier);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              CustomDropdownField<AlmacenXLocal>(
                label: 'Seleccionar Almacén',
                value: viewState.almacenSeleccionado,
                items: viewState.almacenes,
                getLabel: (almacen) => almacen.nombre,
                onChanged: (almacen) {
                  if (almacen != null) {
                    conteosProvider.seleccionarAlmacen(almacen);
                  }
                },
                primaryColor: primaryColor,
                prefixIcon: Icon(Icons.warehouse_outlined,
                    color: primaryColor, size: 25),
              ),
              const SizedBox(height: 10),
              const CustomFiltersWidget(),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refrescarDatos,
                  child: ListaConteosWidget(
                    onConteoTap: _navegarADetalleConteo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
