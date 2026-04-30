import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/style/CustomSliderThumbShape.dart';

import '../InputText.dart';

class DimSilderEdit extends StatefulWidget {
  String? label;

  double value;

  Widget? icon;

  final double min;

  final double max;

  final int divisions;

  final String unit;

  final ValueChanged<double>? onChanged;

  DimSilderEdit({Key? key,
    this.label,
    this.icon,
    required this.value,
    this.min = 0,
    this.max = 100,
    this.divisions = 100,
    this.onChanged,
    this.unit = "%"
  }) : super(key: key);

  @override
  _DimSilderEditState createState() => _DimSilderEditState();
}

class _DimSilderEditState extends State<DimSilderEdit> {
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
    Widget container = Row(
        children: [
          if(widget.label != null || widget.icon != null)
          Column(
            children: [
              if (widget.icon != null)  widget.icon!,
              if (widget.label != null) Text(widget.label!),
            ],
          ),
          const SizedBox(width: 5,),

          Expanded(
              child: AbsorbPointer(
                absorbing: false,
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
                      value: _value,
                      min: widget.min,
                      max: widget.max,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                        if (widget.onChanged != null) {
                          widget.onChanged!(_value);
                        }
                      },
                      onChangeStart: (startValue) {},
                      onChangeEnd: (endValue) {},
                      divisions: widget.divisions,
                    )
                ),
              )
          ),
          Text("${(_value).toInt()}${widget.unit}")
        ],
    );
    return container;
  }
}
