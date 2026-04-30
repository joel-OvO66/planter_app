import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowPainter extends CustomPainter {
  final Color color;
  final bool last;

  ArrowPainter(this.color, this.last);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    if (last) {}

    final path = Path();
    path.moveTo(0, 10);
    if (last) {
      path.lineTo(size.width, 10);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    } else {
      path.lineTo(size.width * (2 / 3), 10);
      path.lineTo(size.width, size.height * (1.2 / 3));
      path.lineTo(size.width, size.height * (2.3 / 3));
      path.lineTo(size.width * (2 / 3), size.height);
      path.lineTo(0, size.height);
    }

    path.close();
    paint.strokeCap = StrokeCap.round;

    final borderPath = Path();
    borderPath.moveTo(0, 10);
    if (last) {
      borderPath.lineTo(size.width, 10);
      borderPath.lineTo(size.width, size.height);
      borderPath.lineTo(0, size.height);
    } else {
      borderPath.lineTo(size.width * (2 / 3), 10);
      borderPath.lineTo(size.width, size.height * (1.2 / 3));
      borderPath.lineTo(size.width, size.height * (2.3 / 3));
      borderPath.lineTo(size.width * (2 / 3), size.height);
      borderPath.lineTo(0, size.height);
    }
    borderPath.close();
    borderPaint.strokeJoin = StrokeJoin.round;
    canvas.drawPath(borderPath, borderPaint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
