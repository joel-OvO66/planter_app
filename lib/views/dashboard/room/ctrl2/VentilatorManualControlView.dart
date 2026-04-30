import 'dart:collection';
import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/views/my_brn_date_range_picker.dart';
import 'package:provider/provider.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../../api/IotController.dart';
import '../../../../entity/domain/ResponseResult.dart';
import '../../../../entity/strategy/domain/ManModeParam.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../ui/MainButton.dart';
import '../../../../ui/card/BasicCard.dart';
import '../../../../ui/silder/DimSilder.dart';
import '../../../../util/DateTimeUtil.dart';

class VentilatorManualControlView extends StatefulWidget {
  final String deviceId;

  final ManModeParam manModeParam;

  const VentilatorManualControlView({Key? key, required this.deviceId, required this.manModeParam}) : super(key: key);

  @override
  _VentilatorManualControlViewState createState() => _VentilatorManualControlViewState();
}

class _VentilatorManualControlViewState extends State<VentilatorManualControlView> with SingleTickerProviderStateMixin {
  late ManModeParam manModeParam;

  @override
  void initState() {
    super.initState();
    manModeParam = ManModeParam.fromJson(jsonDecode(jsonEncode(widget.manModeParam)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 28.sp),
      _buildManualWidget(),
      _buildCycleWidget(),
      const Spacer(),
      _buildControlButton()
    ]);
  }

  Widget _buildManualWidget() {
    return BasicCard(
      title: S.of(context).venFan,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.sp),
          DimSilder(
            label: " ${S.of(context).speed}",
            icon: Assets.images.dashboard.speed3x.image(width: 32.sp),
            value: manModeParam.ventLevel.toDouble(),
            max: 10,
            unit: "",
            onChanged: (value) {
              manModeParam.ventLevel = value.toInt();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCycleWidget() {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return BasicCard(
      title: S.of(context).cycle_schedule,
      extra: GestureDetector(
          child: Icon(Icons.edit, color: Theme.of(context).primaryColorLight, size: 36.sp),
          onTap: () {
            String format = 'HH${S.of(context).hour}:mm${S.of(context).minute}';
            BrnPickerTitleConfig pickerTitleConfig = BrnPickerTitleConfig(titleContent: S.of(context).select_time_range);
            MyBrnDateRangePicker.showDatePicker(context,
                minDateTime: DateTime.parse('2024-01-01 00:00:00'),
                maxDateTime: DateTime.parse('2024-01-01 23:59:59'),
                pickerMode: BrnDateTimeRangePickerMode.time,
                minuteDivider: 1,
                pickerTitleConfig: pickerTitleConfig,
                // dateFormat: format,
                locale: settingProvider.toDateTimePickerLocale(),

                ///  设置不限制开始时间必须≤结束时间
                ///  isLimitTimeRange: false,
                initialStartDateTime: DateTimeUtil.convertTime(manModeParam.ventOnTime),
                initialEndDateTime: DateTimeUtil.convertTime(manModeParam.ventOffTime), onConfirm: (startDateTime, endDateTime, startlist, endlist) {
              setState(() {
                manModeParam.ventOnTime = DateTimeUtil.convertNum(startDateTime);
                manModeParam.ventOffTime = DateTimeUtil.convertNum(endDateTime);
              });
            }, onClose: () {}, onCancel: () {}, onChange: (startDateTime, endDateTime, startlist, endlist) {});
          }),
      child: Padding(
          padding: EdgeInsets.only(left: 24.sp, top: 12.sp, bottom: 12.sp),
          child: BrnRichInfoGrid(
            pairInfoList: <BrnRichGridInfo> [
              BrnRichGridInfo("${S.of(context).onTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(manModeParam.ventOnTime))),
              BrnRichGridInfo("${S.of(context).offTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(manModeParam.ventOffTime))),
            ],
          )),
    );
  }

  Widget _buildControlButton() {
    return MainButton(
        text: S.of(context).send,
        onPressed: () {
          Map<String, dynamic> properties = HashMap();
          properties["ventLevel"] = manModeParam.ventLevel;
          properties["ventOnTime"] = manModeParam.ventOnTime;
          properties["ventOffTime"] = manModeParam.ventOffTime;
          EasyLoading.show();
          IotController.setProperties(widget.deviceId, {"manModeParam": properties}).then((value) {
            if (value.result == Result.SUCCESS) {
              widget.manModeParam.ventLevel = manModeParam.ventLevel;
              widget.manModeParam.ventOnTime = properties["ventOnTime"];
              widget.manModeParam.ventOffTime = properties["ventOffTime"];
              EasyLoading.showSuccess(S.of(context).executeSuccess);
            } else if (value.result == Result.FAILURE) {
              EasyLoading.showError(S.of(context).executeFailure);
            }
          }).whenComplete(() => EasyLoading.dismiss());
        });
  }
}

