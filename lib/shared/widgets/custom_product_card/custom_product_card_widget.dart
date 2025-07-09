import 'package:flutter/material.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/producto/producto.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/number_extensions.dart';

class CustomProductCard extends StatefulWidget {
  final Producto? producto;
  final Usuario? usuario;
  final DetalleRecuentoInventario? detalleConteo;
  final String? lote;
  final bool isSelected;
  final void Function(bool tieneLotes)? onTap;
  final VoidCallback? onDelete;
  final bool showCheckbox;

  const CustomProductCard({
    Key? key,
    this.lote,
    this.usuario,
    this.detalleConteo,
    this.isSelected = false,
    this.onTap,
    this.onDelete,
    this.showCheckbox = true,
    this.producto,
  })  : assert(producto != null),
        super(key: key);

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard>
    with TickerProviderStateMixin {
  AnimationController? _blinkController;
  Animation<double>? _blinkAnimation;
  bool _isAnimationActive = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    final tieneLotes =
        _obtenerListaLotes() != null && _obtenerListaLotes()!.isNotEmpty;

    if (tieneLotes) {
      _blinkController = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );

      _blinkAnimation = Tween<double>(
        begin: 0.2,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _blinkController!,
        curve: Curves.easeInOut,
      ));

      // Iniciar el parpadeo solo si el widget está montado
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _startBlinking();
        }
      });
    }
  }

  void _startBlinking() {
    if (_blinkController != null && mounted && !_isAnimationActive) {
      _isAnimationActive = true;
      _blinkController!.repeat(reverse: true);
    }
  }

  void _stopBlinking() {
    if (_blinkController != null && _isAnimationActive) {
      _isAnimationActive = false;
      _blinkController!.stop();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _blinkController?.reset();
        }
      });
    }
  }

  @override
  void deactivate() {
    _stopBlinking();
    super.deactivate();
  }

  @override
  void dispose() {
    _stopBlinking();
    _blinkController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Si cambia el estado de los lotes, reinicializar la animación
    final oldTieneLotes = _obtenerListaLotesOld(oldWidget) != null &&
        _obtenerListaLotesOld(oldWidget)!.isNotEmpty;
    final newTieneLotes =
        _obtenerListaLotes() != null && _obtenerListaLotes()!.isNotEmpty;

    if (oldTieneLotes != newTieneLotes) {
      _stopBlinking();
      _blinkController?.dispose();
      _initializeAnimation();
    }
  }

  // Método para obtener la lista de lotes del widget actual
  List<dynamic>? _obtenerListaLotes() {
    if (widget.producto != null) {
      return widget.producto!.listaLotes;
    }
    return null;
  }

  // Método para obtener la lista de lotes del widget anterior (para comparación)
  List<dynamic>? _obtenerListaLotesOld(CustomProductCard oldWidget) {
    if (oldWidget.producto != null) {
      return oldWidget.producto!.listaLotes;
    }
    return null;
  }

  // Método para obtener los datos del producto actual
  Producto? _obtenerProducto() {
    if (widget.producto != null) {
      return widget.producto;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final titleFontSize = isTablet ? 14.0 : 13.0;
    final labelFontSize = isTablet ? 14.0 : 12.0;
    final valueFontSize = isTablet ? 14.0 : 12.0;
    final textSize = isTablet ? 16.0 : 14.0;
    final checkboxSize = isTablet ? 22.0 : 20.0;
    final cardPadding = isTablet ? 10.0 : 8.0;
    final cardMargin = isTablet ? 4.0 : 3.0;
    final headerPadding = isTablet ? 10.0 : 8.0;

    final tieneLotes =
        _obtenerListaLotes() != null && _obtenerListaLotes()!.isNotEmpty;
    final producto = _obtenerProducto();

    // Si no hay producto, retornar un widget vacío
    if (producto == null) {
      return const SizedBox.shrink();
    }

    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: cardMargin * 2, vertical: cardMargin),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: widget.isSelected ? primaryColor : Colors.transparent,
          width: widget.isSelected ? 1.5 : 0,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (widget.onTap == null) {
            return;
          }

          widget.onTap!(tieneLotes);
        },
        borderRadius: BorderRadius.circular(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: cardPadding, vertical: headerPadding),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      producto.nombre.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (tieneLotes && _blinkAnimation != null && mounted)
                    AnimatedBuilder(
                      animation: _blinkAnimation!,
                      builder: (context, child) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color.lerp(
                              Colors.yellow.withOpacity(0.3),
                              Colors.yellow.withOpacity(0.9),
                              _blinkAnimation!.value,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Color.lerp(
                                Colors.yellow.withOpacity(0.5),
                                Colors.yellow,
                                _blinkAnimation!.value,
                              )!,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.yellow
                                    .withOpacity(_blinkAnimation!.value * 0.6),
                                blurRadius: _blinkAnimation!.value * 8,
                                spreadRadius: _blinkAnimation!.value * 2,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: GestureDetector(
                            onTap: () {
                              if (widget.onTap == null) {
                                return;
                              }

                              widget.onTap!(tieneLotes);
                            },
                            child: Text(
                              'LOTES',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: textSize,
                                color: Color.lerp(
                                  Colors.red.shade800,
                                  Colors.red.shade900,
                                  _blinkAnimation!.value,
                                ),
                                shadows: [
                                  Shadow(
                                    blurRadius: _blinkAnimation!.value * 4,
                                    color: Colors.red.withOpacity(
                                        _blinkAnimation!.value * 0.5),
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  else if (widget.showCheckbox)
                    Container(
                      width: checkboxSize,
                      height: checkboxSize,
                      decoration: BoxDecoration(
                        color: widget.isSelected
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),
                      child: widget.isSelected
                          ? Icon(
                              Icons.check,
                              color: primaryColor,
                              size: checkboxSize - 4,
                            )
                          : null,
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.qr_code,
                                size: textSize, color: primaryColor),
                            SizedBox(width: isTablet ? 6 : 4),
                            Text(
                              'Código del producto: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: labelFontSize,
                              ),
                            ),
                            Text(
                              producto.codigo,
                              style: TextStyle(
                                fontSize: valueFontSize,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isTablet ? 6 : 4),
                        (widget.usuario?.esSupervisor ?? false)
                            ? Row(
                                children: [
                                  Icon(Icons.inventory,
                                      size: textSize, color: primaryColor),
                                  SizedBox(width: isTablet ? 6 : 4),
                                  Text(
                                    'Stock: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: labelFontSize,
                                    ),
                                  ),
                                  Text(
                                    (widget.detalleConteo?.cantidadStock ??
                                            widget.producto?.stock ??
                                            0.0)
                                        .toStringDecimal('UND'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: valueFontSize,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        if (widget.lote != null &&
                            (widget.lote ?? '').isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: isTablet ? 6 : 4),
                            child: Row(
                              children: [
                                Icon(Icons.layers,
                                    size: textSize, color: primaryColor),
                                SizedBox(width: isTablet ? 6 : 4),
                                Text(
                                  'Lote: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: labelFontSize,
                                  ),
                                ),
                                Text(
                                  widget.lote!,
                                  style: TextStyle(
                                    fontSize: valueFontSize,
                                    color: Colors.grey.shade700,
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (producto.ubicacion.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: isTablet ? 6 : 4),
                            child: Row(
                              children: [
                                Icon(Icons.place,
                                    size: textSize, color: primaryColor),
                                SizedBox(width: isTablet ? 6 : 4),
                                Text(
                                  'Ubicación: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: labelFontSize,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    producto.ubicacion,
                                    style: TextStyle(
                                      fontSize: valueFontSize,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: isTablet ? 6 : 4),
                        Row(
                          children: [
                            Icon(Icons.bar_chart,
                                size: textSize, color: primaryColor),
                            SizedBox(width: isTablet ? 6 : 4),
                            Text(
                              'Código de barra: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: labelFontSize,
                              ),
                            ),
                            Text(
                              producto.codigoBarra,
                              style: TextStyle(
                                fontSize: valueFontSize,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (widget.onDelete != null)
                    Padding(
                      padding: EdgeInsets.only(left: isTablet ? 16 : 12),
                      child: InkWell(
                        onTap: widget.onDelete,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: EdgeInsets.all(isTablet ? 12 : 10),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.red.shade200,
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red.shade600,
                            size: isTablet ? 28 : 24,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
