import 'dart:collection';
import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/ui/card/BasicCard.dart';
import 'package:planter_app/views/my_brn_date_range_picker.dart';
import 'package:provider/provider.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../../api/IotController.dart';
import '../../../../entity/domain/ResponseResult.dart';
import '../../../../entity/strategy/domain/ManModeParam.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../ui/MainButton.dart';
import '../../../../ui/silder/DimSilder.dart';
import '../../../../util/DateTimeUtil.dart';

/**
 * LightingManualControlView 主类
 **/
class LightingManualControlView extends StatefulWidget {
  final String deviceId;

  final ManModeParam manModeParam;

  const LightingManualControlView({Key? key, required this.deviceId, required this.manModeParam}) : super(key: key);

  @override
  _LightingManualControlViewState createState() => _LightingManualControlViewState();
}

/**
 * LightingManualControlView UI布局
 **/
class _LightingManualControlViewState extends State<LightingManualControlView> {
  late ManModeParam manModeParam;
  @override
  void initState() {
    super.initState();
    manModeParam = ManModeParam.fromJson(jsonDecode(jsonEncode(widget.manModeParam)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 28.sp),
      _buildLightManualDimCtrl(),
      _buildLightManualCtrl(),
      const Spacer(),
      _buildControlButton()
    ]);
  }

  Widget _buildLightManualDimCtrl() {
    return BasicCard(
        title: S.of(context).light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 28.sp),
            DimSilder(
                label: " ${S.of(context).dim}1",
                icon: Assets.images.dashboard.lighting3x.image(width: 40.sp),
                value: manModeParam.dim1Per.toDouble(),
                onChanged: (value) {
                  manModeParam.dim1Per = value.toInt();
                }),
            DimSilder(
                label: " ${S.of(context).dim}2",
                icon: Assets.images.dashboard.lighting3x.image(width: 40.sp),
                value: manModeParam.dim2Per.toDouble(),
                onChanged: (value) {
                  manModeParam.dim2Per = value.toInt();
                }),
            DimSilder(
                label: " ${S.of(context).dim}3",
                icon: Assets.images.dashboard.lighting3x.image(width: 40.sp),
                value: manModeParam.dim3Per.toDouble(),
                onChanged: (value) {
                  manModeParam.dim3Per = value.toInt();
                }),
          ],
        )
    );
  }

  Widget _buildLightManualCtrl() {
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
                  initialStartDateTime: DateTimeUtil.convertTime(manModeParam.schStartTime),
                  initialEndDateTime: DateTimeUtil.convertTime(manModeParam.schEndTime), onConfirm: (startDateTime, endDateTime, startlist, endlist) {
                setState(() {
                  manModeParam.schStartTime = DateTimeUtil.convertNum(startDateTime);
                  manModeParam.schEndTime = DateTimeUtil.convertNum(endDateTime);
                });
              }, onClose: () {}, onCancel: () {}, onChange: (startDateTime, endDateTime, startlist, endlist) {});
            }),
        child: Padding(
          padding: EdgeInsets.only(left: 24.sp, top: 12.sp, bottom: 12.sp),
          child: BrnRichInfoGrid(
            pairInfoList: <BrnRichGridInfo>[
              BrnRichGridInfo("${S.of(context).onTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(manModeParam.schStartTime))),
              BrnRichGridInfo("${S.of(context).offTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(manModeParam.schEndTime))),
              // BrnInfoModal(keyPart: "${S.of(context).onTime}：", valuePart: manModeParam.schStartDate),
              // BrnInfoModal(keyPart: "${S.of(context).offTime}：", valuePart: manModeParam.schEndDate),
            ],
          ),
        ));
  }

  Widget _buildControlButton() {
    return MainButton(
        text: S.of(context).send,
        onPressed: () {
          Map<String, dynamic> properties = HashMap();
          properties["dim1Per"] = manModeParam.dim1Per;
          properties["dim2Per"] = manModeParam.dim2Per;
          properties["dim3Per"] = manModeParam.dim3Per;

          properties["schStartTime"] = manModeParam.schStartTime;
          properties["schEndTime"] = manModeParam.schEndTime;
          properties["schEnable"] = true;

          EasyLoading.show();
          IotController.setProperties(widget.deviceId, {"manModeParam": properties}).then((value) {
            if (value.result == Result.SUCCESS) {
              widget.manModeParam.dim1Per = manModeParam.dim1Per;
              widget.manModeParam.dim2Per = manModeParam.dim2Per;
              widget.manModeParam.dim3Per = manModeParam.dim3Per;
              widget.manModeParam.schStartTime = properties["schStartTime"];
              widget.manModeParam.schEndTime = properties["schEndTime"];
              widget.manModeParam.schEnable = properties["schEnable"] == true ? 1 : 0;
              EasyLoading.showSuccess(S.of(context).executeSuccess);
            } else if (value.result == Result.FAILURE) {
              EasyLoading.showError(S.of(context).executeFailure);
            }
          }).whenComplete(() => EasyLoading.dismiss());
        });
  }
}
