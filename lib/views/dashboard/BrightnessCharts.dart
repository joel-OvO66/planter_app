import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class BrightnessCharts {
  getXDialValuesForDemo3(List<BrnPointsLine> lines) {
    List<BrnDialItem> _xDialValue = [];
    // for (int index = 0; index < lines[0].points.length; index++) {
    //   _xDialValue.add(BrnDialItem(
    //     dialText: '${lines[0].points[index].x}',
    //     dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
    //     value: lines[0].points[index].x,
    //   ));
    // }

    _xDialValue.add(BrnDialItem(
      dialText: '00:00',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 0,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '06:00',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 1,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '12:00',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 2,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '18:00',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 3,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '24:00',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 4,
    ));
    return _xDialValue;
  }

  List<BrnDialItem> getYDialValuesForDemo3() {
    return [
      BrnDialItem(
        dialText: '0.0',
        dialTextStyle: const TextStyle(fontSize: 10.0, color: Colors.black),
        value: 0,
      ),
      BrnDialItem(
        dialText: '20%',
        dialTextStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
        value: 20,
      ),
      BrnDialItem(
        dialText: '40%',
        dialTextStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
        value: 40,
      ),
      BrnDialItem(
        dialText: '60%',
        dialTextStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
        value: 60,
      ),
      BrnDialItem(
        dialText: '80%',
        dialTextStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
        value: 80,
      ),
      BrnDialItem(
        dialText: '100%',
        dialTextStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
        value: 100,
      )
    ];
  }

  Widget brokenLineDemo3(context) {
    var chartLine = BrnBrokenLine(
      showPointDashLine: false,
      yHintLineOffset: 40,
      lines: _getPointsLinesForDemo3(),
      size: Size(MediaQuery.of(context).size.width - 50 * 2, MediaQuery.of(context).size.height / 5 * 1.6 - 20 * 2),
      isShowXHintLine: true,
      yDialValues: getYDialValuesForDemo3(),
      xDialValues: getXDialValuesForDemo3(_getPointsLinesForDemo3()),
      yDialMin: 0,
      yDialMax: 100,
      xDialMin: 0,
      xDialMax: 5,
      isHintLineSolid: false,
      isShowYDialText: true,
    );
    return Container(
      child: Column(
        children: <Widget>[
          // _buildIdentificationList(),
          SizedBox(
            height: 16,
          ),
          chartLine,
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<BrnPointsLine> _getPointsLinesForDemo3() {
    List<BrnPointsLine> pointsLineList = [];
    BrnPointsLine pointsLine = BrnPointsLine(
      // isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: true,
      isCurve: false,
      points: [
        BrnPointData(
            pointText: '0',
            y: 0,
            x: 0,
            lineTouchData: BrnLineTouchData(
                onTouch: () {
                  return '0';
                },
                tipWindowSize: Size(60, 40))),
        BrnPointData(
            pointText: '80',
            y: 80,
            x: 1,
            lineTouchData: BrnLineTouchData(
                onTouch: () {
                  return '80';
                },
                tipWindowSize: Size(60, 40))),
        BrnPointData(
            pointText: '90',
            y: 90,
            x: 2,
            lineTouchData: BrnLineTouchData(
                onTouch: () {
                  return '90';
                },
                tipWindowSize: Size(60, 40))),
        BrnPointData(
            pointText: '0',
            y: 0,
            x: 4,
            lineTouchData: BrnLineTouchData(
                onTouch: () {
                  return '0';
                },
                tipWindowSize: Size(60, 40)))
      ],
      lineColor: Colors.blue,
    );

    pointsLineList.add(pointsLine);
    return pointsLineList;
  }
}
