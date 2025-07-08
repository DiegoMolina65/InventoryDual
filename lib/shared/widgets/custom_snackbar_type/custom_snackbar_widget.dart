import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  warning,
  error,
  info,
}

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required SnackBarType type,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),
  }) {
    final Color backgroundColor;
    final IconData icon;
    final Color lightColor;
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = colorScheme.secondary;
        icon = Icons.check_circle_rounded;
        lightColor = colorScheme.secondary.withOpacity(0.2);
        break;
      case SnackBarType.warning:
        backgroundColor = colorScheme.tertiary;
        icon = Icons.warning_rounded;
        lightColor = colorScheme.tertiary.withOpacity(0.2);
        break;
      case SnackBarType.error:
        backgroundColor = colorScheme.error;
        icon = Icons.error_rounded;
        lightColor = colorScheme.error.withOpacity(0.2);
        break;
      case SnackBarType.info:
        backgroundColor = colorScheme.primary;
        icon = Icons.info_rounded;
        lightColor = colorScheme.primary.withOpacity(0.2);
        break;
    }

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
      duration: duration,
      content: _AnimatedSnackBarContent(
        backgroundColor: backgroundColor,
        lightColor: lightColor,
        icon: icon,
        message: message,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      ),
    );

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }
}

class _AnimatedSnackBarContent extends StatefulWidget {
  final Color backgroundColor;
  final Color lightColor;
  final IconData icon;
  final String message;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const _AnimatedSnackBarContent({
    Key? key,
    required this.backgroundColor,
    required this.lightColor,
    required this.icon,
    required this.message,
    this.actionLabel,
    this.onActionPressed,
  }) : super(key: key);

  @override
  State<_AnimatedSnackBarContent> createState() =>
      _AnimatedSnackBarContentState();
}

class _AnimatedSnackBarContentState extends State<_AnimatedSnackBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.backgroundColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.lightColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.backgroundColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getTitle(widget.icon),
                            style: TextStyle(
                              color: widget.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.message,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.actionLabel != null &&
                        widget.onActionPressed != null)
                      TextButton(
                        onPressed: widget.onActionPressed,
                        style: TextButton.styleFrom(
                          foregroundColor: widget.backgroundColor,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        child: Text(
                          widget.actionLabel!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          color: Colors.black45,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTitle(IconData icon) {
    if (icon == Icons.check_circle_rounded) {
      return '¡Éxito!';
    } else if (icon == Icons.warning_rounded) {
      return '¡Advertencia!';
    } else if (icon == Icons.error_rounded) {
      return '¡Error!';
    } else {
      return 'Información';
    }
  }
}
