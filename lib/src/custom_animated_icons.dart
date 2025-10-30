import 'package:flutter/material.dart';

class CustomAnimatedIcons {
  static const AnimatedIconData addClose = _AddCloseAnimatedIconData();
}

class _AddCloseAnimatedIconData extends AnimatedIconData {
  const _AddCloseAnimatedIconData();

  @override
  bool get matchTextDirection => false;

  @override
  Widget build(BuildContext context, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _AddClosePainter(animation.value),
          size: const Size(24, 24),
        );
      },
    );
  }
}

class _AddClosePainter extends CustomPainter {
  final double progress;

  _AddClosePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.3;

    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      paint,
    );

    final verticalProgress = 1.0 - progress;
    final diagonalProgress = progress;
    final rotationAngle = progress * (3.14159 / 4); 
    final startY = center.dy - radius * verticalProgress;
    final endY = center.dy + radius * verticalProgress;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    canvas.translate(-center.dx, -center.dy);

    canvas.drawLine(
      Offset(center.dx, startY),
      Offset(center.dx, endY),
      paint,
    );

    canvas.restore();

    if (progress > 0.5) {
      final diagonalOpacity = (progress - 0.5) * 2.0;
      final diagonalPaint = Paint()
        ..color = Colors.white.withOpacity(diagonalOpacity)
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round;

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(-rotationAngle);
      canvas.translate(-center.dx, -center.dy);

      canvas.drawLine(
        Offset(center.dx, center.dy - radius),
        Offset(center.dx, center.dy + radius),
        diagonalPaint,
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is _AddClosePainter && oldDelegate.progress != progress;
  }
}