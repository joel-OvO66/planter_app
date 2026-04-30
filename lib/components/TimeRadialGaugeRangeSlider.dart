import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:tornado/util/DateFormater.dart';

import '../generated/l10n.dart';
import '../util/DateTimeUtil.dart';

/**
 * TimeRadialGaugeRangeSlider 主类
 **/
class TimeRadialGaugeRangeSlider extends StatefulWidget {
  final int startTime;

  final int endTime;

  final bool bVisibleText;

  final ValueChanged<int>? onStartTimeChanged;

  final ValueChanged<int>? onEndTimeChanged;

  const TimeRadialGaugeRangeSlider({Key? key, required this.startTime, required this.endTime, this.onStartTimeChanged, this.onEndTimeChanged, this.bVisibleText = false}) : super(key: key);

  @override
  _TimeRadialGaugeRangeSliderState createState() => _TimeRadialGaugeRangeSliderState();
}

/**
 * TimeRadialGaugeRangeSlider UI布局
 **/
class _TimeRadialGaugeRangeSliderState extends State<TimeRadialGaugeRangeSlider> {
  double _firstMarkerValue = 0;
  double _secondMarkerValue = 0;

  //小时值
  String _hourValue = '06';
  String _minutesValue = '40';
  bool _enableDragging = true;
  bool enableNeedleAnimation = true;

  @override
  void initState() {
    super.initState();
    _firstMarkerValue = widget.startTime / 3600;
    _secondMarkerValue = widget.endTime / 3600;
    _calculateHours();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    DateTime MIN_DATETIME = dateTime.copyWith(hour: 0, minute: 0, second: 0);
    DateTime MAX_DATETIME = dateTime.copyWith(hour: 23, minute: 59, second: 59);

    _firstMarkerValue = widget.startTime / 3600;
    _secondMarkerValue = widget.endTime / 3600;
    _calculateHours();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 290,
          width: 280,
          child:  SfRadialGauge(
            // title: GaugeTitle(
            //     text:
            //         '${S.of(context).onTime}：${DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime((_firstMarkerValue * 3600).toInt()))}    ${S.of(context).offTime}：${DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime((_secondMarkerValue * 3600).toInt()))}',
            //     textStyle: Theme.of(context).textTheme.labelMedium!),
              axes: <RadialAxis>[
                RadialAxis(
                  axisLineStyle: const AxisLineStyle(thickness: 0.26, thicknessUnit: GaugeSizeUnit.factor),
                  radiusFactor: 0.85,
                  minorTicksPerInterval: 4,
                  showFirstLabel: false,
                  showLastLabel: true,
                  showTicks: false,
                  tickOffset: 0.23,
                  minorTickStyle: const MinorTickStyle(length: 0.06, lengthUnit: GaugeSizeUnit.factor, thickness: 1),
                  majorTickStyle: const MajorTickStyle(length: 0.1, lengthUnit: GaugeSizeUnit.factor),
                  maximum: 24,
                  interval: 1,
                  startAngle: 270,
                  endAngle: 270,
                  pointers: <GaugePointer>[
                    MarkerPointer(
                      value: _firstMarkerValue,
                      onValueChanged: _handleFirstPointerValueChanged,
                      onValueChanging: _handleFirstPointerValueChanging,
                      enableDragging: _enableDragging,
                      borderColor: Theme.of(context).primaryColorLight,
                      borderWidth: 3,
                      color: Colors.white,
                      markerHeight: 22,
                      markerWidth: 22,
                      markerType: MarkerType.circle,
                      overlayColor: const Color.fromRGBO(255, 205, 96, 0.3),
                      overlayRadius: 15,
                    ),
                    MarkerPointer(
                      value: _secondMarkerValue,
                      onValueChanged: _handleSecondPointerValueChanged,
                      onValueChanging: _handleSecondPointerValueChanging,
                      color: Colors.white,
                      enableDragging: _enableDragging,
                      borderColor: Theme.of(context).primaryColorLight,
                      markerHeight: 22,
                      borderWidth: 3,
                      markerWidth: 22,
                      markerType: MarkerType.circle,
                      overlayColor: const Color.fromRGBO(255, 205, 96, 0.3),
                      overlayRadius: 15,
                    ),
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      endValue: _secondMarkerValue,
                      sizeUnit: GaugeSizeUnit.factor,
                      startValue: _firstMarkerValue,
                      startWidth: 0.2,
                      rangeOffset: 0.03,
                      color: Theme.of(context).primaryColorLight,
                      endWidth: 0.2,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      angle: 0,
                      widget: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('  ${_hourValue}hr ${_minutesValue}m', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
                            Text("  Grow Light")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
        if(widget.bVisibleText) Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  BrnDatePicker.showDatePicker(context,
                      maxDateTime: MAX_DATETIME,
                      minDateTime: MIN_DATETIME,
                      initialDateTime: MIN_DATETIME.add(Duration(seconds: (_firstMarkerValue * 3600).toInt())),
                      pickerMode: BrnDateTimePickerMode.time, onConfirm: (dateTime, list) {
                    _handleFirstPointerValueChanged(((dateTime.hour * 60 + dateTime.minute) * 60 + dateTime.second) / 3600);
                  });
                },
                child: Text('${S.of(context).onTime}：${DateFormater.formatTime(DateTimeUtil.convertTime((_firstMarkerValue * 3600).toInt()))}',
                    style: Theme.of(context).textTheme.labelMedium!)),
            TextButton(
                onPressed: () {
                  BrnDatePicker.showDatePicker(context,
                      maxDateTime: MAX_DATETIME,
                      minDateTime: MIN_DATETIME,
                      initialDateTime: MIN_DATETIME.add(Duration(seconds: (_secondMarkerValue * 3600).toInt())),
                      pickerMode: BrnDateTimePickerMode.time, onConfirm: (dateTime, list) {
                    _handleSecondPointerValueChanged(((dateTime.hour * 60 + dateTime.minute) * 60 + dateTime.second) / 3600);
                  });
                },
                child: Text('${S.of(context).offTime}：${DateFormater.formatTime(DateTimeUtil.convertTime((_secondMarkerValue * 3600).toInt()))}',
                    style: Theme.of(context).textTheme.labelMedium!))
          ],
        )
      ],
    );
  }

  /// Dragged pointer new value is updated to range.
  void _handleFirstPointerValueChanged(double value) {
    setState(() {
      _firstMarkerValue = value;
      _calculateHours();
      if (widget.onStartTimeChanged != null) {
        widget.onStartTimeChanged!((_firstMarkerValue * 3600).toInt());
      }
    });
  }

  /// Cancelled the dragging when pointer value reaching the axis end/start value, greater/less than another
  /// pointer value
  void _handleFirstPointerValueChanging(ValueChangingArgs args) {
    if (args.value >= _secondMarkerValue || (args.value - _firstMarkerValue).abs() > 1) {
      args.cancel = true;
    }
  }

  /// Cancelled the dragging when pointer value reaching the axis end/start value, greater/less than another
  /// pointer value
  void _handleSecondPointerValueChanging(ValueChangingArgs args) {
    if (args.value <= _firstMarkerValue || (args.value - _secondMarkerValue).abs() > 1) {
      args.cancel = true;
    }
  }

  /// Dragged pointer new value is updated to range.
  void _handleSecondPointerValueChanged(double value) {
    setState(() {
      _secondMarkerValue = value;
      _calculateHours();
      if (widget.onEndTimeChanged != null) {
        widget.onEndTimeChanged!((_secondMarkerValue * 3600).toInt());
      }
    });
  }

  _calculateHours() {
    final int hourMarkerValue = (_firstMarkerValue - _secondMarkerValue).abs().toInt();
    final String hourValue = '$hourMarkerValue';
    _hourValue = hourValue.length == 1 ? '0$hourValue' : hourValue;
    _calculateMinutes(hourMarkerValue);
  }

  /// Calculate the minutes value from pointer value to update in annotation.
  void _calculateMinutes(int pointerValue) {
    final double minutes = (_firstMarkerValue - _secondMarkerValue).abs() - pointerValue;
    final List<String> minList = minutes.toStringAsFixed(2).split('.');
    double currentMinutes = double.parse(minList[1]);
    currentMinutes = currentMinutes > 60 ? currentMinutes - 60 : currentMinutes;
    final String actualValue = currentMinutes.toInt().toString();
    _minutesValue = actualValue.length == 1 ? '0' + actualValue : actualValue;
  }
}
