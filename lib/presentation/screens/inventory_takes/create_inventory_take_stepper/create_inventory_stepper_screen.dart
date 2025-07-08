import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/presentation/screens/screens_export.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/provider/create_inventory_stepper_provider.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/widgets/dialogs/help_dialog.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/widgets/dialogs/stepper_dialogs.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/widgets/step_1_start.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/widgets/step_2_add_product.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/create_inventory_take_stepper/widgets/step_3_new_take_summary.dart';

class StepperCrearTomaInventarioScreen extends ConsumerStatefulWidget {
  const StepperCrearTomaInventarioScreen({Key? key}) : super(key: key);

  static const name = '/stepper-toma-inventario';

  @override
  ConsumerState<StepperCrearTomaInventarioScreen> createState() =>
      _StepperCrearTomaInventarioScreenState();
}

class _StepperCrearTomaInventarioScreenState
    extends ConsumerState<StepperCrearTomaInventarioScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(stepperCrearTomaInventarioProvider.notifier).cargarAlmacenes();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _volverAPantallaAnterior(BuildContext context) {
    ref.read(stepperCrearTomaInventarioProvider.notifier).resetStepper();
    context.go(TomasInventarioScreen.name, extra: {'refresh': true});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stepperCrearTomaInventarioProvider);
    final prov = ref.read(stepperCrearTomaInventarioProvider.notifier);
    final primaryColor = Theme.of(context).colorScheme.primary;

    final bool isPaso1Valido =
        state.nombreToma.isNotEmpty && state.almacenSeleccionado != null;
    final int step = state.stepActual;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nueva Toma de Inventario',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 25,
          ),
          onPressed: () async {
            final shouldPop =
                await DialogoStepperHelper.confirmarSalida(context);
            if (shouldPop && context.mounted) {
              _volverAPantallaAnterior(context);
            }
          },
        ),
        backgroundColor: primaryColor,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline_rounded,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              mostrarDialogoAyuda(context);
            },
          ),
        ],
      ),
      body: PopScope(
        canPop: false,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade100,
                  Colors.white,
                ],
                stops: const [0.0, 0.3],
              ),
            ),
            child: Column(
              children: [
                // Indicador de pasos con padding limitado
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: _buildStepperIndicator(step, context),
                ),
                // Stepper que ocupa todo el ancho disponible
                Expanded(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: primaryColor,
                            onSurface: primaryColor,
                          ),
                    ),
                    child: Stepper(
                      type: StepperType.horizontal,
                      currentStep: step,
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      onStepContinue: () {
                        if (step == 0 && !isPaso1Valido) return;
                        prov.siguientePaso();
                      },
                      onStepCancel: prov.pasoAnterior,
                      controlsBuilder: (context, details) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 24.0, left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (step == 0)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: isPaso1Valido
                                        ? details.onStepContinue
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      disabledBackgroundColor:
                                          Colors.grey.shade400,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      shadowColor:
                                          Colors.green.withOpacity(0.4),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'CONTINUAR',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward_rounded,
                                            size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              if (step == 1) ...[
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: details.onStepCancel,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.red,
                                      elevation: 3,
                                      shadowColor: Colors.red.withOpacity(0.2),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                            color: Colors.red, width: 1),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_back_rounded,
                                            size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'ATRÁS',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      elevation: 3,
                                      shadowColor:
                                          Colors.green.withOpacity(0.4),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'CONTINUAR',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward_rounded,
                                            size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              if (step == 2)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: details.onStepCancel,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.red,
                                      elevation: 2,
                                      shadowColor: Colors.red.withOpacity(0.2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                            color: Colors.red, width: 1),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_back_rounded,
                                            size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'VOLVER',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      steps: [
                        Step(
                          title: const Text(''),
                          content: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 40),
                            child: const StepPrimerPasoInicio(),
                          ),
                          isActive: step >= 0,
                          state:
                              step > 0 ? StepState.complete : StepState.indexed,
                        ),
                        Step(
                          title: const Text(''),
                          content: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 40),
                            child: state.nuevaTomaInventario == null
                                ? const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Completa primero el nombre y almacén.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                : const StepSegundoPasoAnadirProducto(),
                          ),
                          isActive: step >= 1,
                          state: step > 1
                              ? StepState.complete
                              : (step == 1
                                  ? StepState.indexed
                                  : StepState.disabled),
                        ),
                        Step(
                          title: const Text(''),
                          content: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 40),
                            child: const StepTercerPasoResumenNuevaToma(),
                          ),
                          isActive: step >= 2,
                          state: step == 2
                              ? StepState.indexed
                              : StepState.disabled,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepperIndicator(int currentStep, BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final titles = ['Información Inicial', 'Agregar Productos', 'Confirmación'];
    final icons = [
      Icons.description_outlined,
      Icons.inventory_2_outlined,
      Icons.check_circle_outline_rounded
    ];

    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            final isActive = currentStep >= index;
            final isComplete = currentStep > index;

            return Expanded(
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isActive ? primaryColor : Colors.grey.shade200,
                      shape: BoxShape.circle,
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: isComplete
                          ? const Icon(Icons.check,
                              color: Colors.white, size: 28)
                          : Icon(
                              icons[index],
                              color: isActive ? Colors.white : Colors.grey,
                              size: 24,
                            ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    titles[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive ? primaryColor : Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
