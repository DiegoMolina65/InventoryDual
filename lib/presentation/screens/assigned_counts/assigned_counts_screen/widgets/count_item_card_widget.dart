import 'package:flutter/material.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/datetime_extensions.dart';

class ConteoCard extends StatelessWidget {
  // final int tdi;
  // final int nroConteo;
  final String nombreToma;
  final String tipo;
  final int cantidadProductos;
  final int cantidadContados;
  final String estadoConteo;
  final int codigo;
  final DateTime fechaCreacion;
  final VoidCallback onTap;

  const ConteoCard({
    super.key,
    required this.codigo,
    // required this.tdi,
    required this.fechaCreacion,
    // required this.nroConteo,
    required this.nombreToma,
    required this.tipo,
    required this.cantidadProductos,
    required this.cantidadContados,
    required this.estadoConteo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fechaCreacionFormateada = fechaCreacion.shortDate();

    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'NRO CONTEO: $codigo',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '/ FECHA DE CREACIÓN: $fechaCreacionFormateada',
                          style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildEstadoChip(estadoConteo),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text.rich(TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  children: [
                    const TextSpan(
                      text: 'TIPO DE CONTEO: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: tipo),
                    const TextSpan(
                      text: ' / ',
                    ),
                    const TextSpan(
                      text: 'NOMBRE DE LA TOMA: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: nombreToma,
                    )
                  ])),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildContadorItem(
                      cantidadProductos,
                      Colors.blue,
                      'Cantidad de Productos',
                      Icons.inventory_2_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: _buildContadorItem(
                      cantidadContados,
                      Colors.orange,
                      'Avance Conteo',
                      Icons.check_circle_outline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildEstadoChip(String estadoConteo) {
    Color color;
    String textoEstado;

    switch (estadoConteo.toUpperCase()) {
      case 'CONTANDO':
        color = Colors.green;
        textoEstado = 'CONTANDO';
        break;
      case 'FINALIZADO':
        color = Colors.blue;
        textoEstado = 'FINALIZADO';
        break;
      case 'PENDIENTE':
      default:
        color = Colors.red;
        textoEstado = 'PENDIENTE';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5.5,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        textoEstado,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContadorItem(
      int cantidad, Color color, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 4),
              Text(
                cantidad.toString(),
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
