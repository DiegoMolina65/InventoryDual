import 'package:collection/collection.dart';
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

  // Lector
  final TextEditingController barcodeController = TextEditingController();
  bool isProcessingBarcode = false;

  // Focus
  final FocusNode barcodeFocusNode = FocusNode();
  bool barcodeFieldHasFocus = false;

  bool lectorCodigoActivo = false;

  late int _tdi;
  late String _nombreToma;
  late int _nroConteo;
  late int _codigoAlmacen;

  @override
  void initState() {
    super.initState();
    _inicializarParametros();

    barcodeFocusNode.addListener(() {
      setState(() {
        barcodeFieldHasFocus = barcodeFocusNode.hasFocus;
      });
    });

    // barcodeController.addListener(_onBarcodeChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inicializarDetalleConteo();
    });
  }

  // void _onBarcodeChanged() {
  //   final texto = barcodeController.text.trim();

  //   if (texto.isNotEmpty && !isProcessingBarcode) {
  //     _procesarCodigoBarras(texto).then((_) async {
  //       await Future.delayed(const Duration(milliseconds: 300));

  //       barcodeController.clear();
  //       FocusScope.of(context).requestFocus(barcodeFocusNode);
  //     });
  //   }
  // }

  Future<void> _procesarCodigoBarras(String codigoBarras) async {
    if (isProcessingBarcode) return;

    setState(() {
      isProcessingBarcode = true;
    });

    try {
      final state = ref.read(detalleConteoAsignadoProvider);
      final conteo = state.conteoInventario;

      if (conteo == null) {
        return;
      }

      final productoEncontrado = _buscarProductoPorCodigoBarras(
        codigoBarras,
        conteo.listaDetalleRecuentoInventario,
      );

      if (productoEncontrado == null) {
        _mostrarMensajeError(
            'Producto no encontrado con código: $codigoBarras');
        return;
      }

      final resultado = await _procesarProductoEscaneado(productoEncontrado);

      if (resultado) {
        _mostrarMensajeExito('Producto contado exitosamente');
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isProcessingBarcode = false;
      });
    }
  }

  // Buscar producto por código de barras
  DetalleRecuentoInventario? _buscarProductoPorCodigoBarras(
      String codigoBarras, List<DetalleRecuentoInventario> productos) {
    return productos.firstWhereOrNull((detalle) {
      final producto = detalle.producto;
      if (producto == null) return false;

      return producto.codigoBarra.toUpperCase() == codigoBarras.toUpperCase();
    });
  }

  // Procesar producto escaneado según sus lotes
  Future<bool> _procesarProductoEscaneado(
      DetalleRecuentoInventario detalle) async {
    final producto = detalle.producto;
    if (producto == null) return false;

    final tienenLotes = producto.listaLotes?.isNotEmpty ?? false;

    if (!tienenLotes) {
      // Producto sin lotes: sumar 1 a la cantidad actual
      return await _incrementarConteoSinLotes(detalle);
    } else {
      // Producto con lotes: verificar si tiene un solo lote
      final cantidadLotes = producto.listaLotes?.length ?? 0;

      if (cantidadLotes == 1) {
        // Un solo lote: sumar 1 al lote
        return await _incrementarConteoConUnLote(detalle);
      } else {
        // Múltiples lotes: no permitir escaneo automático
        _mostrarMensajeError(
            'El producto tiene múltiples lotes. Use el conteo manual.');
        return false;
      }
    }
  }

  // Incrementar conteo para productos sin lotes
  Future<bool> _incrementarConteoSinLotes(
      DetalleRecuentoInventario detalle) async {
    final cantidadActual = detalle.cantidadConteo;
    final nuevaCantidad = cantidadActual + 1;

    final detalleActualizado = detalle.copyWith(
      cantidadConteo: nuevaCantidad,
      fechaConteo: DateTime.now(),
    );

    return await ref
        .read(detalleConteoAsignadoProvider.notifier)
        .actualizarProducto(detalleActualizado);
  }

  // Incrementar conteo para productos con un solo lote
  Future<bool> _incrementarConteoConUnLote(
      DetalleRecuentoInventario detalle) async {
    final producto = detalle.producto!;
    final lote = producto.listaLotes!.first;
    final cantidadActual = lote.cantidad;
    final nuevaCantidad = cantidadActual + 1;

    final conteo = ref.read(detalleConteoAsignadoProvider).conteoInventario!;

    return await ref
        .read(detalleConteoAsignadoProvider.notifier)
        .actualizarCantidadLoteProducto(
          codigoConteo: conteo.codigo,
          codigoProducto: detalle.codigoProducto,
          codigoLote: lote.codigo,
          nuevaCantidad: nuevaCantidad,
        );
  }

  void _mostrarMensajeError(String mensaje) {
    if (mounted) {
      CustomSnackBar.show(
        context,
        message: mensaje,
        type: SnackBarType.error,
      );
    }
  }

  void _mostrarMensajeExito(String mensaje) {
    if (mounted) {
      CustomSnackBar.show(
        context,
        message: mensaje,
        type: SnackBarType.success,
      );
    }
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

    _actualizarListaBuscador();
  }

  void _actualizarListaBuscador() {
    final conteo = ref.read(detalleConteoAsignadoProvider).conteoInventario;
    if (conteo != null) {
      ref
          .read(detalleConteoProductosBuscadorProvider.notifier)
          .updateOriginalList(conteo.listaDetalleRecuentoInventario);
    }
  }

  (int total, int pendientes) _calcularContadores(ConteoInventario? conteo) {
    if (conteo == null) return (0, 0);

    final total = conteo.listaDetalleRecuentoInventario.length;
    final pendientes = conteo.listaDetalleRecuentoInventario
        .where((detalle) => !(detalle.esConfirmado ?? false))
        .length;

    return (total, pendientes);
  }

  void _confirmarGuardarConteo(BuildContext context) async {
    final state = ref.read(detalleConteoAsignadoProvider);
    final estadoConteo = state.conteoInventario?.estadoConteo.toUpperCase();

    if (estadoConteo == 'FINALIZADO') {
      CustomSnackBar.show(context,
          message: 'La toma ya fue finalizada', type: SnackBarType.warning);
      return;
    }

    final (_, pendientes) = _calcularContadores(state.conteoInventario);
    if (pendientes > 0) {
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
    try {
      CustomSnackBar.show(context,
          message:
              'No puede guardar el conteo porque faltan productos por confirmar',
          type: SnackBarType.warning);
    } catch (e) {
      print(e);
    }
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
    barcodeController.dispose();
    barcodeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final state = ref.watch(detalleConteoAsignadoProvider);
    final buscadorState = ref.watch(detalleConteoProductosBuscadorProvider);

    final (totalProductos, totalProductosPendientes) =
        _calcularContadores(state.conteoInventario);

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
                        cantidadPendientes: totalProductosPendientes,
                        cantidadTotal: totalProductos,
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
                              buscadorState.filteredList),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Opacity(
                        opacity: lectorCodigoActivo ? 1.0 : 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, bottom: 4),
                              child: Text(
                                lectorCodigoActivo
                                    ? 'ACTIVADO (TOCAR EL ICONO PARA DESACTIVAR)'
                                    : 'DESACTIVADO (TOCAR EL ICONO PARA ACTIVAR)',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: lectorCodigoActivo
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Botón de activar/desactivar
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        lectorCodigoActivo =
                                            !lectorCodigoActivo;
                                      });

                                      if (lectorCodigoActivo) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (mounted) {
                                            FocusScope.of(context)
                                                .requestFocus(barcodeFocusNode);
                                          }
                                        });
                                      } else {
                                        FocusScope.of(context).unfocus();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: lectorCodigoActivo
                                            ? Colors.orange
                                            : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: const Icon(
                                        Icons.qr_code_scanner,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                      child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Opacity(
                                        opacity: 0.0,
                                        child: CustomTextformfield(
                                          controller: barcodeController,
                                          upperCase: true,
                                          enabled: lectorCodigoActivo &&
                                              !isProcessingBarcode,
                                          focusNode: barcodeFocusNode,
                                          keyboardType: TextInputType.none,
                                          onFieldSubmitted: (value) {
                                            if (lectorCodigoActivo &&
                                                value.trim().isNotEmpty &&
                                                !isProcessingBarcode) {
                                              _procesarCodigoBarras(
                                                      value.trim())
                                                  .then((_) async {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1500));
                                                barcodeController.clear();
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        barcodeFocusNode);
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                      const IgnorePointer(
                                        ignoring: true,
                                        child: Text(
                                          'USE EL LECTOR DE CODIGO DE BARRAS PARA REALIZAR EL CONTEO',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      : _buildProductList(
                          state, productosPendientes, productosContados),
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

  Widget _buildProductList(
    DetalleConteoAsignadoState state,
    List<DetalleRecuentoInventario> productosPendientes,
    List<DetalleRecuentoInventario> productosContados,
  ) {
    final productosAMostrar =
        state.mostrarContados ? productosContados : productosPendientes;

    if (productosAMostrar.isEmpty) {
      return Center(
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
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: productosAMostrar.length,
      itemBuilder: (context, index) {
        final detalleProducto = productosAMostrar[index];

        final key = Key(
            '${detalleProducto.codigoProducto}_${detalleProducto.codigoLote ?? 'sin_lote'}_$index');

        return CustomProductCard(
          key: key,
          producto: detalleProducto.producto,
          onTap: (tieneLotes) {
            DialogoDetalleConteoHelper.mostrarContarProducto(
              context: context,
              ref: ref,
              detalleConteo: detalleProducto,
            );
          },
          showCheckbox: false,
          isSelected: detalleProducto.esConfirmado ?? false,
        );
      },
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
