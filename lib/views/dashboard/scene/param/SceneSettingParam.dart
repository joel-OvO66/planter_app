import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/api/SceneController.dart';
import 'package:planter_app/entity/strategy/domain/VentSchedule.dart';
import 'package:planter_app/generated/l10n.dart';
import 'package:planter_app/ui/MainButton.dart';
import 'package:planter_app/ui/card/BasicCard.dart';
import 'package:planter_app/views/my_brn_date_range_picker.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../../components/picker/DateTimeRange.dart';
import '../../../../entity/domain/ResponseResult.dart';
import '../../../../entity/strategy/domain/FanSchedule.dart';
import '../../../../entity/strategy/domain/SceneSetting.dart';
import '../../../../entity/strategy/entity/Scene.dart';
import '../../../../provider/SettingProvider.dart';
import '../../../../style/BrunoThemeConfig.dart';
import '../../../../ui/silder/DimSilderView.dart';
import '../../../../util/DateTimeUtil.dart';
import '../setting/SceneSettingPage.dart';

/**
 * SceneParam 主类
 **/
class SceneSettingParam extends StatefulWidget {
  final Scene scene;

  final SettingType settingType;

  const SceneSettingParam({Key? key, required this.scene, required this.settingType}) : super(key: key);

  @override
  _SceneSettingParamState createState() => _SceneSettingParamState();
}

/**
 * SceneParam UI布局
 **/
class _SceneSettingParamState extends State<SceneSettingParam> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    SceneSetting? setting = widget.settingType.sceneSetting(widget.scene);

    startDate = DateFormater.parseDate(setting?.schStartDate, "yyyy/MM/dd");
    endDate = DateFormater.parseDate(setting?.schEndDate, "yyyy/MM/dd");
    startDate ??= DateTime.now();
    endDate ??= startDate!.add(Duration(days: 30));

    setting?.schStartDate = DateFormater.formatDate(startDate, "yyyy/MM/dd");
    setting?.schEndDate = DateFormater.formatDate(endDate, "yyyy/MM/dd");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.settingType.sceneSetting(widget.scene) == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text(S.of(context).set_up_for_grow_stage)),
                ElevatedButton.icon(
                  onPressed: () {
                    gotoSetting(0);
                  },
                  //icon: const Icon(Icons.add, color: Colors.white), // 图标
                  label: Text(S.of(context).setting_setUp, style: const TextStyle(color: Colors.white)), // 文字
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: _buildSceneParam(),
            ),
      bottomNavigationBar: widget.settingType.sceneSetting(widget.scene) != null
          ? MainButton(
              text: S.of(context).apply,
              onPressed: () {
                EasyLoading.show();
                SceneSetting setting = widget.settingType.sceneSetting(widget.scene)!;
                setting.modeEnable = 1;
                SceneController.applySceneParam(widget.scene.sceneId, widget.settingType, setting.schStartDate!, setting.schEndDate!, setting.modeEnable).ifNotNull((value) {
                  if (value.result == Result.SUCCESS) {
                    EasyLoading.showSuccess(S.of(context).executeSuccess);
                  } else if (value.result == Result.FAILURE) {
                    EasyLoading.showError(S.of(context).executeFailure);
                  }
                }).whenComplete(() => EasyLoading.dismiss());
              },
            )
          : null,
    );
  }

  Widget _buildSceneParam() {
    SceneSetting setting = widget.settingType.sceneSetting(widget.scene)!;
    setting.ventSch1 = setting.ventSch1 ?? VentSchedule(lowTemp: 10 * 100, highTemp: 15 * 100, workTime: 1, workLevel: 5);
    setting.ventSch2 = setting.ventSch2 ?? VentSchedule(lowTemp: 16 * 100, highTemp: 25 * 100, workTime: 2, workLevel: 7);
    setting.ventSch3 = setting.ventSch3 ?? VentSchedule(lowTemp: 26 * 100, highTemp: 35 * 100, workTime: 3, workLevel: 10);
    setting.fanSch1 = setting.fanSch1 ?? FanSchedule(lowTemp: 10 * 100, highTemp: 15 * 100, workTime: 1, workLevel: 5);
    setting.fanSch2 = setting.fanSch2 ?? FanSchedule(lowTemp: 16 * 100, highTemp: 25 * 100, workTime: 2, workLevel: 7);
    setting.fanSch3 = setting.fanSch3 ?? FanSchedule(lowTemp: 26 * 100, highTemp: 35 * 100, workTime: 3, workLevel: 10);
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return Column(children: [
      BasicCard(
          title: S.of(context).time_settings,
          // extra: Switch(
          //   value: setting.modeEnable == 1,
          //   onChanged: (bool value) {
          //     setState(() {
          //       setting.modeEnable = value ? 1 : 0;
          //     });
          //   },
          // ),
          extra: GestureDetector(
              child: Icon(Icons.edit, color: Theme.of(context).primaryColorLight, size: 18),
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                MyBrnDateRangePicker.showDatePicker(context,
                    pickerMode: BrnDateTimeRangePickerMode.date,
                    dateFormat: "MM-dd-yyyy",
                    initialStartDateTime: startDate,
                    initialEndDateTime: endDate,
                    locale: settingProvider.toDateTimePickerLocale(),
                    pickerTitleConfig: BrnPickerTitleConfig(titleContent: S.of(context).select_time_range),
                    onConfirm: (startDateTime, endDateTime, startlist, endlist) {
                      setState(() {
                        startDate = startDateTime;
                        endDate = endDateTime;
                        setting.schStartDate = DateFormater.formatDate(startDate, "yyyy/MM/dd");
                        setting.schEndDate = DateFormater.formatDate(endDate, "yyyy/MM/dd");
                      });
                    }, onClose: () {
                      print("onClose");
                    }, onCancel: () {
                      print("onCancel");
                    }, onChange: (startDateTime, endDateTime, startlist, endlist) {});
              }
          ),

          child: BrnRichInfoGrid(
            padding: EdgeInsets.only(left: 24.sp, top: 25.sp, bottom: 25.sp),
            themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
            pairInfoList: <BrnRichGridInfo>[
              BrnRichGridInfo("${S.of(context).startDate}: ", "${DateFormater.formatDate(startDate, "MM/dd/yyyy")}"),
              BrnRichGridInfo("${S.of(context).endDate}: ", "${DateFormater.formatDate(endDate, "MM/dd/yyyy")}"),
            ],
          ),

          // child: DateTimeRangeForm(
          //   startDate: DateFormater.parseDate(setting.schStartDate, "yyyy/MM/dd"),
          //   endDate: DateFormater.parseDate(setting.schEndDate, "yyyy/MM/dd"),
          //   onChanged: (List<DateTime> value) {
          //     setting.schStartDate = DateFormater.formatDate(value[0], "yyyy/MM/dd");
          //     setting.schEndDate = DateFormater.formatDate(value[1], "yyyy/MM/dd");
          //   },
          // )
      ),

      BasicCard(
          title: S.of(context).light,
          extra: GestureDetector(
              child: Icon(Icons.edit, color: Theme.of(context).primaryColorLight, size: 18),
              onTap: () {
                gotoSetting(0);
              }),
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
          extra: GestureDetector(
              child: Icon(Icons.edit, color: Theme.of(context).primaryColorLight, size: 18),
              onTap: () {
                gotoSetting(1);
              }),
          child: Column(
            children: [
              ...buildVenFanSetting(setting.ventSch1!),
              ...buildVenFanSetting(setting.ventSch2!),
              ...buildVenFanSetting(setting.ventSch3!)],
          )),
      BasicCard(
          title: S.of(context).fan,
          extra: GestureDetector(
              child: Icon(Icons.edit, color: Theme.of(context).primaryColorLight, size: 18),
              onTap: () {
                gotoSetting(2);
              }),
          child: Column(
            children: [
              ...buildFanSetting(setting.fanSch1!),
              ...buildFanSetting(setting.fanSch2!),
              ...buildFanSetting(setting.fanSch3!),
            ],
          )),

    ]);
  }

  List<Widget> buildVenFanSetting(VentSchedule ventSchedule) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return [
      DimSilderView(label: "${S.of(context).speed}:", value: ventSchedule.workLevel.toDouble(), unit: "",  max: 10, padding: EdgeInsets.only(left: 24.sp)),
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
      DimSilderView(label: "${S.of(context).speed}:", value: fanSchedule.workLevel.toDouble(), unit: "", max: 10, padding: EdgeInsets.only(left: 24.sp)),
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

  void gotoSetting(int tabIndex) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SceneSettingPage(tabIndex: tabIndex, scene: widget.scene, settingType: widget.settingType))).then((value) {
      if (value != null) {
        setState(() {});
      }
    });
  }
}
