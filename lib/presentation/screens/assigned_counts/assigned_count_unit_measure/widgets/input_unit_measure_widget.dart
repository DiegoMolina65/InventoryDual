import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_unit_measure/provider/assigned_count_unit_measure_provider.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;
  DecimalTextInputFormatter({this.decimalRange = 2});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    if (!RegExp(r'^\d*\.?\d*$').hasMatch(text)) {
      return oldValue;
    }

    if (text.contains('.')) {
      final parts = text.split('.');
      if (parts.length > 2) return oldValue;
      if (parts[1].length > decimalRange) {
        return oldValue;
      }
    }
    return newValue;
  }
}

class InputUnitMeasureWidget extends ConsumerStatefulWidget {
  const InputUnitMeasureWidget({super.key, required this.detalleRecuentoInventario});
  final DetalleRecuentoInventario detalleRecuentoInventario;

  @override
  ConsumerState<InputUnitMeasureWidget> createState() =>
      _InputUnitMeasureWidgetState();
}

class _InputUnitMeasureWidgetState
    extends ConsumerState<InputUnitMeasureWidget> {
  final _cantidadController = TextEditingController();
  final _formatter = NumberFormat("#,##0.00", "es_ES");
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cantidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(assignedCountUnitMeasureProvider(widget.detalleRecuentoInventario));
    final notifier =
        ref.read(assignedCountUnitMeasureProvider(widget.detalleRecuentoInventario).notifier);
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(theme),
              const SizedBox(height: 5),
              _buildUnidadDropdown(state, notifier, theme),
              const SizedBox(height: 8),
              _buildCantidadInput(theme),
              const SizedBox(height: 8),
              _buildAgregarButton(notifier, theme),
              _buildEntradasHeader(theme, state),
              _buildEntradasList(state, notifier, theme),
              const SizedBox(height: 5),
              _buildTotalSection(state, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Icon(Icons.inventory_2_outlined,
            color: theme.colorScheme.primary, size: 20),
        const SizedBox(width: 12),
        Text(
          "Registro de Cantidades",
          style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildUnidadDropdown(
    AssignedCountUnitMeasureState state,
    AssignedCountUnitMeasureNotifier notifier,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Unidad de Medida",
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: theme.colorScheme.outline.withOpacity(0.5)),
            color: theme.colorScheme.surface,
          ),
          child: DropdownButtonFormField<UnidadMedida>(
            value: state.unidadSeleccionada,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: theme.colorScheme.primary),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: InputBorder.none,
            ),
            hint: Text("Selecciona una unidad",
                style: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.6))),
            items: widget.detalleRecuentoInventario.producto!.listaUnidadMedida
                .map((unidad) => DropdownMenuItem(
                      value: unidad,
                      child: Text(unidad.descripcion),
                    ))
                .toList(),
            onChanged: (unidad) {
              if (unidad != null) {
                notifier.cambiarUnidadSeleccionada(unidad);
              }
            },
            validator: (value) => value == null ? 'Campo requerido' : null,
          ),
        ),
      ],
    );
  }

  Widget _buildCantidadInput(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cantidad",
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _cantidadController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            DecimalTextInputFormatter(decimalRange: 2),
          ],
          decoration: InputDecoration(
            hintText: "Ingresa la cantidad",
            prefixIcon: Icon(Icons.calculate_outlined,
                color: theme.colorScheme.primary),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: theme.colorScheme.outline.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: theme.colorScheme.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
            ),
            filled: true,
            fillColor: theme.colorScheme.surface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          validator: ValidatorsInputs.validatePositiveNumber,
        ),
      ],
    );
  }

  Widget _buildAgregarButton(
    AssignedCountUnitMeasureNotifier notifier,
    ThemeData theme,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final cantidad = double.tryParse(_cantidadController.text);
            if (cantidad != null && cantidad > 0) {
              notifier.agregarEntrada(cantidad);
              _cantidadController.clear();
            }
          }
        },
        icon: const Icon(Icons.add_circle_outline),
        label: const Text("Agregar"),
        style: ElevatedButton.styleFrom(
          foregroundColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildEntradasHeader(
      ThemeData theme, AssignedCountUnitMeasureState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: theme.colorScheme.outline.withOpacity(0.3)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Entradas Registradas",
              style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                  fontSize: 15),
            ),
            if (state.entradas.isNotEmpty)
              Text(
                "${state.entradas.length} ${state.entradas.length == 1 ? 'Contado' : 'Contados'}",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildEntradasList(
    AssignedCountUnitMeasureState state,
    AssignedCountUnitMeasureNotifier notifier,
    ThemeData theme,
  ) {
    if (state.entradas.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.inventory,
                size: 48,
                color: theme.colorScheme.onSurface.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              Text(
                "No hay entradas registradas",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Agrega cantidades para comenzar",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.entradas.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
          color: theme.colorScheme.outline.withOpacity(0.3),
        ),
        itemBuilder: (context, index) {
          final entrada = state.entradas[index];
          return Dismissible(
            key: ValueKey('entrada-$index'),
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.delete_outline,
                color: theme.colorScheme.error,
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => notifier.eliminarEntrada(index),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${_formatter.format(entrada.cantidad)} ${entrada.unidadMedida.descripcion}",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  "Equivalente: ${_formatter.format(entrada.cantidadEnUnidadBase)} ${state.unidadBase.descripcion}",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: theme.colorScheme.error,
                ),
                onPressed: () => notifier.eliminarEntrada(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTotalSection(
      AssignedCountUnitMeasureState state, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total UM Base:",
            style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
                fontSize: 15),
          ),
          Row(
            children: [
              Icon(
                Icons.summarize_outlined,
                size: 20,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                "${_formatter.format(state.total)} ${state.unidadBase.descripcion}",
                style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
