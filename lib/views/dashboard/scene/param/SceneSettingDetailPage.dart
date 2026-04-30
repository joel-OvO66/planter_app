import 'dart:collection';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/api/IotController.dart';
import 'package:planter_app/entity/domain/ResponseResult.dart';
import 'package:planter_app/util/SceneUtil.dart';
import 'package:provider/provider.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../../components/picker/DateTimeRange.dart';
import '../../../../entity/strategy/domain/FanSchedule.dart';
import '../../../../entity/strategy/domain/SceneSetting.dart';
import '../../../../entity/strategy/domain/VentSchedule.dart';
import '../../../../generated/l10n.dart';
import '../../../../provider/SettingProvider.dart';
import '../../../../style/BrunoThemeConfig.dart';
import '../../../../ui/card/BasicCard.dart';
import '../../../../ui/silder/DimSilderView.dart';
import '../../../../util/DateTimeUtil.dart';

class SceneSettingDetailPage extends StatefulWidget {
  final String deviceId;

  final SceneSetting setting;
  final SettingType settingType;
  const SceneSettingDetailPage({super.key, required this.deviceId, required this.setting, required this.settingType});

  @override
  State<SceneSettingDetailPage> createState() => _SceneSettingDetailPageState();
}

class _SceneSettingDetailPageState extends State<SceneSettingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).sceneSetting_settingType_enum(widget.settingType)),
      ),
      body: SingleChildScrollView(
        child: _buildSceneParam(),
      ),
    );
  }

  Widget _buildSceneParam() {
    SceneSetting setting = widget.setting;
    return Column(children: [
      BasicCard(
          title: S.of(context).light,
          child: Column(
            children: [
              DimSilderView(label: "${S.of(context).dim}1:", value: setting.dim1Per.toDouble(), padding: EdgeInsets.only(left: 24.sp)),
              DimSilderView(label: "${S.of(context).dim}2:", value: setting.dim2Per.toDouble(), padding: EdgeInsets.only(left: 24.sp)),
              DimSilderView(label: "${S.of(context).dim}3:", value: setting.dim3Per.toDouble(), padding: EdgeInsets.only(left: 24.sp)),
              BrnRichInfoGrid(
                padding: EdgeInsets.only(left: 24.sp),
                themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
                pairInfoList: <BrnRichGridInfo>[
                  BrnRichGridInfo("${S.of(context).onTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(setting.schStartTime))),
                  BrnRichGridInfo("${S.of(context).offTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(setting.schEndTime))),
                ],
              )
            ],
          )),
      BasicCard(
          title: S.of(context).venFan,
          child: Column(
            children: [
              ...buildVenFanSetting(setting.ventSch1!),
              ...buildVenFanSetting(setting.ventSch2!),
              ...buildVenFanSetting(setting.ventSch3!)
            ],
          )),
      BasicCard(
          title: S.of(context).fan,
          child: Column(
            children: [
              ...buildFanSetting(setting.fanSch1!),
              ...buildFanSetting(setting.fanSch2!),
              ...buildFanSetting(setting.fanSch3!),
            ],
          )),
      BasicCard(
          title: S.of(context).time_settings,
          child: BrnRichInfoGrid(
            padding: EdgeInsets.only(left: 24.sp, top: 25.sp, bottom: 25.sp),
            themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
            pairInfoList: <BrnRichGridInfo>[
              BrnRichGridInfo(
                  "${S.of(context).startDate}: ",
                  "${DateFormater.formatDate(DateFormater.parseDate(setting.schStartDate, "yyyy/MM/dd"), "MM/dd/yyyy")}"
              ),
              BrnRichGridInfo(
                  "${S.of(context).endDate}: ",
                  "${DateFormater.formatDate(DateFormater.parseDate(setting.schEndDate, "yyyy/MM/dd"), "MM/dd/yyyy")}"
              ),
            ],
          ),
          // extra: Switch(
          //   value: setting.modeEnable == 1,
          //   onChanged: (bool value) {
          //     setState(() {
          //       setting.modeEnable = value ? 1 : 0;
          //     });
          //     updateSceneGrowData();
          //   },
          // ),
          // child: DateTimeRangeForm(
          //   startDate: DateFormater.parseDate(setting.schStartDate, "yyyy/MM/dd"),
          //   endDate: DateFormater.parseDate(setting.schEndDate, "yyyy/MM/dd"),
          //   onChanged: (List<DateTime> value) {
          //     setState(() {
          //       setting.schStartDate = DateFormater.formatDate(value[0], "yyyy/MM/dd");
          //       setting.schEndDate = DateFormater.formatDate(value[1], "yyyy/MM/dd");
          //     });
          //     updateSceneGrowData();
          //   },
          // )
      ),
    ]);
  }

  void updateSceneGrowData() {
    Map<String, dynamic> properties = HashMap();
    properties["schStartDate"] = widget.setting.schStartDate;
    properties["schEndDate"] = widget.setting.schEndDate;
    properties["modeEnable"] = widget.setting.modeEnable;

    EasyLoading.show();
    IotController.setProperties(widget.deviceId, {SceneUtils.getPropertiesKey(widget.settingType): properties}).then((value) {
      if (value.result == Result.SUCCESS) {
        EasyLoading.showSuccess(S.of(context).executeSuccess);
      } else if (value.result == Result.FAILURE) {
        EasyLoading.showError(S.of(context).executeFailure);
      }
    }).whenComplete(() => EasyLoading.dismiss());
  }

  List<Widget> buildVenFanSetting(VentSchedule ventSchedule) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return [
      DimSilderView(label: "${S.of(context).speed}:", unit: "", value: ventSchedule.workLevel.toDouble(), max: 10, padding: EdgeInsets.only(left: 24.sp)),
      BrnRichInfoGrid(
        padding: EdgeInsets.only(left: 24.sp),
        themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
        pairInfoList: <BrnRichGridInfo>[
          BrnRichGridInfo("${S.of(context).workingMode}：", ventSchedule.enable == 1 ? S.of(context).enabled : S.of(context).disabled),
          BrnRichGridInfo("${S.of(context).temperature}：", "${settingProvider.temperatureDisplay(ventSchedule.lowTemp.toDouble())}${settingProvider.temperatureUnit} - ${settingProvider.temperatureDisplay(ventSchedule.highTemp.toDouble())}${settingProvider.temperatureUnit}"),
          BrnRichGridInfo("${S.of(context).workHour}：", "${ventSchedule.workTime} ${S.of(context).hour}"),
        ],
      )
    ];
  }

  List<Widget> buildFanSetting(FanSchedule fanSchedule) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return [
      DimSilderView(label: "${S.of(context).speed}:", unit: "", value: fanSchedule.workLevel.toDouble(), max: 10, padding: EdgeInsets.only(left: 24.sp)),
      BrnRichInfoGrid(
        padding: EdgeInsets.only(left: 24.sp),
        themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
        pairInfoList: <BrnRichGridInfo>[
          BrnRichGridInfo("${S.of(context).workingMode}：", fanSchedule.enable == 1 ? S.of(context).enabled : S.of(context).disabled),
          BrnRichGridInfo("${S.of(context).temperature}：", "${settingProvider.temperatureDisplay(fanSchedule.lowTemp.toDouble())}${settingProvider.temperatureUnit} - ${settingProvider.temperatureDisplay(fanSchedule.highTemp.toDouble())}${settingProvider.temperatureUnit}"),
          BrnRichGridInfo("${S.of(context).workHour}：", "${fanSchedule.workTime} ${S.of(context).hour}"),
        ],
      ),
    ];
  }
}
