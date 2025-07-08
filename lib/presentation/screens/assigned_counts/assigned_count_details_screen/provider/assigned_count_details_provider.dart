import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';
import 'package:m_dual_inventario/domain/repository/conteo/conteo_repository.dart';
import 'package:m_dual_inventario/infrastructure/contracts/providers/conteo/conteo_provider.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/datetime_extensions.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/indicador_de_progreso_future_extension.dart';
import 'package:m_dual_inventario/shared/logs/logs_dlbz.dart';

final detalleConteoAsignadoProvider = StateNotifierProvider<
    DetalleConteoAsignadoNotifier, DetalleConteoAsignadoState>((ref) {
  final repo = ref.read(conteoRepositoryProvider);

  return DetalleConteoAsignadoNotifier(repo);
});

class DetalleConteoAsignadoNotifier
    extends StateNotifier<DetalleConteoAsignadoState> {
  final ConteoRepository _repo;

  DetalleConteoAsignadoNotifier(this._repo)
      : super(DetalleConteoAsignadoState());

  Future<void> cargarDetalleConteo(int codigoTI) async {
    state = state.copyWith(isLoading: true, filtroActivo: false);

    final conteos = await _repo.buscarConteoPorCodigoConteo(codigoTI);

    final conteo = conteos.firstWhereOrNull((_) => true);

    state = state.copyWith(conteoInventario: conteo, isLoading: false);

    _clasificarProductos();

    await _restaurarConteosLocales();
  }

  Future<void> inicializarConProductos(ConteoInventario conteo) async {
    state = state.copyWith(
      conteoInventario: conteo,
      isLoading: false,
      filtroActivo: false,
      textoFiltro: '',
    );

    _clasificarProductos();

    await _restaurarConteosLocales();
  }

  void toggleMostrarContados() {
    state = state.copyWith(mostrarContados: !state.mostrarContados);
  }

  bool verificarEstadoConteo() =>
      state.conteoInventario?.estadoConteo != "PENDIENTE";

  bool puedeEditarConteo() =>
      state.conteoInventario?.estadoConteo != "FINALIZADO";

  Future<bool> iniciarConteoInventario() async {
    final c = state.conteoInventario;

    if (c == null) return false;

    state = state.copyWith(isLoading: true);

    final actualizado = await _repo.actualizarStockConteo(c.codigo).ejecutar();

    state = state.copyWith(
      conteoInventario: actualizado.copyWith(estadoConteo: "CONTANDO"),
      isLoading: false,
    );

    _clasificarProductos();

    return true;
  }

  Future<bool> actualizarProducto(
    DetalleRecuentoInventario detalleProducto, {
    bool confirmar = false,
  }) async {
    final previo = await _repo.obtenerRegistroConteoProductoPorLote(
        codigoConteo: state.conteoInventario!.codigo,
        codigoProducto: detalleProducto.codigoProducto,
        codigoLote: detalleProducto.codigoLote ?? '');

    final reg = RegistroConteoProducto(
      codigo: previo?.codigo,
      codigoConteo: state.conteoInventario!.codigo,
      codigoProducto: detalleProducto.codigoProducto,
      codigoLote: detalleProducto.codigoLote ?? '',
      cantidadContada: detalleProducto.cantidadConteo,
      fechaContada: detalleProducto.fechaConteo.shortDate(),
      sincronizadoServidor: previo?.sincronizadoServidor ?? 0,
      esConfirmado: confirmar ? 1 : (previo?.esConfirmado ?? 0),
    );

    await _repo.guardarRegistroConteoProductoLocal(reg);
    await _restaurarConteosLocales();
    _clasificarProductos();
    return true;
  }

  Future<int> guardarConteo() async {
    final c = state.conteoInventario;
    if (c == null || state.productosPendientes.isNotEmpty) {
      return 0;
    }

    state = state.copyWith(isLoading: true);
    final locales = await _repo.obtenerRegistrosPendientes();
    final detalles = c.listaDetalleRecuentoInventario.map((d) {
      final reg = locales.firstWhereOrNull((r) =>
          r.codigoConteo == c.codigo &&
          r.codigoProducto == d.codigoProducto &&
          r.codigoLote == (d.codigoLote ?? ''));

      return reg != null
          ? d.copyWith(
              cantidadConteo: reg.cantidadContada,
              fechaConteo:
                  DateFormat('dd/MM/yyyy', 'es').parse(reg.fechaContada),
            )
          : d;
    }).toList();

    final codigoUsuario = c.codigoUsuarioAsignado;
    final codigoAlmacen = c.codigoAlmacen;

    final finalizado = c.copyWith(
      codigoAlmacen: codigoAlmacen,
      codigoUsuarioAsignado: codigoUsuario,
      estadoConteo: "FINALIZADO",
      fechaFin: DateTime.now(),
      listaDetalleRecuentoInventario: detalles,
    );

    LogsDlbz.guardarLog(
        "📦 JSON enviado al servicio: ${jsonEncode(finalizado.toJson())}");

    final code = await _repo.guardarConteoInventario(finalizado);

    if (code > 0) {
      final ids = locales.map((r) => r.codigo).whereType<int>().toList();
      if (ids.isNotEmpty) {
        await _repo.marcarSincronizado(ids);
      }
    }

    state = state.copyWith(
      conteoInventario: finalizado,
      isLoading: false,
    );

    _clasificarProductos();
    return code;
  }

  Future<void> _restaurarConteosLocales() async {
    final c = state.conteoInventario;
    if (c == null) return;

    final regs = await _repo.obtenerRegistrosPendientes();

    final actualizados = c.listaDetalleRecuentoInventario.map((d) {
      final r = regs.firstWhereOrNull((r) =>
          r.codigoConteo == c.codigo &&
          r.codigoProducto == d.codigoProducto &&
          r.codigoLote == (d.codigoLote ?? ''));
      return r != null
          ? d.copyWith(
              cantidadConteo: r.cantidadContada,
              fechaConteo: DateFormat('dd/MM/yyyy').parse(r.fechaContada),
              esConfirmado: r.esConfirmado == 1,
            )
          : d;
    }).toList();

    state = state.copyWith(
      conteoInventario:
          c.copyWith(listaDetalleRecuentoInventario: actualizados),
      productosPendientes:
          actualizados.where((d) => !(d.esConfirmado ?? false)).toList(),
      productosContados:
          actualizados.where((d) => d.esConfirmado == true).toList(),
      mostrarContados: state.mostrarContados,
    );
  }

  void _clasificarProductos() {
    final lista = state.conteoInventario?.listaDetalleRecuentoInventario ?? [];

    state = state.copyWith(
      productosPendientes: lista.where((d) => d.esConfirmado != true).toList(),
      productosContados: lista.where((d) => d.esConfirmado == true).toList(),
    );
  }
}

class DetalleConteoAsignadoState {
  final ConteoInventario? conteoInventario;
  final List<DetalleRecuentoInventario> productosPendientes;
  final List<DetalleRecuentoInventario> productosContados;
  final bool isLoading;
  final bool mostrarContados;
  final bool filtroActivo;
  final String textoFiltro;

  DetalleConteoAsignadoState({
    this.conteoInventario,
    this.productosPendientes = const [],
    this.productosContados = const [],
    this.isLoading = false,
    this.mostrarContados = false,
    this.filtroActivo = false,
    this.textoFiltro = '',
  });

  DetalleConteoAsignadoState copyWith({
    ConteoInventario? conteoInventario,
    List<DetalleRecuentoInventario>? productosPendientes,
    List<DetalleRecuentoInventario>? productosContados,
    bool? isLoading,
    bool? mostrarContados,
    bool? filtroActivo,
    String? textoFiltro,
  }) {
    return DetalleConteoAsignadoState(
      conteoInventario: conteoInventario ?? this.conteoInventario,
      productosPendientes: productosPendientes ?? this.productosPendientes,
      productosContados: productosContados ?? this.productosContados,
      isLoading: isLoading ?? this.isLoading,
      mostrarContados: mostrarContados ?? this.mostrarContados,
      filtroActivo: filtroActivo ?? this.filtroActivo,
      textoFiltro: textoFiltro ?? this.textoFiltro,
    );
  }
}
