import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/almacen/almacen_repository_impl.dart';
import 'package:m_dual_inventario/infrastructure/contracts/repository/toma_inventario/toma_inventario_repository_impl.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';

final stepperCrearTomaInventarioProvider = StateNotifierProvider<
    StepperCrearTomaInventarioNotifier, StepperCrearTomaInventarioState>((ref) {
  return StepperCrearTomaInventarioNotifier();
});

class StepperCrearTomaInventarioState {
  final int stepActual;
  final String nombreToma;
  final AlmacenXLocal? almacenSeleccionado;
  final List<ListaDetalleProducto> productos;
  final TomasInventario? nuevaTomaInventario;
  final bool isGuardando;
  final List<AlmacenXLocal> almacenes;

  StepperCrearTomaInventarioState({
    this.almacenes = const [],
    this.stepActual = 0,
    this.nombreToma = '',
    this.almacenSeleccionado,
    this.productos = const [],
    this.nuevaTomaInventario,
    this.isGuardando = false,
  });

  StepperCrearTomaInventarioState copyWith(
      {int? stepActual,
      String? nombreToma,
      AlmacenXLocal? almacenSeleccionado,
      List<ListaDetalleProducto>? productos,
      TomasInventario? nuevaTomaInventario,
      bool? isGuardando,
      List<AlmacenXLocal>? almacenes}) {
    return StepperCrearTomaInventarioState(
        stepActual: stepActual ?? this.stepActual,
        nombreToma: nombreToma ?? this.nombreToma,
        almacenSeleccionado: almacenSeleccionado ?? this.almacenSeleccionado,
        productos: productos ?? this.productos,
        nuevaTomaInventario: nuevaTomaInventario ?? this.nuevaTomaInventario,
        isGuardando: isGuardando ?? this.isGuardando,
        almacenes: almacenes ?? this.almacenes);
  }
}

class StepperCrearTomaInventarioNotifier
    extends StateNotifier<StepperCrearTomaInventarioState> {
  StepperCrearTomaInventarioNotifier()
      : super(StepperCrearTomaInventarioState());

  final repositoryTomaInventario = TomaInventarioRepositoryImpl();
  final repositoryAlmacen = AlmacenRepositoryImpl();

  void inicialiarAlmacenes() {
    Future.microtask(() => cargarAlmacenes());
  }

  Future<void> cargarAlmacenes() async {
    try {
      final almacenes = await repositoryAlmacen.obtenerAlmacenesPorLocal();

      if (almacenes.isNotEmpty) {
        state = state.copyWith(
          almacenes: almacenes,
          almacenSeleccionado: almacenes.first,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  void seleccionarAlmacen(AlmacenXLocal almacen) {
    state = state.copyWith(almacenSeleccionado: almacen);
  }

  void actualizarNombre(String nombre) {
    state = state.copyWith(nombreToma: nombre);
  }

  void siguientePaso() async {
    final codigoUsuario =
        await AppPreference.getValue<int>(KeyAppPreferences.codigoUsuario) ?? 0;
    if (state.stepActual == 0 && state.nuevaTomaInventario == null) {
      final nuevaToma = TomasInventario(
        codigo: 0,
        nombre: state.nombreToma,
        codigoAlmacen: state.almacenSeleccionado!.codigo,
        codigoUsuarioCreador: codigoUsuario,
        fechaRegistro: DateTime.now(),
        estado: 'PENDIENTE',
        tipo: 'CONTEO DE REVISION',
        cantidadProducto: 0,
        cantidadConteo: 0,
        cantidadConteoFinalizado: 0,
      );
      state = state.copyWith(nuevaTomaInventario: nuevaToma);
    }
    if (state.stepActual < 2) {
      state = state.copyWith(stepActual: state.stepActual + 1);
    }
  }

  void pasoAnterior() {
    if (state.stepActual > 0) {
      state = state.copyWith(stepActual: state.stepActual - 1);
    }
  }

  void actualizarProductos(List<ListaDetalleProducto> nuevosProductos) {
    state = state.copyWith(productos: nuevosProductos);
  }

  Future<void> guardarCambiosStepper() async {
    if (state.nuevaTomaInventario == null || state.productos.isEmpty) return;

    _iniciarGuardado();

    try {
      final tomaAEnviar = state.nuevaTomaInventario!.copyWith(
        listaDetalleProducto: state.productos,
      );

      final resultado =
          await repositoryTomaInventario.guardarTomaInventario(tomaAEnviar);

      state = resultado > 0
          ? StepperCrearTomaInventarioState()
          : state.copyWith(isGuardando: false);
    } catch (_) {
      _detenerGuardado();
    }
  }

  void _iniciarGuardado() {
    state = state.copyWith(isGuardando: true);
  }

  void _detenerGuardado() {
    state = state.copyWith(isGuardando: false);
  }

  // Método para sincronizar productos del Step2 con el state del stepper
  void sincronizarProductos(List<ListaDetalleProducto> productos) {
    state = state.copyWith(productos: productos);
  }

  void resetStepper() {
    state = StepperCrearTomaInventarioState();
  }
}
