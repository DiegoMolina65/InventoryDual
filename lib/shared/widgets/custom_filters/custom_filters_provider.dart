import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterStatus { all, pendiente, contando, finalizado }

class CustomFiltersState {
  final FilterStatus status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String name;

  CustomFiltersState({
    this.status = FilterStatus.all,
    this.startDate,
    this.endDate,
    this.name = '',
  });

  CustomFiltersState copyWith({
    FilterStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? name,
  }) {
    return CustomFiltersState(
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      name: name ?? this.name,
    );
  }
}

class CustomFiltersNotifier extends StateNotifier<CustomFiltersState> {
  CustomFiltersNotifier() : super(CustomFiltersState());

  void setStatus(FilterStatus status) {
    state = state.copyWith(status: status);
  }

  void setDateRange(DateTime? start, DateTime? end) {
    state = state.copyWith(startDate: start, endDate: end);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void clearAll() {
    state = CustomFiltersState();
  }
}

/// Provider para acceder al notifier
final customFiltersProvider =
    StateNotifierProvider<CustomFiltersNotifier, CustomFiltersState>(
  (ref) => CustomFiltersNotifier(),
);
