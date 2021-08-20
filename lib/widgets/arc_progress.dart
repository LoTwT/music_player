import 'dart:math';

import 'package:flutter/material.dart';

class ArcProgress extends StatelessWidget {
  final double percent;
  final double width;
  final Color color;
  final Color bgColor;

  ArcProgress({
    this.percent = 0.0,
    this.width = 1.0,
    this.color = Colors.black,
    this.bgColor = Colors.grey,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArcPainter(
        percent: percent,
        width: width,
        bgColor: bgColor,
        color: color,
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double percent;
  final double width;
  final Color color;
  final Color bgColor;

  _ArcPainter({
    this.percent = 0.0,
    this.width = 1.0,
    this.color = Colors.black,
    this.bgColor = Colors.grey,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
        width / 2, width / 2, size.width - width, size.height - width);

    // 背景
    final bgPath = Path();
    bgPath.arcTo(rect, -90 * pi / 180, 359.999 * pi / 180, true);

    final bgPaint = Paint();
    bgPaint.style = PaintingStyle.stroke;
    bgPaint.strokeWidth = width;
    bgPaint.color = bgColor;
    canvas.drawPath(bgPath, bgPaint);

    // 前景
    final fgPath = Path();
    fgPath.arcTo(rect, -90 * pi / 180, percent * 359.99 * pi / 180, true);

    final fgPaint = Paint();
    fgPaint.style = PaintingStyle.stroke;
    fgPaint.strokeWidth = width;
    fgPaint.color = color;
    fgPaint.strokeCap = StrokeCap.round;

    canvas.drawPath(fgPath, fgPaint);
  }

  @override
  bool shouldRepaint(_ArcPainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
