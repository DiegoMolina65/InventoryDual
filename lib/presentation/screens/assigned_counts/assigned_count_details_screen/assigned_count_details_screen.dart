import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/provider/assigned_count_details_provider.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/widgets/products_header_widget.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/widgets/dialog/assigned_count_details_helper_dialog.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/assigned_counts_screen.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_counts_screen/provider/assigned_counts_provider.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/indicador_de_progreso_future_extension.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

final detalleConteoProductosBuscadorProvider =
    localSearchProviderFamily<DetalleRecuentoInventario>(
  'detalle_conteo_productos',
  customFilter: (String texto, DetalleRecuentoInventario detalle) {
    final producto = detalle.producto;
    if (producto == null) return false;

    return producto.nombre.toUpperCase().contains(texto) ||
        producto.codigo.toString().contains(texto) ||
        (producto.ubicacion.toUpperCase().contains(texto)) ||
        (producto.codigoBarra.toUpperCase().contains(texto));
  },
);

class DetalleConteoAsignadoScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> parametros;

  const DetalleConteoAsignadoScreen({
    super.key,
    required this.parametros,
  });

  static const name = '/detalle-conteo-asignado';

  @override
  ConsumerState<DetalleConteoAsignadoScreen> createState() =>
      _DetalleConteoAsignadoScreenState();
}

class _DetalleConteoAsignadoScreenState
    extends ConsumerState<DetalleConteoAsignadoScreen> {
  final _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late int _tdi;
  late String _nombreToma;
  late int _nroConteo;
  late int _codigoAlmacen;
  int _totalProductos = 0;
  int _totalProductosPendientes = 0;

  @override
  void initState() {
    super.initState();
    _inicializarParametros();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inicializarDetalleConteo();
    });
  }

  void _inicializarParametros() {
    _tdi = widget.parametros['tdi'] as int;
    _nombreToma = widget.parametros['nombre'] as String;
    _nroConteo = widget.parametros['nroConteo'] as int;
    final almacenSeleccionado =
        ref.read(conteosAsignadosProvider).almacenSeleccionado;
    _codigoAlmacen = almacenSeleccionado?.codigo ??
        (throw StateError('No hay almacén seleccionado al iniciar detalle'));
  }

  void _toggleVista() {
    ref.read(detalleConteoAsignadoProvider.notifier).toggleMostrarContados();
  }

  Future<void> _inicializarDetalleConteo() async {
    final detalleProvider = ref.read(detalleConteoAsignadoProvider.notifier);

    if (widget.parametros['usar_provider'] == true) {
      final parametrosCompletos = ref.read(navegacionDetalleProvider);

      if (parametrosCompletos != null &&
          parametrosCompletos.containsKey('productos')) {
        List<DetalleRecuentoInventario> productos =
            parametrosCompletos['productos'] as List<DetalleRecuentoInventario>;

        final int codigoConteo = parametrosCompletos.containsKey('codigo')
            ? parametrosCompletos['codigo'] as int
            : parametrosCompletos.containsKey('conteoId')
                ? parametrosCompletos['conteoId'] as int
                : 0;

        final String estadoConteo =
            parametrosCompletos.containsKey('estadoConteo')
                ? parametrosCompletos['estadoConteo'] as String
                : 'PENDIENTE';

        final int codigoUsuarioAsignado =
            parametrosCompletos.containsKey('codigoUsuarioAsignado')
                ? parametrosCompletos['codigoUsuarioAsignado'] as int
                : await AppPreference.getValue<int>(
                        KeyAppPreferences.codigoUsuario) ??
                    0;

        final conteo = ConteoInventario(
          codigo: codigoConteo,
          numeroConteo: _nroConteo,
          codigoTI: _tdi,
          codigoAlmacen: _codigoAlmacen,
          codigoUsuarioAsignado: codigoUsuarioAsignado,
          fechaCreacion: DateTime.now(),
          fechaInicio: DateTime.now(),
          fechaFin: DateTime.now(),
          estadoConteo: estadoConteo,
          tipo: '',
          nombreTomaInventario: _nombreToma,
          turnoTrabajo: null,
          listaDetalleRecuentoInventario: productos,
        );

        detalleProvider.inicializarConProductos(conteo);
      } else {
        await detalleProvider.cargarDetalleConteo(_tdi);
      }
    }
    _actualizarContadoresReales();

    final conteo = ref.read(detalleConteoAsignadoProvider).conteoInventario;
    if (conteo != null) {
      ref
          .read(detalleConteoProductosBuscadorProvider.notifier)
          .updateOriginalList(conteo.listaDetalleRecuentoInventario);
    }
  }

  void _actualizarContadoresReales() {
    final state = ref.read(detalleConteoAsignadoProvider);
    if (state.conteoInventario != null) {
      _totalProductos =
          state.conteoInventario!.listaDetalleRecuentoInventario.length;

      final pendientes = state.conteoInventario!.listaDetalleRecuentoInventario
          .where(
            (detalle) => !(detalle.esConfirmado ?? false),
          )
          .length;

      _totalProductosPendientes = pendientes;
    }
  }

  void _confirmarGuardarConteo(BuildContext context) async {
    final state = ref.read(detalleConteoAsignadoProvider);
    final estadoConteo = state.conteoInventario?.estadoConteo.toUpperCase();

    if (estadoConteo == 'FINALIZADO') {
      CustomSnackBar.show(context,
          message: 'La toma ya fue finalizada', type: SnackBarType.warning);
      return;
    }

    if (_totalProductosPendientes > 0) {
      _mostrarMensajeNoGuardar(context);
      return;
    }

    final debeGuardar =
        await DialogoDetalleConteoHelper.confirmarFinalizarConteo(
      context,
      ref,
    );

    if (debeGuardar && context.mounted) {
      final conteoState = ref.read(detalleConteoAsignadoProvider);
      final estadoAnterior = conteoState.conteoInventario?.estadoConteo;

      final resultado = await Future(() =>
              ref.read(detalleConteoAsignadoProvider.notifier).guardarConteo())
          .ejecutar();
      if (!context.mounted) return;
      if (resultado > 0) {
        CustomSnackBar.show(context,
            message: 'Conteo finalizado correctamente',
            type: SnackBarType.success);

        final estadoActual = ref
            .read(detalleConteoAsignadoProvider)
            .conteoInventario
            ?.estadoConteo;
        final cambioEstado = estadoAnterior != estadoActual;

        if (cambioEstado && context.mounted) {
          context.go(ConteosAsignadosScreen.name);
        }
      }
    }
  }

  void _mostrarMensajeNoGuardar(BuildContext context) {
    CustomSnackBar.show(context,
        message:
            'No puede guardar el conteo porque faltan productos por confirmar',
        type: SnackBarType.warning);
  }

  void _volverAPantallaAnterior() {
    context.go(ConteosAsignadosScreen.name);
  }

  String _formatearResultadoBusqueda(List<DetalleRecuentoInventario> lista) {
    final totalEncontrados = lista.length;
    if (totalEncontrados == 0) return 'No se encontraron productos';

    final contados = lista.where((item) => item.esConfirmado ?? false).length;
    final pendientes =
        lista.where((item) => !(item.esConfirmado ?? false)).length;

    String resultado = 'Encontrados: $totalEncontrados';

    if (contados > 0 && pendientes > 0) {
      resultado += ' ($pendientes en PENDIENTES, $contados en CONTADOS)';
    } else if (contados > 0) {
      resultado += ' (todos en CONTADOS)';
    } else if (pendientes > 0) {
      resultado += ' (todos en PENDIENTES)';
    }
    return resultado;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final state = ref.watch(detalleConteoAsignadoProvider);

    ref.listen(detalleConteoAsignadoProvider, (previous, current) {
      if (current.conteoInventario != null &&
          (previous?.conteoInventario == null ||
              previous!.conteoInventario!.listaDetalleRecuentoInventario !=
                  current.conteoInventario!.listaDetalleRecuentoInventario)) {
        ref
            .read(detalleConteoProductosBuscadorProvider.notifier)
            .updateOriginalList(
                current.conteoInventario!.listaDetalleRecuentoInventario);
      }
    });

    if (state.conteoInventario != null) {
      _totalProductos =
          state.conteoInventario!.listaDetalleRecuentoInventario.length;
      _totalProductosPendientes = state
          .conteoInventario!.listaDetalleRecuentoInventario
          .where((detalle) => !(detalle.esConfirmado ?? false))
          .length;
    }

    final buscadorState = ref.watch(detalleConteoProductosBuscadorProvider);
    final productosPendientes = buscadorState.filteredList
        .where((p) => !(p.esConfirmado ?? false))
        .toList();
    final productosContados = buscadorState.filteredList
        .where((p) => p.esConfirmado ?? false)
        .toList();

    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    _nombreToma,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (state.conteoInventario != null)
                  buildEstadoChip(state.conteoInventario!.estadoConteo),
              ],
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25,
              onPressed: () async {
                final shouldPop =
                    await DialogoDetalleConteoHelper.confirmarSalida(context);
                if (shouldPop && context.mounted) {
                  _volverAPantallaAnterior();
                }
              },
            ),
          ),
          backgroundColor: Colors.grey[50],
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CabeceraProductosWidget(
                        cantidadPendientes: _totalProductosPendientes,
                        cantidadTotal: _totalProductos,
                        mostrandoContados: state.mostrarContados,
                        onToggleVista: _toggleVista,
                        filtroActivo: state.filtroActivo,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: primaryColor),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Buscador en la lista de productos:',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BuscadorLocalWidget<DetalleRecuentoInventario>(
                      provider: detalleConteoProductosBuscadorProvider,
                      hintText: 'Buscar por nombre, código o ubicación',
                      formatCount: (found, total) =>
                          _formatearResultadoBusqueda(
                        ref
                            .read(detalleConteoProductosBuscadorProvider)
                            .filteredList,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                Flexible(
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (state.mostrarContados
                              ? productosContados.isEmpty
                              : productosPendientes.isEmpty)
                          ? Center(
                              child: Text(
                                state.mostrarContados
                                    ? 'No hay productos contados'
                                    : 'No hay productos pendientes por contar',
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.builder(
                              controller: _scrollController,
                              padding: const EdgeInsets.only(bottom: 80),
                              itemCount: state.mostrarContados
                                  ? productosContados.length
                                  : productosPendientes.length,
                              itemBuilder: (context, index) {
                                final detalleProducto = state.mostrarContados
                                    ? productosContados[index]
                                    : productosPendientes[index];

                                return CustomProductCard(
                                  detalleRecuentoInventario: detalleProducto,
                                  // onTap: () {
                                  //   DialogoDetalleConteoHelper
                                  //       .mostrarContarProducto(
                                  //     context: context,
                                  //     ref: ref,
                                  //     detalleConteo: detalleProducto,
                                  //   );
                                  // },
                                  onTap: (tieneLotes) {
                                    DialogoDetalleConteoHelper
                                        .mostrarContarProducto(
                                      context: context,
                                      ref: ref,
                                      detalleConteo: detalleProducto,
                                    );
                                  },
                                  showCheckbox: false,
                                  isSelected:
                                      detalleProducto.esConfirmado ?? false,
                                  // onTapLotes: () {
                                  //   DialogoDetalleConteoHelper
                                  //       .mostrarContarProducto(
                                  //           context: context,
                                  //           ref: ref,
                                  //           detalleConteo: detalleProducto);
                                  // },
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
          floatingActionButton: CustomFloatingActionButton(
            onPressed: () => _confirmarGuardarConteo(context),
            icon: Icons.save,
            withContainer: true,
          ),
        ),
      ),
    );
  }

  Widget buildEstadoChip(String estado) {
    Color color;
    String estadoTexto = estado.toUpperCase();

    switch (estadoTexto) {
      case 'CONTANDO':
        color = Colors.blue;
        break;
      case 'FINALIZADO':
        color = const Color.fromARGB(255, 32, 90, 248);
        break;
      case 'PENDIENTE':
      default:
        color = Colors.red;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        estadoTexto,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
