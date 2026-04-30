import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class SpectrumCharts {
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
      dialText: '350',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 350,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '400',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 400,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '450',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 450,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '500',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 500,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '550',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 550,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '600',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 600,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '650',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 650,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '700',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 700,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '750',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 750,
    ));
    _xDialValue.add(BrnDialItem(
      dialText: '800',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 800,
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
      yDialMax: 120,
      xDialMin: 300,
      xDialMax: 800,
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
    BrnPointsLine _pointsLine2 = BrnPointsLine(
      // isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        BrnPointData(
            pointText: '0',
            y: 0,
            x: 350,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '0';
                })),
        BrnPointData(
            pointText: '41',
            y: 41,
            x: 400,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '41';
                })),
        BrnPointData(
            pointText: '95',
            y: 95,
            x: 450,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '95';
                })),
        BrnPointData(
            pointText: '30',
            y: 30,
            x: 500,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        BrnPointData(
            pointText: '50',
            y: 50,
            x: 550,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '50';
                })),
        BrnPointData(
            pointText: '60',
            y: 60,
            x: 600,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '60';
                })),
        BrnPointData(
            pointText: '99',
            y: 99,
            x: 650,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '99';
                })),
        BrnPointData(
            pointText: '10',
            y: 10,
            x: 700,
            lineTouchData: BrnLineTouchData(
                onTouch: () {
                  return '10';
                },
                tipWindowSize: Size(60, 40))),
        BrnPointData(
            pointText: '3',
            y: 3,
            x: 750,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '3';
                })),
        BrnPointData(
            pointText: '0',
            y: 0,
            x: 800,
            lineTouchData: BrnLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '0';
                }))
      ],
      shaderColors: [Colors.green.withOpacity(0.3), Colors.green.withOpacity(0.01)],
      lineColor: Colors.green,
    );

    pointsLineList.add(_pointsLine2);
    return pointsLineList;
  }
}
