import 'package:flutter/material.dart';

class CustomSliderThumbShape extends SliderComponentShape {
  final Color color;

  final Color circleColor;

  Size? size ;

  CustomSliderThumbShape(this.color, this.circleColor, {this.size = const Size(40, 40)});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return size?? const Size(40, 40);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Paint paint2 = Paint();
    paint2.color = circleColor;
    paint2.isAntiAlias = true;
    //绘制滑块
    canvas.drawCircle(center, 8, paint2);
    canvas.drawCircle(center, 5, paint);
  }
}
