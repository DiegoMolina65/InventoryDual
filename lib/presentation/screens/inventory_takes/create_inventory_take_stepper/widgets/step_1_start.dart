import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/provider/create_inventory_stepper_provider.dart';
import 'package:m_dual_inventario/shared/helpers/export_extensions_helpers.dart';
import 'package:m_dual_inventario/shared/widgets/export_custom_widgets.dart';

class StepPrimerPasoInicio extends ConsumerStatefulWidget {
  const StepPrimerPasoInicio({Key? key}) : super(key: key);

  @override
  ConsumerState<StepPrimerPasoInicio> createState() =>
      _StepPrimerPasoInicioState();
}

class _StepPrimerPasoInicioState extends ConsumerState<StepPrimerPasoInicio>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(stepperCrearTomaInventarioProvider.notifier);
    final state = ref.watch(stepperCrearTomaInventarioProvider);
    final editable = state.nuevaTomaInventario == null;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Card(
        elevation: 2,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.inventory_rounded,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Información de la Toma',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Campo Nombre Toma
              _buildSectionTitle(
                'Nombre de la toma de inventario',
                Icons.edit_rounded,
                primaryColor,
              ),
              const SizedBox(height: 10),
              AbsorbPointer(
                absorbing: !editable,
                child: Opacity(
                  opacity: editable ? 1.0 : 0.6,
                  child: CustomTextformfield(
                    enabled: editable,
                    initialValue: state.nombreToma,
                    onChanged: provider.actualizarNombre,
                    validator: ValidatorsInputs.validateGeneralField,
                    hintText: 'Nombre de la Toma',
                    prefixIcon: const Icon(Icons.inventory_2_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Campo Almacén
              _buildSectionTitle(
                'Almacén para el inventario',
                Icons.warehouse_outlined,
                primaryColor,
              ),
              const SizedBox(height: 10),
              AbsorbPointer(
                absorbing: !editable,
                child: Opacity(
                  opacity: editable ? 1.0 : 0.6,
                  child: _buildDropdown(state, provider, primaryColor),
                ),
              ),

              const SizedBox(height: 10),
              _buildInfoCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, Color primaryColor) {
    return Row(
      children: [
        Icon(icon, size: 18, color: primaryColor),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(
    dynamic state,
    dynamic provider,
    Color primaryColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CustomDropdownField<AlmacenXLocal>(
        label: 'Seleccionar Almacén',
        value: state.almacenSeleccionado,
        items: state.almacenes,
        getLabel: (almacen) => almacen.nombre,
        onChanged: (almacen) {
          if (almacen != null) provider.seleccionarAlmacen(almacen);
        },
        primaryColor: primaryColor,
        prefixIcon: Icon(Icons.warehouse_outlined, color: primaryColor),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: Colors.blue.shade700,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Complete ambos campos para continuar al siguiente paso.'
              ' En el paso siguiente podrá agregar los productos a incluir.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
