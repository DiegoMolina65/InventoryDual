import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextformfield extends StatefulWidget {
  const CustomTextformfield(
      {super.key,
      this.obscureText = false,
      this.validator,
      this.hintText,
      this.onChanged,
      this.initialValue,
      this.upperCase = false,
      this.controller,
      this.value,
      this.label,
      this.prefixIcon,
      this.readOnly = false,
      this.enabled,
      this.focusNode,
      this.inputFormatters,
      this.keyboardType,
      this.onFieldSubmitted});

  final bool obscureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool upperCase;
  final TextEditingController? controller;
  final String? label;
  final String? value;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  bool _hidePassword = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.obscureText;
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return TextFormField(
      controller: _controller,
      obscureText: _hidePassword,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        filled: true,
        fillColor: widget.readOnly ? Colors.grey.shade100 : Colors.white,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _hidePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: _visibilityPassword,
              )
            : null,
      ),
      validator: widget.validator,
      onChanged: (value) {
        if (widget.onChanged != null && !widget.readOnly) {
          final processedValue =
              widget.upperCase ? value.trim().toUpperCase() : value.trim();
          widget.onChanged!(processedValue);
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      textCapitalization: widget.upperCase
          ? TextCapitalization.characters
          : TextCapitalization.none,
    );
  }

  void _visibilityPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }
}
