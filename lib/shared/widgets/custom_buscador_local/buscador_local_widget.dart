import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/shared/widgets/custom_buscador_local/buscador_local_provider.dart';

class BuscadorLocalWidget<T> extends ConsumerStatefulWidget {
  final StateNotifierProvider<LocalSearchNotifier<T>, LocalSearchState<T>>
      provider;
  final String hintText;
  final String Function(int found, int total)? formatCount;
  final Color? backgroundColor;
  final bool showCount;

  const BuscadorLocalWidget({
    Key? key,
    required this.provider,
    this.hintText = 'Buscar...',
    this.formatCount,
    this.backgroundColor,
    this.showCount = true,
  }) : super(key: key);

  @override
  ConsumerState<BuscadorLocalWidget<T>> createState() =>
      _LocalSearchWidgetState<T>();
}

class _LocalSearchWidgetState<T> extends ConsumerState<BuscadorLocalWidget<T>> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _searchFocusNode.addListener(_onFocusChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.unfocus();
    });
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _searchFocusNode.hasFocus;
    });

    if (!_searchFocusNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.removeListener(_onFocusChange);
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BuscadorLocalWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.provider != widget.provider) {
      final state = ref.read(widget.provider);
      if (_searchController.text != state.searchText) {
        _searchController.text = state.searchText;
      }
    }
  }

  void _onSearchChanged() {
    setState(() {
      _hasText = _searchController.text.isNotEmpty;
    });

    ref.read(widget.provider.notifier).updateSearchText(_searchController.text);
  }

  void _clearSearch() {
    _searchController.clear();
    ref.read(widget.provider.notifier).clearSearch();
    _searchFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final borderColor = _isFocused ? primaryColor : Colors.grey[300]!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
      color: widget.backgroundColor ?? Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: borderColor,
                width: _isFocused ? 2.0 : 1.0,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: _isFocused
                        ? primaryColor.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: _isFocused ? primaryColor : Colors.grey[500],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textInputAction: TextInputAction.search,
                    onEditingComplete: () {
                      _searchFocusNode.unfocus();
                    },
                  ),
                ),
                if (_hasText)
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: _clearSearch,
                        splashColor: Colors.red.shade200,
                        highlightColor: Colors.red.shade300,
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          if (widget.showCount && _hasText)
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(widget.provider);
                final found = state.filteredList.length;
                final total = state.originalList.length;
                final text = widget.formatCount != null
                    ? widget.formatCount!(found, total)
                    : 'Encontrados: $found de $total';
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: found > 0 ? Colors.green[700] : Colors.red[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
