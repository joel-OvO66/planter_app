import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../entity/strategy/domain/SceneSetting.dart';
import '../../../../entity/strategy/domain/VentSchedule.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../provider/SettingProvider.dart';
import '../../../../style/AppTheme.dart';
import '../../../../ui/NumberInputBox.dart';
import '../../../../ui/card/BasicCard.dart';
import '../../../../ui/silder/DimSilder.dart';

/**
 * VentilatorSettingTabView 主类
 **/
class VentilatorSettingTabView extends StatefulWidget {
  final SceneSetting setting;

  final SettingType settingType;

  const VentilatorSettingTabView({Key? key, required this.setting, required this.settingType}) : super(key: key);

  @override
  _VentilatorSettingTabViewState createState() => _VentilatorSettingTabViewState();
}

/**
 * VentilatorSettingTabView UI布局
 **/
class _VentilatorSettingTabViewState extends State<VentilatorSettingTabView> with _VentilatorSettingTabViewMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.setting.ventSch1 ??= VentSchedule(lowTemp: 10 * 100, highTemp: 15 * 100, workTime: 1, workLevel: 5);
    widget.setting.ventSch2 ??= VentSchedule(lowTemp: 16 * 100, highTemp: 25 * 100, workTime: 2, workLevel: 7);
    widget.setting.ventSch3 ??= VentSchedule(lowTemp: 26 * 100, highTemp: 35 * 100, workTime: 3, workLevel: 10);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      BasicCard(
        title: S.of(context).venFan,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.sp),
            _buildSetting(widget.setting.ventSch1!),
            AppTheme.divider,
            SizedBox(height: 32.sp),
            _buildSetting(widget.setting.ventSch2!),
            AppTheme.divider,
            SizedBox(height: 32.sp),
            _buildSetting(widget.setting.ventSch3!),
          ],
        ),
      ),
      SizedBox(height: 100.sp,)
      // BasicCard(
      //   title: "${S.of(context).venFan} ${S.of(context).setting}",
      //   child: Padding(
      //       padding: EdgeInsets.only(left: 24.sp, top: 12.sp),
      //       child: BrnPairInfoTable(
      //         rowDistance: 16.sp,
      //         children: <BrnInfoModal>[
      //           BrnInfoModal(keyPart: "${S.of(context).growthStage}：", valuePart: S.of(context).sceneSetting_settingType_enum(widget.settingType)),
      //           BrnInfoModal(keyPart: "${S.of(context).workingMode}：", valuePart: S.of(context).auto),
      //         ],
      //       )),
      // )
    ]));
  }

  Widget _buildSetting(VentSchedule vent_sch) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Assets.images.dashboard.temp3x.image(width: 42.sp), Assets.images.dashboard.timer3x.image(width: 42.sp), SizedBox(width: 1.sp)],
        ),
        SizedBox(height: 12.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(children: [
              NumberInputBox(
                value: settingProvider.temperatureDisplay(vent_sch.lowTemp.toDouble()),
                onChanged: (int value) {
                  vent_sch.lowTemp = settingProvider.tempDisplayToLocal(value.toDouble());
                },
                min: settingProvider.temperatureUnit == "°C" ? 0 : 32,
                max: settingProvider.temperatureUnit == "°C" ? 120 : 248,
              ),
              Text(settingProvider.temperatureUnit),
              const Text("-"),
              NumberInputBox(
                value: settingProvider.temperatureDisplay(vent_sch.highTemp.toDouble()),
                onChanged: (int value) {
                  vent_sch.highTemp = settingProvider.tempDisplayToLocal(value.toDouble());
                },
                min: settingProvider.temperatureUnit == "°C" ? 0 : 32,
                max: settingProvider.temperatureUnit == "°C" ? 120 : 248,
              ),
              Text(settingProvider.temperatureUnit),
            ]),
            Row(children: [
              Text(S.of(context).hour),
              NumberInputBox(
                value: vent_sch.workTime,
                max: 24,
                onChanged: (int value) {
                  vent_sch.workTime = value;
                },
              ),
            ]),
            Switch(
                value: vent_sch.enable == 1,
                onChanged: (value) {
                  setState(() {
                    vent_sch.enable = value ? 1 : 0;
                  });
                }),
          ],
        ),
        DimSilder(
          label: " ${S.of(context).speed}",
          icon: Assets.images.dashboard.ductFan3x.image(width: 32.sp),
          value: vent_sch.workLevel.toDouble(),
          max: 10,
          unit: "",
          onChanged: (value) {
            vent_sch.workLevel = value.toInt();
          },
        ),
      ],
    );
  }

  // Widget _buildCycleWidget() {
  //   return Column(
  //     children: [
  //       DimSilder(
  //         label: " ${S.of(context).speed}",
  //         icon: Assets.images.dashboard.speed3x.image(width: 32.sp),
  //         value: widget.manModeParam.ventLevel.toDouble(),
  //         max: 10,
  //         unit: "",
  //         onChanged: (value) {
  //           widget.manModeParam.ventLevel = value.toInt();
  //         },
  //       ),
  //       TimeRadialGaugeRangeSlider(
  //         startTime: widget.manModeParam.ventOnTime,
  //         endTime: widget.manModeParam.ventOffTime,
  //         onStartTimeChanged: (value) {
  //           widget.manModeParam.ventOnTime = value;
  //         },
  //         onEndTimeChanged: (value) {
  //           widget.manModeParam.ventOffTime = value;
  //         },
  //       ),
  //       AppTheme.divider,
  //       BasicCard(
  //         title: "${S.of(context).venFan} Setting - Cycle",
  //         child: BrnPairInfoTable(
  //           rowDistance: 16.sp,
  //           isValueAlign: false,
  //           children: <BrnInfoModal>[
  //             BrnInfoModal(keyPart: "Grow Stage：", valuePart: "Seedling"),
  //             BrnInfoModal(keyPart: "Working Mode：", valuePart: "Cycle"),
  //             BrnInfoModal(keyPart: "Speed：Levels：", valuePart: "${widget.manModeParam.ventLevel}"),
  //             // BrnInfoModal(keyPart: "${S.of(context).onTime}：", valuePart: "${widget.manModeParam.ventLevel}"),
  //             // BrnInfoModal(keyPart: "${S.of(context).offTime}：", valuePart: "${widget.manModeParam.ventLevel}"),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
}

/**
 * VentilatorSettingTabView 数据逻辑
 **/
mixin _VentilatorSettingTabViewMixin<T extends StatefulWidget> on State<T> {}
