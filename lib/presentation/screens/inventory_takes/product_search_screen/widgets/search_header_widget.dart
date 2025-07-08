import 'package:flutter/material.dart';
import 'package:m_dual_inventario/presentation/screens/inventory_takes/product_search_screen/strategies/search_strategy.dart';

class EncabezadoBusquedaWidget extends StatelessWidget {
  final BusquedaStrategy strategy;
  final int encontrados;
  final int seleccionados;
  final String nombreBusqueda;
  final Function()? onSelectAll;
  final Function()? onDeselectAll;
  final bool allSelected;
  final bool showOnlySelected;
  final Function() onToggleView;

  const EncabezadoBusquedaWidget({
    Key? key,
    required this.strategy,
    required this.encontrados,
    required this.seleccionados,
    this.nombreBusqueda = '',
    this.onSelectAll,
    this.onDeselectAll,
    this.allSelected = false,
    required this.showOnlySelected,
    required this.onToggleView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0, bottom: 4.0),
            child: Row(
              children: [
                Icon(Icons.filter_list, color: primaryColor, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    nombreBusqueda.isNotEmpty
                        ? nombreBusqueda
                        : strategy.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _TabButton(
                  label: 'ENCONTRADOS',
                  conteo: encontrados,
                  color: const Color(0xFF1E88E5),
                  isSelected: !showOnlySelected,
                  onTap: showOnlySelected ? onToggleView : null,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: _TabButton(
                  label: 'SELECCIONADOS',
                  conteo: seleccionados,
                  color: const Color(0xFF6D4C41),
                  isSelected: showOnlySelected,
                  onTap: !showOnlySelected ? onToggleView : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: allSelected ? Icons.check_box : Icons.check,
                  label:
                      allSelected ? 'Deseleccionar todos' : 'Seleccionar todos',
                  color: const Color(0xFF546E7A),
                  onTap: allSelected ? onDeselectAll : onSelectAll,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final int conteo;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const _TabButton({
    required this.label,
    required this.conteo,
    required this.color,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? color : color.withOpacity(0.6),
            borderRadius: BorderRadius.circular(5),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: color.withOpacity(0.25),
                      spreadRadius: 0.3,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ]
                : null,
            border:
                isSelected ? Border.all(color: Colors.white, width: 1.2) : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$conteo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isSelected ? 15 : 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isSelected ? 11.5 : 10.5,
                ),
                textAlign: TextAlign.center,
              ),
              if (isSelected)
                const Padding(
                  padding: EdgeInsets.only(top: 2.5),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.15),
                spreadRadius: 0.3,
                blurRadius: 1.5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
