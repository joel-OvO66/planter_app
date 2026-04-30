import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../InputText.dart';

/**
 * DimSilder 主类
 **/
class DimSilder extends StatefulWidget {
  String? label;

  double value;

  Widget? icon;

  final double min;

  final double max;

  final int divisions;

  final String unit;

  final ValueChanged<double>? onChanged;

  DimSilder({Key? key, this.label, this.icon, required this.value, this.min = 0, this.max = 100, this.divisions = 100, this.onChanged, this.unit = "%"}) : super(key: key);

  @override
  _DimSilderState createState() => _DimSilderState();
}

/**
 * DimSilder UI布局
 **/
class _DimSilderState extends State<DimSilder> {
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 36.sp, right: 36.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [if (widget.icon != null) widget.icon!, if (widget.label != null) Text(widget.label!), const Spacer(), InputText("${(_value).toInt()}${widget.unit}")],
            )),
        Slider(
          label: "${(_value).toInt()}${widget.unit}",
          value: _value,
          min: widget.min,
          max: widget.max,
          onChanged: (value) {
            setState(() {
              this._value = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(this._value);
            }
          },
          onChangeStart: (startValue) {},
          onChangeEnd: (endValue) {},
          divisions: widget.divisions,
        ),
      ],
    );
  }
}
