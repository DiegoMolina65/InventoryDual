import 'package:flutter/material.dart';

Future<void> mostrarDialogoAyuda(BuildContext context) async {
  final colorScheme = Theme.of(context).colorScheme;

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      titlePadding: const EdgeInsets.only(top: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.help_outline_rounded,
            size: 48,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          const Text(
            'ASISTENTE DE AYUDA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Este asistente le permitirá crear una nueva toma de inventario en 3 sencillos pasos:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          _buildPaso('1. Información inicial', 'Nombre y almacén'),
          _buildPaso('2. Agregar productos', 'Seleccione los productos'),
          _buildPaso('3. Confirmar', 'Revise y finalice la toma'),
          const SizedBox(height: 20),
        ],
      ),
      actions: [
        Center(
          child: TextButton.icon(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            icon: const Icon(Icons.check_rounded, color: Colors.white),
            label: const Text(
              'ENTENDIDO',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPaso(String titulo, String descripcion) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle_outline, size: 20, color: Colors.black54),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              children: [
                TextSpan(text: '$titulo: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: descripcion),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
