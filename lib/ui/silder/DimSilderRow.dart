import 'package:flutter/material.dart';


/**
 * DimSilder 主类
 **/
class DimSilderRow extends StatefulWidget {
  String? label;

  double value;

  Widget? icon;

  final double min;

  final double max;

  final int divisions;

  final String unit;

  final ValueChanged<double>? onChanged;

  final EdgeInsetsGeometry? padding;

  DimSilderRow({Key? key, this.label, this.icon, required this.value, this.padding, this.min = 0, this.max = 100, this.divisions = 100, this.onChanged, this.unit = "%"}) : super(key: key);

  @override
  _DimSilderRowState createState() => _DimSilderRowState();
}

/**
 * DimSilder UI布局
 **/
class _DimSilderRowState extends State<DimSilderRow> {
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
        if (widget.label != null) Text(widget.label!),
        Expanded(
            child: Slider(
              value: widget.value,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
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
            )),
        Text("${(widget.value).toInt()}${widget.unit}")
      ],
    );

    if (widget.padding != null) {
      return Padding(padding: widget.padding!, child: container);
    } else {
      return container;
    }
  }
}

