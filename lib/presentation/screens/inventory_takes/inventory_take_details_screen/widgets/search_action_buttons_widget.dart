import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/provider/inventory_take_details_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/inventory_take_details_screen/widgets/dialogs/search_actions_dialog.dart';

enum OpcionBusqueda {
  codigo,
  grupo,
  producto,
  ubicacion,
}

class AccionBotonesWidget extends ConsumerStatefulWidget {
  const AccionBotonesWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AccionBotonesWidget> createState() =>
      _AccionBotonesWidgetState();
}

class _AccionBotonesWidgetState extends ConsumerState<AccionBotonesWidget> {
  OpcionBusqueda? _opcionSeleccionada;
  int _currentIndex = -1;
  bool _canOpenDialog = true;
  final FocusNode _focusNode = FocusNode();

  final List<String> _labels = [
    'CÓDIGO DE BARRAS',
    'LÍNEA DE PRODUCTO',
    'NOMBRE DEL PRODUCTO',
    'UBICACIÓN DE PRODUCTO',
  ];

  final List<IconData> _icons = [
    Icons.qr_code_scanner,
    Icons.category,
    Icons.shopping_bag,
    Icons.place,
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      GestureBinding.instance.pointerRouter.addGlobalRoute(_handleGlobalTap);
    });
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _deselectOption();
    }
  }

  void _handleGlobalTap(PointerEvent event) {
    if (event is! PointerUpEvent) return;

    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final position = box.globalToLocal(event.position);
    if (!box.size.contains(position)) {
      _deselectOption();
    }
  }

  void _deselectOption() {
    if (_currentIndex != -1) {
      setState(() {
        _currentIndex = -1;
        _opcionSeleccionada = null;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    GestureBinding.instance.pointerRouter.removeGlobalRoute(_handleGlobalTap);
    super.dispose();
  }

  void _manejarCambio(int index) async {
    setState(() {
      _currentIndex = index;
      _opcionSeleccionada = OpcionBusqueda.values[index];
    });

    final tipoBusqueda = _convertirATipoBusqueda(_opcionSeleccionada!);

    if (!_canOpenDialog) return;
    _canOpenDialog = false;

    try {
      await DialogoBusquedaHelper.mostrarDialogoYRealizarBusqueda(
          context, ref, tipoBusqueda, getContext: () {
        return context;
      }, getRef: () {
        return ref;
      });

      _deselectOption();
    } finally {
      _canOpenDialog = true;
    }
  }

  TipoBusqueda _convertirATipoBusqueda(OpcionBusqueda opcion) {
    switch (opcion) {
      case OpcionBusqueda.codigo:
        return TipoBusqueda.codigo;
      case OpcionBusqueda.grupo:
        return TipoBusqueda.grupo;
      case OpcionBusqueda.producto:
        return TipoBusqueda.producto;
      case OpcionBusqueda.ubicacion:
        return TipoBusqueda.ubicacion;
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Focus(
      focusNode: _focusNode,
      child: LayoutBuilder(builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / _labels.length;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  if (_currentIndex != -1)
                    Positioned(
                      left: _currentIndex * itemWidth,
                      top: 0,
                      child: Container(
                        width: itemWidth,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xFF042B59),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _icons[_currentIndex],
                              color: Colors.white,
                              size: 10,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _labels[_currentIndex],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Row(
                    children: List.generate(_labels.length, (index) {
                      final isSelected = index == _currentIndex;
                      return SizedBox(
                        width: itemWidth,
                        child: GestureDetector(
                          onTap: () => _manejarCambio(index),
                          child: Container(
                            height: 70,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _icons[index],
                                  color: Colors.white,
                                  size: isSelected ? 0 : 30,
                                ),
                                if (!isSelected) const SizedBox(height: 4),
                                if (!isSelected)
                                  Text(
                                    _labels[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
