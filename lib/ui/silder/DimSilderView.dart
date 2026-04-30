import 'package:flutter/material.dart';
import 'package:planter_app/style/CustomSliderThumbShape.dart';

/**
 * DimSilderView 主类
 **/
class DimSilderView extends StatelessWidget {
  final String? label;
  final double value;
  final double min;

  final double max;

  final int divisions;
  final String unit;

  final EdgeInsetsGeometry? padding;

  const DimSilderView({Key? key,
        this.label,
        required this.value,
        this.padding,
        this.min = 0,
        this.max = 100,
        this.divisions = 100,
        this.unit = "%"
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      children: [
        if (label != null) Text(label!),
        Expanded(
          child: AbsorbPointer(
            absorbing: true,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 5,
                thumbShape: CustomSliderThumbShape(
                  Colors.white,
                  Theme.of(context).primaryColorLight,
                ),
                padding: const EdgeInsets.only(top: 0, bottom: 0, left: 12, right: 10),
              ),
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: (value) {},
                onChangeStart: (startValue) {},
                onChangeEnd: (endValue) {},
              )
            ),
          )
        ),
        Text("${(value).toInt()}$unit")
      ],
    );
    if (padding != null) {
      return Padding(padding: padding!, child: widget);
    } else {
      return widget;
    }
  }
}
