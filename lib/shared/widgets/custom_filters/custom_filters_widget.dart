import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'custom_filters_provider.dart';
import 'package:flutter/services.dart';

enum DatePreset { today, lastWeek, lastMonth }

class CustomFiltersWidget extends ConsumerStatefulWidget {
  final bool showStatusFilter;
  
  const CustomFiltersWidget({
    Key? key,
    this.showStatusFilter = true,
  }) : super(key: key);

  @override
  ConsumerState<CustomFiltersWidget> createState() =>
      _CustomFiltersWidgetState();
}

class _CustomFiltersWidgetState extends ConsumerState<CustomFiltersWidget> {
  late TextEditingController _searchController;
  bool _hasSearchText = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() => _hasSearchText = _searchController.text.isNotEmpty);
    ref.read(customFiltersProvider.notifier).setName(_searchController.text);
  }

  void _resetFilters() {
    final notifier = ref.read(customFiltersProvider.notifier);
    notifier.clearAll();
    _searchController.clear();
    setState(() => _hasSearchText = false);
    HapticFeedback.selectionClick();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(customFiltersProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasActiveFilters = _hasActiveFilters();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: colorScheme.surface,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.tune_rounded,
                size: 16,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Filtros',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (hasActiveFilters) ...[
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _resetFilters,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.refresh_rounded,
                        size: 12,
                        color: Colors.red.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Limpiar',
                        style: TextStyle(
                          color: Colors.red.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(width: 16),
            if (widget.showStatusFilter) ...[
              _StatusFilter(
                currentStatus: filters.status,
                onChanged: (status) =>
                    ref.read(customFiltersProvider.notifier).setStatus(status),
              ),
              const SizedBox(width: 8),
            ],
            _DatePresetFilter(
              startDate: filters.startDate,
              endDate: filters.endDate,
              onDateRangeChanged: (start, end) => ref
                  .read(customFiltersProvider.notifier)
                  .setDateRange(start, end),
            ),
            const SizedBox(width: 8),
            _DateRangeFilter(
              startDate: filters.startDate,
              endDate: filters.endDate,
              onDateRangeChanged: (start, end) => ref
                  .read(customFiltersProvider.notifier)
                  .setDateRange(start, end),
            ),
            const SizedBox(width: 8),
            _SearchFilter(
              controller: _searchController,
              hasText: _hasSearchText,
              onClear: () {
                _searchController.clear();
                ref.read(customFiltersProvider.notifier).setName('');
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  bool _hasActiveFilters() {
    final filters = ref.read(customFiltersProvider);
    return (widget.showStatusFilter && filters.status != FilterStatus.all) ||
        filters.startDate != null ||
        filters.endDate != null ||
        filters.name.isNotEmpty;
  }
}

class _StatusFilter extends StatelessWidget {
  final FilterStatus currentStatus;
  final Function(FilterStatus) onChanged;

  const _StatusFilter({
    required this.currentStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _getStatusColor(currentStatus).withOpacity(0.3),
          width: 1.2,
        ),
      ),

      // Opcional si es visible
      child: DropdownButtonHideUnderline(
        child: DropdownButton<FilterStatus>(
          value: currentStatus,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: _getStatusColor(currentStatus),
            size: 16,
          ),
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          items: FilterStatus.values.map((status) {
            return DropdownMenuItem<FilterStatus>(
              value: status,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _getStatusColor(status),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(_getStatusLabel(status)),
                ],
              ),
            );
          }).toList(),
          onChanged: (status) {
            if (status != null) {
              onChanged(status);
              HapticFeedback.selectionClick();
            }
          },
        ),
      ),
    );
  }

  Color _getStatusColor(FilterStatus status) {
    switch (status) {
      case FilterStatus.all:
        return Colors.grey.shade600;
      case FilterStatus.pendiente:
        return Colors.amber.shade600;
      case FilterStatus.contando:
        return Colors.blue.shade600;
      case FilterStatus.finalizado:
        return Colors.green.shade600;
    }
  }

  String _getStatusLabel(FilterStatus status) {
    switch (status) {
      case FilterStatus.all:
        return 'Todos';
      case FilterStatus.pendiente:
        return 'Pendiente';
      case FilterStatus.contando:
        return 'En proceso';
      case FilterStatus.finalizado:
        return 'Completado';
    }
  }
}

class _DatePresetFilter extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime?, DateTime?) onDateRangeChanged;

  const _DatePresetFilter({
    required this.startDate,
    required this.endDate,
    required this.onDateRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentPreset = _getCurrentPreset();

    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: currentPreset != null
              ? AppTheme.primaryColor.withOpacity(0.5)
              : theme.colorScheme.outline.withOpacity(0.3),
          width: 1.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DatePreset?>(
          value: currentPreset,
          hint: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.schedule_rounded,
                size: 14,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              const SizedBox(width: 6),
              Text(
                'Rápido',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: currentPreset != null
                ? AppTheme.primaryColor
                : theme.colorScheme.onSurface.withOpacity(0.6),
            size: 16,
          ),
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          items: [
            const DropdownMenuItem<DatePreset?>(
              value: null,
              child: Text('Sin filtro'),
            ),
            ...DatePreset.values.map((preset) {
              return DropdownMenuItem<DatePreset?>(
                value: preset,
                child: Text(_getPresetLabel(preset)),
              );
            }),
          ],
          onChanged: (preset) {
            if (preset == null) {
              onDateRangeChanged(null, null);
            } else {
              final range = _getPresetDateRange(preset);
              onDateRangeChanged(range.start, range.end);
            }
            HapticFeedback.selectionClick();
          },
        ),
      ),
    );
  }

  DatePreset? _getCurrentPreset() {
    if (startDate == null || endDate == null) return null;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final weekAgo = today.subtract(const Duration(days: 7));
    final monthAgo = DateTime(now.year, now.month - 1, now.day);

    if (_isSameDay(startDate!, today) && _isSameDay(endDate!, today)) {
      return DatePreset.today;
    } else if (_isSameDay(startDate!, weekAgo) && _isSameDay(endDate!, today)) {
      return DatePreset.lastWeek;
    } else if (_isSameDay(startDate!, monthAgo) &&
        _isSameDay(endDate!, today)) {
      return DatePreset.lastMonth;
    }
    return null;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  DateTimeRange _getPresetDateRange(DatePreset preset) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    switch (preset) {
      case DatePreset.today:
        return DateTimeRange(start: today, end: today);
      case DatePreset.lastWeek:
        return DateTimeRange(
          start: today.subtract(const Duration(days: 7)),
          end: today,
        );
      case DatePreset.lastMonth:
        return DateTimeRange(
          start: DateTime(now.year, now.month - 1, now.day),
          end: today,
        );
    }
  }

  String _getPresetLabel(DatePreset preset) {
    switch (preset) {
      case DatePreset.today:
        return 'Hoy';
      case DatePreset.lastWeek:
        return 'Última semana';
      case DatePreset.lastMonth:
        return 'Último mes';
    }
  }
}

class _DateRangeFilter extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime?, DateTime?) onDateRangeChanged;

  const _DateRangeFilter({
    required this.startDate,
    required this.endDate,
    required this.onDateRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasDateRange = startDate != null || endDate != null;

    return GestureDetector(
      onTap: () => _showDateRangePicker(context),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: hasDateRange
                ? AppTheme.primaryColor.withOpacity(0.5)
                : theme.colorScheme.outline.withOpacity(0.3),
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.date_range_rounded,
              size: 14,
              color: hasDateRange
                  ? AppTheme.primaryColor
                  : theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 6),
            Text(
              _getDateRangeText(),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: hasDateRange
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDateRangeText() {
    if (startDate == null && endDate == null) {
      return 'Período';
    }
    if (startDate != null && endDate != null) {
      return '${startDate!.format()} - ${endDate!.format()}';
    }
    if (startDate != null) {
      return 'Desde ${startDate!.format()}';
    }
    return 'Hasta ${endDate!.format()}';
  }

  void _showDateRangePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: startDate != null && endDate != null
          ? DateTimeRange(start: startDate!, end: endDate!)
          : null,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'ES'),
      helpText: 'Seleccionar período',
      cancelText: 'Cancelar',
      confirmText: 'Aceptar',
      fieldStartHintText: 'Fecha inicio',
      fieldEndHintText: 'Fecha fin',
      fieldStartLabelText: 'Desde',
      fieldEndLabelText: 'Hasta',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppTheme.primaryColor,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDateRangeChanged(picked.start, picked.end);
      HapticFeedback.selectionClick();
    }
  }
}

class _SearchFilter extends StatefulWidget {
  final TextEditingController controller;
  final bool hasText;
  final VoidCallback onClear;

  const _SearchFilter({
    required this.controller,
    required this.hasText,
    required this.onClear,
  });

  @override
  State<_SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<_SearchFilter> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 36,
      width: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: widget.hasText
              ? AppTheme.primaryColor.withOpacity(0.5)
              : theme.colorScheme.outline.withOpacity(0.3),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            size: 14,
            color: widget.hasText
                ? AppTheme.primaryColor
                : theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 12,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (widget.hasText)
            GestureDetector(
              onTap: () {
                widget.onClear();
                HapticFeedback.lightImpact();
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close_rounded,
                  size: 10,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension _DateFormat on DateTime {
  String format() {
    const List<String> months = [
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic'
    ];
    return '$day ${months[month - 1]} $year';
  }
}