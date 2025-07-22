import 'package:flutter/material.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/lista_detalle_producto/lista_detalle_producto.dart';
import 'package:m_dual_inventario/domain/entities/lista_conteo_resultados/lista_conteo_resultados_entidad.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/number_extensions.dart';

class TablaConteosProductosWidget extends StatelessWidget {
  final List<ListaDetalleProducto> listaDetalleProducto;

  const TablaConteosProductosWidget({
    super.key,
    required this.listaDetalleProducto,
  });

  @override
  Widget build(BuildContext context) {
    if (listaDetalleProducto.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.inventory_outlined,
                size: 64,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'No hay productos en esta toma',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resumen compacto
          _buildResumenCompacto(),

          const SizedBox(height: 16),

          // Lista de productos con conteos expandibles
          ...listaDetalleProducto.asMap().entries.map((entry) {
            final index = entry.key;
            final detalle = entry.value;
            return _buildProductoCard(detalle, index);
          }),
        ],
      ),
    );
  }

  Widget _buildProductoCard(ListaDetalleProducto detalle, int index) {
    final conteosAgrupados =
        _agruparConteosPorUsuario(detalle.listaConteoResultado ?? []);
    final resultado = _calcularResultado(detalle);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: _getResultadoColor(resultado).withOpacity(0.2),
          child: Text(
            '${index + 1}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _getResultadoColor(resultado),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detalle.producto.nombre,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Código: ${detalle.codigoProducto}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Stock: ${detalle.stock.toStringDecimal('UND')}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (detalle.codigoLote!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Lote: ${detalle.codigoLote}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
        trailing: _buildResultadoChip(resultado),
        children: [
          _buildConteosDetallados(conteosAgrupados),
        ],
      ),
    );
  }

  Widget _buildConteosDetallados(
      Map<String, List<ListaConteoResultadosEntidad>> conteosAgrupados) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detalle de Conteos por Responsable',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (conteosAgrupados.isEmpty)
            const Center(
              child: Text(
                'No hay conteos registrados',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else
            Column(
              children: conteosAgrupados.entries.map((entry) {
                final nombreUsuario = entry.key;
                final conteos = entry.value;
                return _buildResponsableConteos(nombreUsuario, conteos);
              }).toList(),
            ),
          const SizedBox(height: 12),
          _buildComparacionConteos(conteosAgrupados),
        ],
      ),
    );
  }

  Widget _buildResponsableConteos(
      String nombreUsuario, List<ListaConteoResultadosEntidad> conteos) {
    // Ordenar conteos por código
    conteos.sort(
        (a, b) => a.codigoConteoInventario.compareTo(b.codigoConteoInventario));

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                size: 16,
                color: Colors.blue.shade600,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  nombreUsuario,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${conteos.length} conteo${conteos.length > 1 ? 's' : ''}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Mostrar todos los conteos de este usuario de forma horizontal separada
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: conteos.asMap().entries.map((entry) {
                final conteo = entry.value;

                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Codigo conteo: ${conteo.codigoConteoInventario}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        conteo.cantidadContada.toStringDecimal('UND'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparacionConteos(
      Map<String, List<ListaConteoResultadosEntidad>> conteosAgrupados) {
    if (conteosAgrupados.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Row(
          children: [
            Icon(
              Icons.hourglass_empty,
              color: Colors.blue.shade600,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Sin conteos registrados',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      );
    }

    // Obtener todas las cantidades de todos los conteos (cada conteo individual)
    final todasLasCantidades = <double>[];
    for (final conteos in conteosAgrupados.values) {
      for (final conteo in conteos) {
        todasLasCantidades.add(conteo.cantidadContada);
      }
    }

    final todasIguales = todasLasCantidades.toSet().length == 1;
    final color = todasIguales ? Colors.green : Colors.orange;
    final mensaje =
        todasIguales ? 'Conteos Coinciden' : 'Conteos con Diferencia';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                todasIguales ? Icons.check_circle : Icons.warning,
                color: color.shade600,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                mensaje,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color.shade700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Cantidades registradas: ${todasLasCantidades.map((c) => c.toStringAsFixed(0)).join(', ')}',
            style: TextStyle(
              fontSize: 12,
              color: color.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultadoChip(String resultado) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (resultado.toLowerCase()) {
      case 'correcto':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade700;
        icon = Icons.check_circle;
        break;
      case 'con diferencia':
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade700;
        icon = Icons.warning;
        break;
      case 'sin conteo':
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade700;
        icon = Icons.hourglass_empty;
        break;
      default:
        backgroundColor = Colors.grey.shade100;
        textColor = Colors.grey.shade700;
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: textColor,
          ),
          const SizedBox(width: 4),
          Text(
            resultado.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumenCompacto() {
    final totalProductos = listaDetalleProducto.length;
    int correctos = 0;
    int conDiferencia = 0;
    int sinConteo = 0;

    for (final detalle in listaDetalleProducto) {
      final resultado = _calcularResultado(detalle);
      switch (resultado.toLowerCase()) {
        case 'correcto':
          correctos++;
          break;
        case 'con diferencia':
          conDiferencia++;
          break;
        case 'sin conteo':
          sinConteo++;
          break;
      }
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumen de Conteos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildResumenItemCompacto(
                  'Total',
                  totalProductos.toString(),
                  Colors.blue,
                  Icons.inventory_2,
                ),
                _buildResumenItemCompacto(
                  'Correctos',
                  correctos.toString(),
                  Colors.green,
                  Icons.check_circle,
                ),
                _buildResumenItemCompacto(
                  'Con Diferencia',
                  conDiferencia.toString(),
                  Colors.orange,
                  Icons.warning,
                ),
                _buildResumenItemCompacto(
                  'Sin Conteo',
                  sinConteo.toString(),
                  Colors.blue,
                  Icons.hourglass_empty,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumenItemCompacto(
      String label, String count, Color color, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Map<String, List<ListaConteoResultadosEntidad>> _agruparConteosPorUsuario(
      List<ListaConteoResultadosEntidad> conteos) {
    Map<String, List<ListaConteoResultadosEntidad>> agrupados = {};

    for (final conteo in conteos) {
      final nombreUsuario = conteo.nombreUsuario;
      if (agrupados.containsKey(nombreUsuario)) {
        agrupados[nombreUsuario]!.add(conteo);
      } else {
        agrupados[nombreUsuario] = [conteo];
      }
    }

    return agrupados;
  }

  String _calcularResultado(ListaDetalleProducto detalle) {
    final conteosAgrupados =
        _agruparConteosPorUsuario(detalle.listaConteoResultado ?? []);

    // Si no hay conteos, está sin conteo
    if (conteosAgrupados.isEmpty) {
      return 'Sin Conteo';
    }

    // Obtener todas las cantidades de todos los conteos (cada conteo individual)
    final todasLasCantidades = <double>[];
    for (final conteos in conteosAgrupados.values) {
      for (final conteo in conteos) {
        todasLasCantidades.add(conteo.cantidadContada);
      }
    }

    // Si no hay cantidades
    if (todasLasCantidades.isEmpty) {
      return 'Sin Conteo';
    }

    // Verificar si todas las cantidades son iguales
    final primeraCantidad = todasLasCantidades.first;
    final todasIguales =
        todasLasCantidades.every((cantidad) => cantidad == primeraCantidad);

    return todasIguales ? 'Correcto' : 'Con Diferencia';
  }

  Color _getResultadoColor(String resultado) {
    switch (resultado.toLowerCase()) {
      case 'correcto':
        return Colors.green;
      case 'con diferencia':
        return Colors.orange;
      case 'sin conteo':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
