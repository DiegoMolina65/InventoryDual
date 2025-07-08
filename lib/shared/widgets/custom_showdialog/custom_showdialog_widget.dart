import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_dual_inventario/config/theme/app_theme.dart';
import 'dart:ui';

class CustomShowDialog extends StatefulWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  final Color backgroundColor;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final bool useScrollView;
  final bool showCloseButton;
  final Duration animationDuration;
  final IconData? icon;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final bool showShadowUnderTitle;
  final Widget? customHeader;

  static const double defaultMaxWidth = 400.0;
  static const double defaultMaxHeight = 800.0;

  const CustomShowDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
    this.backgroundColor = Colors.white,
    this.contentPadding = const EdgeInsets.all(24),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.useScrollView = true,
    this.showCloseButton = true,
    this.animationDuration = const Duration(milliseconds: 400),
    this.icon,
    this.iconBackgroundColor,
    this.iconColor = Colors.white,
    this.showShadowUnderTitle = true,
    this.customHeader,
  }) : super(key: key);

  static Future<void> closeDialog(BuildContext context) async {
    final state = context.findAncestorStateOfType<_CustomShowDialogState>();
    if (state != null) {
      await state._closeWithAnimation();
    } else if (context.mounted) {
      context.pop();
    }
  }

  @override
  State<CustomShowDialog> createState() => _CustomShowDialogState();
}

class _CustomShowDialogState extends State<CustomShowDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _blurAnimation = Tween<double>(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _closeWithAnimation() async {
    await _animationController.reverse();
    if (mounted && context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = AppTheme.primaryColor;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            
            sigmaX: _blurAnimation.value,
            sigmaY: _blurAnimation.value,
          ),
          child: Dialog(
            key: UniqueKey(),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: CustomShowDialog.defaultMaxWidth,
                    maxHeight: CustomShowDialog.defaultMaxHeight,
                  ),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: widget.borderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: widget.borderRadius,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Custom header or default header
                        widget.customHeader ?? _buildHeader(primaryColor),

                        // Content area
                        Flexible(
                          child: widget.useScrollView
                              ? SingleChildScrollView(
                                  child: Padding(
                                    padding: widget.contentPadding,
                                    child: widget.content,
                                  ),
                                )
                              : Padding(
                                  padding: widget.contentPadding,
                                  child: widget.content,
                                ),
                        ),

                        // Actions area
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark
                                ? Colors.black.withOpacity(0.05)
                                : Colors.grey.shade50,
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: widget.actions.length == 1
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceBetween,
                            children: _buildActionButtons(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 16, 12),
      decoration: BoxDecoration(
        color: widget.showShadowUnderTitle
            ? Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withOpacity(0.05)
                : Colors.white
            : null,
        boxShadow: widget.showShadowUnderTitle
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          // Title
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),

          // Close button
          if (widget.showCloseButton)
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => CustomShowDialog.closeDialog(context),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildActionButtons() {
    if (widget.actions.length == 1) {
      return widget.actions;
    }

    List<Widget> result = [];
    for (int i = 0; i < widget.actions.length; i++) {
      if (i > 0) {
        result.add(const SizedBox(width: 16));
      }
      result.add(Expanded(child: widget.actions[i]));
    }

    return result;
  }
}

class CustomShowDialogHelper {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    required List<Widget> actions,
    Color backgroundColor = Colors.white,
    EdgeInsetsGeometry padding = const EdgeInsets.all(24),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
    bool barrierDismissible = false,
    bool showCloseButton = true,
    Duration animationDuration = const Duration(milliseconds: 400),
    IconData? icon,
    Color? iconBackgroundColor,
    Color iconColor = Colors.white,
    bool showShadowUnderTitle = true,
    Widget? customHeader,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext dialogContext) => CustomShowDialog(
        title: title,
        content: content,
        actions: actions,
        backgroundColor: backgroundColor,
        contentPadding: padding,
        borderRadius: borderRadius,
        showCloseButton: showCloseButton,
        animationDuration: animationDuration,
        icon: icon,
        iconBackgroundColor: iconBackgroundColor,
        iconColor: iconColor,
        showShadowUnderTitle: showShadowUnderTitle,
        customHeader: customHeader,
      ),
    );
  }

  static Widget createButtonShowDialog({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    double elevation = 1.5,
    bool isOutlined = false,
    IconData? icon,
    bool isLoading = false,
  }) {
    // Determine color based on button text
    Color defaultColor;
    if (text == 'CANCELAR' || text == 'NO' || text == 'CERRAR') {
      defaultColor = AppTheme.dangerColor;
    } else if (text == 'CONFIRMAR' ||
        text == 'SI' ||
        text == 'SÍ' ||
        text == 'GUARDAR' ||
        text == 'VOLVER' ||
        text == 'ACEPTAR') {
      defaultColor = AppTheme.successColor;
    } else if (text == 'ELIMINAR') {
      defaultColor = AppTheme.dangerColor;
    } else {
      defaultColor = AppTheme.primaryColor;
    }

    final buttonColor = backgroundColor ?? defaultColor;
    const buttonTextColor =
        Colors.white; 

    final displayText = text == 'SALIR' ? 'VOLVER' : text;

    return SizedBox(
      height: 48,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: buttonColor, width: 1.5),
                padding: padding,
                foregroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _buildButtonContent(
                displayText,
                buttonColor, 
                icon,
                isLoading,
              ),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
                padding: padding,
                elevation: elevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _buildButtonContent(
                displayText,
                buttonTextColor,
                icon,
                isLoading,
              ),
            ),
    );
  }

  static Widget _buildButtonContent(
    String text,
    Color textColor,
    IconData? icon,
    bool isLoading,
  ) {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: textColor,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );
  }

  static Future<void> closeShowDialogo(BuildContext context) {
    return CustomShowDialog.closeDialog(context);
  }
}
