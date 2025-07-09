import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/conteo/registro_conteo_producto_local/registro_conteo_producto.dart';
import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
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
    final conteoActual = state.conteoInventario;
    if (conteoActual == null) return false;
    final index = conteoActual.listaDetalleRecuentoInventario
        .indexWhere((d) => d.codigoProducto == detalleProducto.codigoProducto);

    if (index == -1) return false;

    final List<DetalleRecuentoInventario> listaDetallesActualizada =
        List.from(conteoActual.listaDetalleRecuentoInventario);

    final detalleActualizado = detalleProducto.copyWith(
      fechaConteo: DateTime.now(),
      esConfirmado: confirmar ? true : detalleProducto.esConfirmado,
    );

    listaDetallesActualizada[index] = detalleActualizado;

    final previo = await _repo.obtenerRegistroConteoProductoPorLote(
      codigoConteo: conteoActual.codigo,
      codigoProducto: detalleProducto.codigoProducto,
      codigoLote: '',
    );

    final reg = RegistroConteoProducto(
      codigo: previo?.codigo,
      codigoConteo: conteoActual.codigo,
      codigoProducto: detalleProducto.codigoProducto,
      codigoLote: '',
      cantidadContada: detalleProducto.cantidadConteo,
      fechaContada: DateTime.now().shortDate(),
      sincronizadoServidor: previo?.sincronizadoServidor ?? 0,
      esConfirmado: confirmar ? 1 : (previo?.esConfirmado ?? 0),
    );

    await _repo.guardarRegistroConteoProductoLocal(reg);

    state = state.copyWith(
      conteoInventario: conteoActual.copyWith(
        listaDetalleRecuentoInventario: listaDetallesActualizada,
      ),
    );

    await _restaurarConteosLocales();
    _clasificarProductos();
    return true;
  }

  Future<bool> actualizarCantidadLoteProducto({
    required int codigoConteo,
    required String codigoProducto,
    required String codigoLote,
    required double nuevaCantidad,
    bool confirmar = false,
  }) async {
    final conteoActual = state.conteoInventario;
    if (conteoActual == null) return false;
    final detalleProductoIndex = conteoActual.listaDetalleRecuentoInventario
        .indexWhere((d) => d.codigoProducto == codigoProducto);

    if (detalleProductoIndex == -1) return false;

    final detalleProductoOriginal =
        conteoActual.listaDetalleRecuentoInventario[detalleProductoIndex];

    final previo = await _repo.obtenerRegistroConteoProductoPorLote(
      codigoConteo: codigoConteo,
      codigoProducto: codigoProducto,
      codigoLote: codigoLote,
    );

    final reg = RegistroConteoProducto(
      codigo: previo?.codigo,
      codigoConteo: codigoConteo,
      codigoProducto: codigoProducto,
      codigoLote: codigoLote,
      cantidadContada: nuevaCantidad,
      fechaContada: DateTime.now().shortDate(),
      sincronizadoServidor: previo?.sincronizadoServidor ?? 0,
      esConfirmado: confirmar ? 1 : (previo?.esConfirmado ?? 0),
    );
    await _repo.guardarRegistroConteoProductoLocal(reg);

    final List<LotesEntidad> listaLotesActualizada =
        detalleProductoOriginal.producto!.listaLotes!.map((lote) {
      if (lote.codigo == codigoLote) {
        return lote.copyWith(cantidad: nuevaCantidad);
      }
      return lote;
    }).toList();

    final nuevaCantidadTotalContada =
        listaLotesActualizada.fold(0.0, (sum, lote) => sum + (lote.cantidad));

    final detalleProductoActualizado = detalleProductoOriginal.copyWith(
      producto: detalleProductoOriginal.producto!
          .copyWith(listaLotes: listaLotesActualizada),
      cantidadConteo: nuevaCantidadTotalContada,
      fechaConteo: DateTime.now(),
      esConfirmado: confirmar ? true : detalleProductoOriginal.esConfirmado,
    );

    final List<DetalleRecuentoInventario> listaDetallesActualizada =
        List.from(conteoActual.listaDetalleRecuentoInventario);
    listaDetallesActualizada[detalleProductoIndex] = detalleProductoActualizado;

    state = state.copyWith(
      conteoInventario: conteoActual.copyWith(
        listaDetalleRecuentoInventario: listaDetallesActualizada,
      ),
    );

    await _restaurarConteosLocales();
    _clasificarProductos();
    return true;
  }

  Future<int> guardarConteo() async {
    final c = state.conteoInventario;
    if (c == null) {
      return 0;
    }

    state = state.copyWith(isLoading: true);
    final locales = await _repo.obtenerRegistrosPendientes();

    final List<DetalleRecuentoInventario> detallesAEnviar = [];

    for (final detalle in c.listaDetalleRecuentoInventario) {
      if (detalle.producto?.listaLotes?.isNotEmpty == true) {
        final List<LotesEntidad> lotesContadosParaEnviar = [];
        double cantidadTotalContadaParaEnviar = 0.0;

        for (final lote in detalle.producto!.listaLotes!) {
          final reg = locales.firstWhereOrNull((r) =>
              r.codigoConteo == c.codigo &&
              r.codigoProducto == detalle.codigoProducto &&
              r.codigoLote == lote.codigo);

          if (reg != null) {
            lotesContadosParaEnviar.add(lote.copyWith(
              cantidad: reg.cantidadContada,
            ));
            cantidadTotalContadaParaEnviar += reg.cantidadContada;
          } else {
            lotesContadosParaEnviar.add(lote.copyWith(cantidad: 0.0));
          }
        }

        if (lotesContadosParaEnviar.isNotEmpty ||
            (detalle.esConfirmado == true)) {
          detallesAEnviar.add(detalle.copyWith(
            cantidadConteo: cantidadTotalContadaParaEnviar,
            fechaConteo: DateTime.now(),
            producto:
                detalle.producto?.copyWith(listaLotes: lotesContadosParaEnviar),
            esConfirmado: detalle.esConfirmado,
          ));
        }
      } else {
        final reg = locales.firstWhereOrNull((r) =>
            r.codigoConteo == c.codigo &&
            r.codigoProducto == detalle.codigoProducto &&
            (r.codigoLote == '' || r.codigoLote == null));

        if (reg != null) {
          detallesAEnviar.add(detalle.copyWith(
            cantidadConteo: reg.cantidadContada,
            fechaConteo: DateFormat('dd/MM/yyyy', 'es').parse(reg.fechaContada),
            esConfirmado: reg.esConfirmado == 1,
          ));
        } else if (detalle.esConfirmado == true) {
          detallesAEnviar.add(detalle.copyWith(
            cantidadConteo: 0.0,
            fechaConteo: DateTime.now(),
            esConfirmado: true,
          ));
        }
      }
    }

    final codigoUsuario = c.codigoUsuarioAsignado;
    final codigoAlmacen = c.codigoAlmacen;

    final finalizado = c.copyWith(
      codigoAlmacen: codigoAlmacen,
      codigoUsuarioAsignado: codigoUsuario,
      estadoConteo: "FINALIZADO",
      fechaFin: DateTime.now(),
      listaDetalleRecuentoInventario: detallesAEnviar,
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
      double cantidadTotalContada = 0.0;
      bool productoEsConfirmado = false;

      if (d.producto?.listaLotes?.isNotEmpty == true) {
        final List<LotesEntidad> lotesConteoRestaurado =
            d.producto!.listaLotes!.map((lote) {
          final r = regs.firstWhereOrNull((reg) =>
              reg.codigoConteo == c.codigo &&
              reg.codigoProducto == d.codigoProducto &&
              reg.codigoLote == lote.codigo);
          if (r != null) {
            cantidadTotalContada += r.cantidadContada;
            return lote.copyWith(cantidad: r.cantidadContada);
          }
          return lote.copyWith(cantidad: lote.cantidad);
        }).toList();

        final localBatchRecordsForProduct = regs.where((reg) =>
            reg.codigoConteo == c.codigo &&
            reg.codigoProducto == d.codigoProducto &&
            reg.codigoLote != null &&
            reg.codigoLote!.isNotEmpty);

        if (localBatchRecordsForProduct.isNotEmpty) {
          productoEsConfirmado =
              localBatchRecordsForProduct.every((reg) => reg.esConfirmado == 1);
        } else if (d.esConfirmado == true && cantidadTotalContada == 0) {
          productoEsConfirmado = true;
        } else {
          productoEsConfirmado = false;
        }

        return d.copyWith(
          producto: d.producto!.copyWith(listaLotes: lotesConteoRestaurado),
          cantidadConteo: cantidadTotalContada,
          fechaConteo: DateTime.now(),
          esConfirmado: productoEsConfirmado,
        );
      } else {
        final r = regs.firstWhereOrNull((reg) =>
            reg.codigoConteo == c.codigo &&
            reg.codigoProducto == d.codigoProducto &&
            (reg.codigoLote == '' || reg.codigoLote == null));

        if (r != null) {
          cantidadTotalContada = r.cantidadContada;
          productoEsConfirmado = r.esConfirmado == 1;
        } else {
          cantidadTotalContada = d.cantidadConteo;
          productoEsConfirmado = d.esConfirmado ?? false;
        }

        return d.copyWith(
          cantidadConteo: cantidadTotalContada,
          fechaConteo: r != null
              ? DateFormat('dd/MM/yyyy').parse(r.fechaContada)
              : d.fechaConteo,
          esConfirmado: productoEsConfirmado,
        );
      }
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
