import 'package:flutter/material.dart';

class CabeceraProductosWidget extends StatelessWidget {
  final int cantidadPendientes;
  final int cantidadTotal;
  final bool mostrandoContados;
  final VoidCallback onToggleVista;
  final bool filtroActivo;

  const CabeceraProductosWidget({
    super.key,
    required this.cantidadPendientes,
    required this.cantidadTotal,
    required this.mostrandoContados,
    required this.onToggleVista,
    this.filtroActivo = false,
  });

  @override
  Widget build(BuildContext context) {
    final int cantidadContados = cantidadTotal - cantidadPendientes;
    final double porcentajeAvance =
        cantidadTotal > 0 ? (cantidadContados / cantidadTotal) * 100 : 0;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    mostrandoContados
                        ? 'Productos Contados (${filtroActivo ? "Filtrado" : cantidadContados})'
                        : 'Productos Pendientes (${filtroActivo ? "Filtrado" : cantidadPendientes})',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!filtroActivo)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: LinearProgressIndicator(
                    value: cantidadTotal > 0
                        ? cantidadContados / cantidadTotal
                        : 0,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 8,
                  width: double.infinity,
                  child: LinearProgressIndicator(
                    value: 0,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    filtroActivo
                        ? 'Búsqueda activada'
                        : 'Avance: ${porcentajeAvance.toStringAsFixed(0)}% ($cantidadContados de $cantidadTotal)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: filtroActivo ? Colors.grey : Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                // OPCIÓN 1: Botón con estado actual más claro
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onToggleVista,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            mostrandoContados
                                ? Icons.check_circle
                                : Icons.pending,
                            color: mostrandoContados
                                ? Colors.green
                                : Colors.orange,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            mostrandoContados ? 'CONTADOS' : 'PENDIENTES',
                            style: TextStyle(
                              color: mostrandoContados
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.swap_horiz,
                            color: Colors.grey[600],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
