import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:planter_app/style/AppTheme.dart';
import 'package:planter_app/ui/card/BasicCard.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../gen/assets.gen.dart';

/**
 * AlarmsPage 主类
 **/
class AlarmsPage extends StatefulWidget {
  const AlarmsPage({Key? key}) : super(key: key);

  @override
  _AlarmsPageState createState() => _AlarmsPageState();
}

/**
 * AlarmsPage UI布局
 **/
class _AlarmsPageState extends State<AlarmsPage> with _AlarmsPageMixin {
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BrnDoughnutDataItem> dataList = [];
    dataList.add(BrnDoughnutDataItem(title: "1%", value: 1, color: Color(0xff2e8283)));
    dataList.add(BrnDoughnutDataItem(title: "13%", value: 13, color: Color(0xffe85a3a)));
    dataList.add(BrnDoughnutDataItem(title: "8%", value: 8, color: Color(0xff60b8e4)));
    dataList.add(BrnDoughnutDataItem(title: "6%", value: 6, color: Color(0xff785fb8)));
    dataList.add(BrnDoughnutDataItem(title: "6%", value: 6, color: Color(0xfff0ad2a)));
    dataList.add(BrnDoughnutDataItem(title: "2%", value: 2, color: Color(0xff4a5b7a)));

    return Scaffold(
        appBar: AppBar(title: const Text("Alarm Message")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: Colors.white,
              child: TableCalendar(
                locale: "en_US",
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                calendarFormat: calendarFormat,
                rowHeight: 48,
                //设置一行的高度
                headerStyle: HeaderStyle(
                  titleCentered: true, //标题是否居中
                  leftChevronVisible: true, //左侧的箭头是否显示
                  rightChevronVisible: true, //右侧的箭头是否显示
                  formatButtonVisible: false, //右侧的文字是否显示
                ),

                calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
                  return Container(
                    transform: Matrix4.translationValues(16, 0, 0),
                    child: Text(DateFormat.E().format(day),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: day.weekday == DateTime.sunday || day.weekday == DateTime.saturday ? Colors.red : Colors.black)),
                  );
                }, markerBuilder: (context, day, event) {
                  // List<HistoricTaskInstanceInfo> dayTasks = getTaskByDay(day);
                  // if (dayTasks.isNotEmpty) {
                  //   return Badge.count(count: dayTasks.length, textStyle: Theme.of(context).textTheme.bodySmall, child: Icon(Icons.edit, size: 24.sp));
                  // } else {
                  return Text("");
                  // }
                }),
                calendarStyle: CalendarStyle(
                    holidayTextStyle: TextStyle(color: Colors.red),
                    holidayDecoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                    // Use `CalendarStyle` to customize the UI
                    outsideDaysVisible: true,
                    // outsideDecoration: BoxDecoration(
                    //   color: Colors.cyan,
                    // ),
                    defaultDecoration: BoxDecoration(shape: BoxShape.circle),
                    markersMaxCount: 1,
                    // outsideDecoration: ,
                    // markerSize: 10,
                    // markersAlignment: Alignment.bottomCenter,
                    // markerMargin: EdgeInsets.only(top: 8),
                    cellMargin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
                    //设置日期旁边的间隔
                    selectedDecoration: BoxDecoration(color: AppTheme.lightPrimary, shape: BoxShape.circle),
                    selectedTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppTheme.primary),
                    //设置点击的文字样式
                    todayDecoration: BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                    // markerSizeScale: 5,
                    markerDecoration: BoxDecoration(color: Colors.cyan, shape: BoxShape.circle),
                    canMarkersOverflow: true),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {},
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white,
                child: Align(child: Assets.images.homeArrowDownBlk.image(width: 32.sp)),
              ),
              onTap: () {
                setState(() {
                  calendarFormat = calendarFormat == CalendarFormat.month ? CalendarFormat.week : CalendarFormat.month;
                });
              },
            ),
            BasicCard(
              extra: Row(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      week = true;
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: week ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text('This Week', style: TextStyle(color: Colors.white, fontSize: 12))),
                ),
                SizedBox(width: 10.sp),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        week = false;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: !week ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text('This Month', style: TextStyle(color: Colors.white, fontSize: 12))))
              ]),
              title: "Alarm statistics",
              child: Column(
                children: [
                  BrnDoughnutChart(
                    padding: EdgeInsets.all(50),
                    width: 200,
                    height: 200,
                    data: dataList,
                    selectedItem: selectedItem,
                    showTitleWhenSelected: true,
                    selectCallback: (BrnDoughnutDataItem? selectedItem) {
                      setState(() {
                        this.selectedItem = selectedItem;
                      });
                    },
                  ),
                  // DoughnutChartLegend(data: dataList, legendStyle: BrnDoughnutChartLegendStyle.wrap),
                ],
              ),
              tail: Container(
                margin: EdgeInsets.only(top: 15.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        buildCardItem(1, Assets.images.alarmLog.operationWhite, Color(0xff2e8283)),
                        buildCardItem(13, Assets.images.alarmLog.tcWhite, Color(0xffe85a3a)),
                        buildCardItem(8, Assets.images.alarmLog.rhWhite, Color(0xff60b8e4))
                      ],
                    ),
                    Row(
                      children: [
                        buildCardItem(6, Assets.images.alarmLog.co2White, Color(0xff785fb8)),
                        buildCardItem(6, Assets.images.alarmLog.ppfdWhite, Color(0xfff0ad2a)),
                        buildCardItem(2, Assets.images.alarmLog.atmWhite, Color(0xff4a5b7a))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }

  Widget buildCardItem(int data, AssetGenImage icon, Color bgColor) {
    return Container(
        width: 203.sp,
        height: 85.sp,
        margin: EdgeInsets.fromLTRB(5.sp, 5.sp, 5.sp, 5.sp),
        padding: EdgeInsets.fromLTRB(32.sp, 24.sp, 28.sp, 24.sp),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.all(Radius.circular(16.sp))),
        child: Container(
          child: Row(children: [
            icon.image(width: 30.sp),
            SizedBox(height: 10.sp),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$data',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(data, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)), Text(unit)])
          ]),
        ));
  }
}

/**
 * AlarmsPage 数据逻辑
 **/
mixin _AlarmsPageMixin<T extends StatefulWidget> on State<T> {
  final kToday = DateTime.now();
  late bool week = true;
  late DateTime kFirstDay;

  late DateTime kLastDay;

  DateTime _focusedDay = DateTime.now();

  /// 当前选择的是哪一天
  DateTime _selectedDay = DateTime.now();

  List<BrnDoughnutDataItem> dataList = [];
  int count = 3;
  dynamic selectedItem;
}
