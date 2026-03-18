import 'dart:math';

import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

class SemiCirclePainterWithShadow extends CustomPainter {
  final double progress;

  SemiCirclePainterWithShadow({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    final backgroundArcPaint =
        Paint()
          ..color = Colors.grey.shade200
          ..strokeWidth = 30
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      backgroundArcPaint,
    );

    final arcRect = Rect.fromCircle(center: center, radius: radius);

    // Shadow Paint
    final shadowPaint =
        Paint()
          ..color = Colors.black.withOpacity(0.2)
          ..strokeWidth = 32
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4); // soft shadow

    canvas.drawArc(arcRect, pi, pi * progress, false, shadowPaint);

    // Gradient Paint
    final gradient = SweepGradient(
      startAngle: pi,
      endAngle: 2 * pi,
      colors: [ColorName.colorGreen, ColorName.colorYellow, ColorName.colorRed],
    );

    final gradientPaint =
        Paint()
          ..shader = gradient.createShader(arcRect)
          ..strokeWidth = 30
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(arcRect, pi, pi * progress, false, gradientPaint);
  }

  @override
  bool shouldRepaint(SemiCirclePainterWithShadow oldDelegate) =>
      oldDelegate.progress != progress;
}
