import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatefulWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final Function(T?) onChanged;
  final Color? primaryColor;
  final Widget? prefixIcon;
  final bool isExpanded;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool isLoading;
  final String? Function(T?)? validator;
  final bool showInfoColumns;
  final List<ColumnInfo>? infoColumns;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    this.prefixIcon,
    this.isExpanded = true,
    this.contentPadding,
    this.readOnly = false,
    this.isLoading = false,
    this.validator,
    this.primaryColor,
    this.showInfoColumns = false,
    this.infoColumns,
  }) : super(key: key);

  @override
  State<CustomDropdownField<T>> createState() => _CustomDropdownFieldState<T>();
}

class _CustomDropdownFieldState<T> extends State<CustomDropdownField<T>> {
  late List<T> _filteredItems;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _updateFilteredItems();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _isDropdownOpen) {
        _hideDropdown();
      }
    });
  }

  @override
  void didUpdateWidget(CustomDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _updateFilteredItems();
    }
  }

  void _updateFilteredItems() {
    _filteredItems = List<T>.from(widget.items);
    _filteredItems.sort((a, b) => widget
        .getLabel(a)
        .toLowerCase()
        .compareTo(widget.getLabel(b).toLowerCase()));

    if (_searchQuery.isNotEmpty) {
      _filteredItems = _filteredItems
          .where((item) => widget
              .getLabel(item)
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    if (widget.value != null && _filteredItems.contains(widget.value)) {
      _filteredItems.remove(widget.value);
      _filteredItems.insert(0, widget.value as T);
    }
  }

  void _showDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + -20),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints(maxHeight: 300, minWidth: size.width),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.primaryColor ??
                      Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: widget.primaryColor ??
                                Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _updateFilteredItems();
                          _updateOverlay();
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      shrinkWrap: true,
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        final isSelected = widget.value == item;

                        return InkWell(
                          onTap: () {
                            widget.onChanged(item);
                            _hideDropdown();
                          },
                          child: Container(
                            color: isSelected
                                ? (widget.primaryColor ??
                                        Theme.of(context).colorScheme.primary)
                                    .withOpacity(0.1)
                                : null,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: widget.showInfoColumns &&
                                    widget.infoColumns != null
                                ? _buildRowWithColumns(item, isSelected)
                                : Text(
                                    widget.getLabel(item),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? widget.primaryColor ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                          : Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _hideDropdown() {
    _searchController.clear();
    _searchQuery = '';
    _updateFilteredItems();
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  void _updateOverlay() {
    _overlayEntry?.markNeedsBuild();
  }

  Widget _buildRowWithColumns(T item, bool isSelected) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            widget.getLabel(item),
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? widget.primaryColor ?? Theme.of(context).colorScheme.primary
                  : Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ...widget.infoColumns!.map((column) {
          final dynamic value = column.getValue(item);
          final Color? color =
              column.getColor != null ? column.getColor!(item) : null;

          return Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color ?? Colors.black,
                    ),
                  ),
                  Text(
                    column.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSelectedValueWithColumns() {
    if (widget.value == null) {
      return const Text(
        'Seleccione una opción',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        overflow: TextOverflow.ellipsis,
      );
    }

    if (!widget.showInfoColumns ||
        widget.infoColumns == null ||
        widget.infoColumns!.isEmpty) {
      return Text(
        widget.getLabel(widget.value as T),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        overflow: TextOverflow.ellipsis,
      );
    }

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            widget.getLabel(widget.value as T),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ...widget.infoColumns!.map((column) {
          final dynamic value = column.getValue(widget.value as T);
          final Color? color = column.getColor != null
              ? column.getColor!(widget.value as T)
              : null;

          return Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color ?? Colors.black,
                    ),
                  ),
                  Text(
                    column.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        widget.primaryColor ?? Theme.of(context).colorScheme.primary;

    if (widget.isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: primaryColor,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: widget.readOnly
                ? null
                : () {
                    if (_isDropdownOpen) {
                      _hideDropdown();
                    } else {
                      _showDropdown();
                    }
                  },
            child: Container(
              height: widget.showInfoColumns && widget.infoColumns != null
                  ? 68
                  : 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isDropdownOpen
                      ? primaryColor
                      : primaryColor.withOpacity(0.5),
                  width: _isDropdownOpen ? 2 : 1,
                ),
                color: Colors.white,
              ),
              padding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  if (widget.prefixIcon != null) ...[
                    widget.prefixIcon!,
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: _buildSelectedValueWithColumns(),
                  ),
                  Icon(
                    _isDropdownOpen
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.validator != null &&
            widget.value != null &&
            widget.validator!(widget.value) != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 12),
            child: Text(
              widget.validator!(widget.value) ?? '',
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

class ColumnInfo<T> {
  final String title;
  final dynamic Function(T) getValue;
  final Color? Function(T)? getColor;

  ColumnInfo({
    required this.title,
    required this.getValue,
    this.getColor,
  });
}
