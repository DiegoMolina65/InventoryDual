import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/grupo/grupo.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/linea/linea.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/subgrupo/subgrupo.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/product_search_screen.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/provider/product_search_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/provider/inventory_take_details_provider.dart';

import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

final codigoBarraControllerProvider =
    Provider.autoDispose<_CodigoBarraController>((ref) {
  final controller = _CodigoBarraController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

class DialogoBusquedaHelper {
  static bool _busquedaEnProgreso = false;

  static String getTituloBusqueda(TipoBusqueda tipoBusqueda) {
    switch (tipoBusqueda) {
      case TipoBusqueda.codigo:
        return 'BUSCAR POR CÓDIGO DE BARRAS';
      case TipoBusqueda.grupo:
        return 'BUSCAR POR LÍNEA DE PRODUCTO';
      case TipoBusqueda.producto:
        return 'BUSCAR POR NOMBRE DEL PRODUCTO';
      case TipoBusqueda.ubicacion:
        return 'BUSCAR POR UBICACIÓN DE PRODUCTO';
    }
  }

  static Widget construirContenidoBusqueda(BuildContext context, WidgetRef ref,
      TipoBusqueda tipoBusqueda, GlobalKey<FormState> formKey,
      {BuildContext Function()? getContext = null,
      WidgetRef Function()? getRef = null}) {
    final state = ref.watch(detalleTomaInventarioProvider);
    final notifier = ref.read(detalleTomaInventarioProvider.notifier);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        _getIconoTipoBusqueda(tipoBusqueda),
        const SizedBox(height: 20),
        _getContenidoPorTipoBusqueda(
            context, tipoBusqueda, state, notifier, primaryColor, ref, formKey,
            getContext: getContext, getRef: getRef),
      ],
    );
  }

  static Widget _getIconoTipoBusqueda(TipoBusqueda tipoBusqueda) {
    IconData iconData;
    Color iconColor;

    switch (tipoBusqueda) {
      case TipoBusqueda.codigo:
        iconData = Icons.qr_code_scanner_rounded;
        iconColor = Colors.blue;
        break;
      case TipoBusqueda.grupo:
        iconData = Icons.category_rounded;
        iconColor = Colors.green;
        break;
      case TipoBusqueda.producto:
        iconData = Icons.inventory_rounded;
        iconColor = Colors.purple;
        break;
      case TipoBusqueda.ubicacion:
        iconData = Icons.location_on_rounded;
        iconColor = Colors.orange;
        break;
    }

    return Icon(
      iconData,
      size: 48,
      color: iconColor,
    );
  }

  static Widget _getContenidoPorTipoBusqueda(
      BuildContext context,
      TipoBusqueda tipoBusqueda,
      dynamic state,
      dynamic notifier,
      Color primaryColor,
      WidgetRef ref,
      GlobalKey<FormState> formKey,
      {BuildContext Function()? getContext = null,
      WidgetRef Function()? getRef = null}) {
    switch (tipoBusqueda) {
      case TipoBusqueda.grupo:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Seleccione las categorías para filtrar los productos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            CustomDropdownField<Linea>(
              value: state.lineaSeleccionada,
              label: 'Línea',
              prefixIcon: Icon(Icons.category, color: primaryColor, size: 20),
              items: state.lineas,
              isLoading: state.isLoadingLineas,
              getLabel: (linea) => linea.descripcion,
              validator: ValidatorsInputs.validateDropdown,
              onChanged: notifier.seleccionarLinea,
            ),
            const SizedBox(height: 16),
            CustomDropdownField<Grupo>(
              value: state.grupoSeleccionado,
              label: 'Grupo',
              prefixIcon: Icon(Icons.widgets, color: primaryColor, size: 20),
              items: state.grupos,
              isLoading: state.isLoadingGrupos,
              getLabel: (grupo) => grupo.descripcion,
              onChanged: notifier.seleccionarGrupo,
            ),
            const SizedBox(height: 16),
            CustomDropdownField<Subgrupo>(
              value: state.subgrupoSeleccionado,
              label: 'Subgrupo',
              prefixIcon: Icon(Icons.list_alt, color: primaryColor, size: 20),
              items: state.subgrupos,
              isLoading: state.isLoadingSubgrupos,
              getLabel: (subgrupo) => subgrupo.descripcion,
              onChanged: notifier.seleccionarSubgrupo,
            ),
          ],
        );

      case TipoBusqueda.producto:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ingrese el nombre o código del producto que desea buscar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextformfield(
              initialValue: state.textoBusquedaProducto,
              hintText: 'Código o Nombre del producto',
              label: 'Producto',
              upperCase: true,
              prefixIcon: Icon(Icons.search_rounded, color: primaryColor),
              validator: ValidatorsInputs.validateGeneralField,
              onChanged: notifier.actualizarTextoBusquedaProducto,
            ),
          ],
        );

      case TipoBusqueda.ubicacion:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ingrese la ubicación donde se encuentra el producto',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextformfield(
              initialValue: state.textoBusquedaUbicacion,
              hintText: 'Ingrese la ubicación',
              label: 'Ubicación',
              upperCase: true,
              prefixIcon: Icon(Icons.location_on_rounded, color: primaryColor),
              validator: ValidatorsInputs.validateGeneralField,
              onChanged: notifier.actualizarTextoBusquedaUbicacion,
            ),
          ],
        );

      case TipoBusqueda.codigo:
        final controller = ref.watch(codigoBarraControllerProvider);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;

          if (controller.textController.text.isEmpty &&
              state.textoBusquedaCodigo.isNotEmpty) {
            controller.textController.text = state.textoBusquedaCodigo;
          }
          controller.focusNode.requestFocus();
        });

        return StatefulBuilder(
          builder: (context, setState) {
            return Focus(
              autofocus: true,
              onKeyEvent: (node, event) {
                if (event is KeyDownEvent &&
                    (event.logicalKey == LogicalKeyboardKey.enter ||
                        event.logicalKey == LogicalKeyboardKey.numpadEnter)) {
                  final texto = controller.textController.text.trim();

                  if (texto.isNotEmpty) {
                    notifier.actualizarTextoBusquedaCodigo(texto);

                    final isValid = formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      controller.focusNode.unfocus();
                      controller.textController.clear();

                      if (context.mounted) {
                        CustomShowDialogHelper.closeShowDialogo(context)
                            .whenComplete(
                          () => realizarBusqueda(getContext?.call() ?? context,
                              getRef?.call() ?? ref),
                        );
                      }
                    }
                    return KeyEventResult.handled;
                  }
                }
                return KeyEventResult.ignored;
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Escanee o ingrese el código de barras del producto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.textController,
                    focusNode: controller.focusNode,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Escanee o ingrese el código de barras',
                      labelText: 'Código de Barras',
                      prefixIcon:
                          Icon(Icons.qr_code_rounded, color: primaryColor),
                      border: const OutlineInputBorder(),
                    ),
                    textCapitalization: TextCapitalization.characters,
                    onChanged: (value) {
                      notifier.actualizarTextoBusquedaCodigo(value);
                    },
                    validator: (value) =>
                        ValidatorsInputs.validateGeneralField(value),
                  ),
                ],
              ),
            );
          },
        );
    }
  }

  static final GlobalKey<FormState> _formKeyBusquedaCodigo =
      GlobalKey<FormState>();

  static Future<void> mostrarDialogoBusqueda(
      BuildContext context, WidgetRef ref, TipoBusqueda tipoBusqueda,
      {BuildContext Function()? getContext = null, WidgetRef Function()? getRef = null}) async {
    final colorScheme = Theme.of(context).colorScheme;

    if (tipoBusqueda == TipoBusqueda.codigo) {
      final controller = ref.read(codigoBarraControllerProvider);
      controller.reset();

      final state = ref.read(detalleTomaInventarioProvider);
      if (state.textoBusquedaCodigo.isNotEmpty) {
        controller.textController.text = state.textoBusquedaCodigo;
      }
    }

    await CustomShowDialogHelper.show(
      context: context,
      showCloseButton: false,
      title: getTituloBusqueda(tipoBusqueda),
      content: Consumer(
        builder: (context, ref, _) {
          return Form(
            key: _formKeyBusquedaCodigo,
            child: construirContenidoBusqueda(
                context, ref, tipoBusqueda, _formKeyBusquedaCodigo,
                getContext: getContext, getRef: getRef),
          );
        },
      ),
      actions: [
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'CANCELAR',
          isOutlined: true,
          icon: Icons.close_rounded,
          backgroundColor: colorScheme.error,
          onPressed: () async {
            ref
                .read(detalleTomaInventarioProvider.notifier)
                .reiniciarSelecciones();
            await CustomShowDialogHelper.closeShowDialogo(context);
          },
        ),
        CustomShowDialogHelper.createButtonShowDialog(
          text: 'BUSCAR',
          icon: Icons.search_rounded,
          backgroundColor: colorScheme.secondary,
          onPressed: () async {
            if (_formKeyBusquedaCodigo.currentState?.validate() ?? false) {
              final controller = ref.read(codigoBarraControllerProvider);
              controller.focusNode.unfocus();
              controller.textController.clear();

              await CustomShowDialogHelper.closeShowDialogo(context);
              realizarBusqueda(context, ref);
            }
          },
        ),
      ],
    );
  }

  static Future<void> realizarBusqueda(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (_busquedaEnProgreso) return;

    _busquedaEnProgreso = true;

    final state = ref.read(detalleTomaInventarioProvider);
    final notifier = ref.read(detalleTomaInventarioProvider.notifier);

    final tomaInventario = state.tomaInventario;
    if (tomaInventario == null) {
      _busquedaEnProgreso = false;
      return;
    }

    final tipoBusqueda = state.tipoBusquedaActual;
    if (tipoBusqueda == null) {
      _busquedaEnProgreso = false;
      return;
    }

    final queryParams = {
      'tipoBusqueda': _getTipoBusquedaParam(tipoBusqueda),
      'codigoAlmacen': tomaInventario.codigoAlmacen.toString(),
      if (state.lineaSeleccionada?.codigo != null)
        'codigoLinea': state.lineaSeleccionada!.codigo.toString(),
      if (state.grupoSeleccionado?.codigo != null)
        'codigoGrupo': state.grupoSeleccionado!.codigo.toString(),
      if (state.subgrupoSeleccionado?.codigo != null)
        'codigoSubgrupo': state.subgrupoSeleccionado!.codigo.toString(),
      if (state.textoBusquedaProducto.isNotEmpty)
        'nombreProducto': state.textoBusquedaProducto,
      if (state.textoBusquedaUbicacion.isNotEmpty)
        'ubicacion': state.textoBusquedaUbicacion,
      if (state.textoBusquedaCodigo.isNotEmpty)
        'codigoBarra': state.textoBusquedaCodigo,
    };

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      await context
          .push(
        Uri(
          path: BusquedaProductoScreen.name,
          queryParameters: queryParams,
        ).toString(),
      )
          .then((result) {
        if (result != null &&
            result is List &&
            result.isNotEmpty &&
            result.first is Producto) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              notifier.agregarProductos(result.cast<Producto>());
              notifier.reiniciarSelecciones();
            }
          });
        } else {
          if (context.mounted) {
            notifier.reiniciarSelecciones();
          }
        }
      });
    } catch (error) {
      debugPrint('Error al navegar a BusquedaProductoScreen: $error');
      if (context.mounted) {
        notifier.reiniciarSelecciones();
      }
    } finally {
      _busquedaEnProgreso = false;
    }
  }

  static String _getTipoBusquedaParam(TipoBusqueda tipoBusqueda) {
    switch (tipoBusqueda) {
      case TipoBusqueda.codigo:
        return 'codigo';
      case TipoBusqueda.grupo:
        return 'grupo';
      case TipoBusqueda.producto:
        return 'producto';
      case TipoBusqueda.ubicacion:
        return 'ubicacion';
    }
  }

  static Future<void> mostrarDialogoYRealizarBusqueda(
      BuildContext context, WidgetRef ref, TipoBusqueda tipoBusqueda,
      {BuildContext Function()? getContext = null, WidgetRef Function()? getRef = null}) async {
    await ref
        .read(detalleTomaInventarioProvider.notifier)
        .cargarDatosIniciales();
    ref
        .read(detalleTomaInventarioProvider.notifier)
        .establecerTipoBusqueda(tipoBusqueda);
    ref.read(busquedaProductoProvider.notifier).limpiarFiltros();
    ref.read(busquedaProductoProvider.notifier).resetearBusqueda();

    if (!context.mounted) return;
    await mostrarDialogoBusqueda(context, ref, tipoBusqueda,
        getContext: getContext, getRef: getRef);
  }
}

class _CodigoBarraController {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  void reset() {
    textController.clear();
  }

  void dispose() {
    textController.dispose();
    focusNode.dispose();
  }
}
