import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalSearchState<T> {
  final String searchText;
  final List<T> originalList;
  final List<T> filteredList;
  final Function(String, T) customFilter;

  LocalSearchState({
    this.searchText = '',
    this.originalList = const [],
    this.filteredList = const [],
    required this.customFilter,
  });

  LocalSearchState<T> copyWith({
    String? searchText,
    List<T>? originalList,
    List<T>? filteredList,
    Function(String, T)? customFilter,
  }) {
    return LocalSearchState<T>(
      searchText: searchText ?? this.searchText,
      originalList: originalList ?? this.originalList,
      filteredList: filteredList ?? this.filteredList,
      customFilter: customFilter ?? this.customFilter,
    );
  }
}

// Notificador del estado para manejar la lógica del buscador local
class LocalSearchNotifier<T> extends StateNotifier<LocalSearchState<T>> {
  LocalSearchNotifier({
    required Function(String, T) customFilter,
    List<T> initialList = const [],
  }) : super(LocalSearchState<T>(
          customFilter: customFilter,
          originalList: initialList,
          filteredList: initialList,
        ));

  // Actualiza el texto de búsqueda y filtra la lista
  void updateSearchText(String text) {
    final normalizedText = text.toUpperCase().trim();

    final filtered = normalizedText.isEmpty
        ? state.originalList
        : state.originalList
            .where((item) => state.customFilter(normalizedText, item))
            .toList();

    state = state.copyWith(
      searchText: normalizedText,
      filteredList: filtered,
    );
  }

  // Limpia el texto de búsqueda y restablece la lista original
  void clearSearch() {
    state = state.copyWith(
      searchText: '',
      filteredList: state.originalList,
    );
  }

  // Actualiza la lista original y vuelve a aplicar el filtro si es necesario
  void updateOriginalList(List<T> newList) {
    final filtered = state.searchText.isEmpty
        ? newList
        : newList
            .where((item) => state.customFilter(state.searchText, item))
            .toList();

    state = state.copyWith(
      originalList: newList,
      filteredList: filtered,
    );
  }
}

// Provider para manejar instancias independientes del buscador local
StateNotifierProvider<LocalSearchNotifier<T>, LocalSearchState<T>>
    localSearchProviderFamily<T>(
  String providerId, {
  required Function(String, T) customFilter,
  List<T> initialList = const [],
}) {
  return StateNotifierProvider<LocalSearchNotifier<T>, LocalSearchState<T>>(
    (ref) => LocalSearchNotifier<T>(
      customFilter: customFilter,
      initialList: initialList,
    ),
    name: 'local_search_$providerId',
  );
}
