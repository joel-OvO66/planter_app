import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/farm/entity/Room.dart';

import '../../../components/ArrowPainter.dart';
import '../../../gen/assets.gen.dart';
import '../../../style/AppTheme.dart';
import '../../../ui/card/BasicCard.dart';
import '../BrightnessCharts.dart';
import '../SpectrumCharts.dart';

/**
 * RoomViewerPage 主类
 **/
class RoomViewerPage extends StatefulWidget {
  final Room room;

  const RoomViewerPage({Key? key, required this.room}) : super(key: key);

  @override
  _RoomViewerPageState createState() => _RoomViewerPageState();
}

/**
 * RoomViewerPage UI布局
 **/
class _RoomViewerPageState extends State<RoomViewerPage> with _RoomViewerPageMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // currentMember = context.read<FarmService>().currentMember;
    return Scaffold(
        appBar: AppBar(title: Text(widget.room.roomName!)),
        body: SingleChildScrollView(
            child: Column(
          children: [
            PreferredSize(
                preferredSize: const Size.fromHeight(72),
                child: Container(
                    padding: EdgeInsets.only(top: 12.sp, bottom: 20.sp, left: 24.sp, right: 24.0.sp),
                    child: Row(
                      children: [
                        TextButton.icon(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp))),
                            backgroundColor: WidgetStateProperty.all(AppTheme.secondary),
                            textStyle: WidgetStateProperty.all(Theme.of(context).textTheme.labelMedium),
                          ),
                          onPressed: () {},
                          icon: Assets.images.homeAlarm.image(width: 48.sp),
                          label: Text("Alarm Mode", style: Theme.of(context).textTheme.labelMedium),
                        ),
                        SizedBox(width: 16.sp),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => FarmModeSettingPage(farm: currentMember!)));
                          },
                          style: ButtonStyle(shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp))), backgroundColor: WidgetStateProperty.all(Colors.white)),
                          child: Assets.images.homePlus.image(width: 48.sp, color: Colors.black),
                        )
                      ],
                    ))),
            BasicCard(
              head: Row(
                children: [
                  Text(
                    'Change Scene Mode',
                    style: TextStyle(fontSize: 32.sp, color: const Color(0xff0A2233)),
                  ),
                  SizedBox(width: 20.sp),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text('Auto', style: TextStyle(color: Colors.white))),
                ],
              ),
              onTap: () {},
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 630.w,
                  height: 150.h,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 500.w,
                        child: buildSceneModeItem('Bloom2', '07D', isSelected: false, last: true),
                      ),
                      Positioned(
                        left: 400.w,
                        child: buildSceneModeItem('Bloom1', '21D', isSelected: false),
                      ),
                      Positioned(
                        left: 300.w,
                        child: buildSceneModeItem('Flower4', '07D', isSelected: false),
                      ),
                      Positioned(
                        left: 200.w,
                        child: buildSceneModeItem('Flower3', 'D2/07', isSelected: true),
                      ),
                      Positioned(
                        left: 100.w,
                        child: buildSceneModeItem('Flower2', '07D', isSelected: false),
                      ),
                      Positioned(
                        left: 0,
                        child: buildSceneModeItem('Flower1', '07D', isSelected: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BasicCard(
                head: Row(
                  children: [
                    Text(
                      'Environmental Parameters',
                      style: TextStyle(fontSize: 32.sp, color: const Color(0xff0A2233)),
                    ),
                    SizedBox(width: 20.sp),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text('Set-P', style: TextStyle(color: Colors.white))),
                  ],
                ),
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [buildCardItem('29.6', 'tc_blk.png', unit: "℃"), buildCardItem('67.6', 'rh_blk.png', unit: "%"), buildCardItem('958', 'co2_blk.png', unit: "PPM")],
                      ),
                      Row(
                        children: [buildCardItem('1628', 'ppfd_blk.png', unit: "PPFD"), buildCardItem('1.41', 'atm_blk.png', unit: "KPa"), buildCardItem('R', 'record.png', unit: "ecord")],
                      )
                    ],
                  ),
                )),
            BasicCard(
              title: 'Adjustable Spectrum',
              onTap: () {},
              child: SpectrumCharts().brokenLineDemo3(context),
            ),
            BasicCard(
              title: 'Adjustable Brightness',
              onTap: () {},
              child: BrightnessCharts().brokenLineDemo3(context),
            )
          ],
        )));
  }

  Widget buildSceneModeItem(String title, String duration, {bool isSelected = false, bool last = false}) {
    return Column(
      children: [
        CustomPaint(
          painter: ArrowPainter(isSelected ? Colors.green : const Color(0xFFe5edf3), last),
          child: Container(
            height: 100.sp,
            padding: EdgeInsets.only(top: 48.sp, left: 35.sp, right: 16.sp),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.sp),
          child: Text(duration, style: TextStyle(fontSize: 23.sp)),
        ),
      ],
    );
  }

  Widget buildCardItem(String data, String icon, {String unit = ''}) {
    return Container(
        width: 203.sp,
        height: 150.sp,
        margin: EdgeInsets.fromLTRB(5.sp, 5.sp, 5.sp, 5.sp),
        padding: EdgeInsets.fromLTRB(32.sp, 24.sp, 28.sp, 24.sp),
        decoration: BoxDecoration(
            color: const Color(0xFFf8f9fa),
            borderRadius: BorderRadius.all(Radius.circular(16.sp)),
            border: Border.all(
              color: const Color(0xFFe5edf3), // 边框颜色
              width: 1.0, // 边框宽度
            )),
        child: Container(
          margin: EdgeInsets.only(top: 10.sp),
          child: Column(children: [
            Image.asset('assets/images/preview/$icon', width: 36.sp),
            SizedBox(height: 15.sp),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(data, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)), Text(unit)])
          ]),
        ));
  }
}

/**
 * RoomViewerPage 数据逻辑
 **/
mixin _RoomViewerPageMixin<T extends StatefulWidget> on State<T> {
  late Room? currentMember;
}
