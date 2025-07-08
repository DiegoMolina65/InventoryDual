import 'package:flutter/material.dart';
import 'dart:math';

class CustomProgressLoading extends StatelessWidget {
  final double size;
  final Color primaryColor;
  final Color backgroundColor;
  final String message;

  const CustomProgressLoading({
    Key? key,
    this.size = 80.0,
    required this.primaryColor,
    this.backgroundColor = Colors.white,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 2.2,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(size / 2),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: size * 0.85,
                    height: size * 0.85,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(size * 0.35),
                    child: Container(
                      width: size * 0.7,
                      height: size * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size * 0.35),
                      ),
                      child: Image.asset(
                        'assets/images/logodualbiz.png',
                        height: size * 0 * 7,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCustomProgress extends StatefulWidget {
  final double size;
  final Color primaryColor;
  final Color backgroundColor;
  final String message;

  const AnimatedCustomProgress({
    Key? key,
    this.size = 120.0,
    required this.primaryColor,
    this.backgroundColor = Colors.white,
    required this.message,
  }) : super(key: key);

  @override
  State<AnimatedCustomProgress> createState() => _AnimatedCustomProgressState();
}

class _AnimatedCustomProgressState extends State<AnimatedCustomProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _pulseAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size * 2.5,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  color: widget.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Container(
                      width: widget.size * 0.65,
                      height: widget.size * 0.65,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(widget.size * 0.3),
                          child: Image.asset(
                            'assets/images/logodualbiz.png',
                            width: widget.size * 0.6,
                            height: widget.size * 0.6,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: widget.size,
                        height: widget.size,
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              widget.primaryColor),
                        ),
                      ),
                      Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: CustomPaint(
                          size: Size(widget.size, widget.size),
                          painter: ProgressDotsPainter(
                            primaryColor: widget.primaryColor,
                            dotsCount: 5,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressDotsPainter extends CustomPainter {
  final Color primaryColor;
  final int dotsCount;

  ProgressDotsPainter({
    required this.primaryColor,
    this.dotsCount = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dotsCount; i++) {
      final angle = 2 * pi * i / dotsCount;
      final x = center.dx + (radius - 6) * cos(angle);
      final y = center.dy + (radius - 6) * sin(angle);
      canvas.drawCircle(Offset(x, y), 4, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CustomProgressOverlay extends StatelessWidget {
  final String message;
  final Color primaryColor;

  const CustomProgressOverlay({
    Key? key,
    this.message = 'Cargando Inventario',
    required this.primaryColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: AbsorbPointer(
        absorbing: true,
        child: Container(
          color: Colors.black.withOpacity(0.5),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: AnimatedCustomProgress(
              primaryColor: primaryColor,
              message: message,
              backgroundColor: Colors.white,
              size: 120.0,
            ),
          ),
        ),
      ),
    );
  }
}
