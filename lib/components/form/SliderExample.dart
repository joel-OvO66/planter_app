import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {

  final ValueChanged<double>? onChanged;

  final double value;
  final int? divisions;
  final double? max;
  final double? min;

  const SliderExample({super.key, this.onChanged, this.value = 0, this.divisions, this.max, this.min});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {

  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: widget.max ?? 100,
      min: widget.min ?? 0,
      divisions: widget.divisions ?? 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          if (widget.onChanged != null) {
            widget.onChanged!(_currentSliderValue);
          }
        });
      },
    );
  }
}