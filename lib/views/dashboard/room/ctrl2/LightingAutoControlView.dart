import 'dart:collection';
import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/strategy/domain/SceneSetting.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/ui/card/BasicCard.dart';
import 'package:planter_app/ui/silder/DimSilderEdit.dart';
import 'package:planter_app/util/SceneUtil.dart';
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
 * LightingAutoControlView 主类
 **/
class LightingAutoControlView extends StatefulWidget {
  final String deviceId;

  final SettingType settingType;
  final SceneSetting sceneSetting;

  const LightingAutoControlView({Key? key, required this.deviceId, required this.settingType, required this.sceneSetting}) : super(key: key);

  @override
  _LightingAutoControlViewState createState() => _LightingAutoControlViewState();
}

/**
 * LightingAutoControlView UI布局
 **/
class _LightingAutoControlViewState extends State<LightingAutoControlView> {
  late SceneSetting sceneSetting;
  late SettingType settingType;

  @override
  void initState() {
    super.initState();
    settingType = widget.settingType;
    sceneSetting = SceneSetting.fromJson(jsonDecode(jsonEncode(widget.sceneSetting)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              children: [
                _buildLightDimCtrl(),
                _buildLightCtrl(),
              ]
          )
      ),
      bottomNavigationBar: _buildControlButton(),
    );
  }

  Widget _buildLightDimCtrl() {
    return BasicCard(
        title: S.of(context).light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.sp),
            DimSilderEdit(
                label: " ${S.of(context).dim}1",
                icon: Assets.images.dashboard.lighting3x.image(width: 42.sp),
                value: sceneSetting.dim1Per.toDouble(),
                onChanged: (value) {
                  sceneSetting.dim1Per = value.toInt();
                }),
            SizedBox(height: 30.sp),
            DimSilderEdit(
                label: " ${S.of(context).dim}2",
                icon: Assets.images.dashboard.lighting3x.image(width: 42.sp),
                value: sceneSetting.dim2Per.toDouble(),
                onChanged: (value) {
                  sceneSetting.dim2Per = value.toInt();
                }),
            SizedBox(height: 30.sp),
            DimSilderEdit(
                label: " ${S.of(context).dim}3",
                icon: Assets.images.dashboard.lighting3x.image(width: 42.sp),
                value: sceneSetting.dim3Per.toDouble(),
                onChanged: (value) {
                  sceneSetting.dim3Per = value.toInt();
                }),
            SizedBox(height: 28.sp),
          ],
        )
    );
  }

  Widget _buildLightCtrl() {
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
                  initialStartDateTime: DateTimeUtil.convertTime(sceneSetting.schStartTime),
                  initialEndDateTime: DateTimeUtil.convertTime(sceneSetting.schEndTime), onConfirm: (startDateTime, endDateTime, startlist, endlist) {
                setState(() {
                  sceneSetting.schStartTime = DateTimeUtil.convertNum(startDateTime);
                  sceneSetting.schEndTime = DateTimeUtil.convertNum(endDateTime);
                });
              }, onClose: () {}, onCancel: () {}, onChange: (startDateTime, endDateTime, startlist, endlist) {});
            }),
        child: Padding(
          padding: EdgeInsets.only(left: 24.sp, top: 12.sp, bottom: 12.sp),
          child: BrnRichInfoGrid(
            pairInfoList: <BrnRichGridInfo>[
              BrnRichGridInfo("${S.of(context).onTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(sceneSetting.schStartTime))),
              BrnRichGridInfo("${S.of(context).offTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(sceneSetting.schEndTime))),
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
          properties["dim1Per"] = sceneSetting.dim1Per;
          properties["dim2Per"] = sceneSetting.dim2Per;
          properties["dim3Per"] = sceneSetting.dim3Per;

          properties["schStartTime"] = sceneSetting.schStartTime;
          properties["schEndTime"] = sceneSetting.schEndTime;
          properties["schEnable"] = sceneSetting.schEnable;

          EasyLoading.show();
          IotController.setProperties(widget.deviceId, {SceneUtils.getPropertiesKey(settingType) : properties}).then((value) {
            if (value.result == Result.SUCCESS) {
              widget.sceneSetting.dim1Per = sceneSetting.dim1Per;
              widget.sceneSetting.dim2Per = sceneSetting.dim2Per;
              widget.sceneSetting.dim3Per = sceneSetting.dim3Per;
              widget.sceneSetting.schStartTime = properties["schStartTime"];
              widget.sceneSetting.schEndTime = properties["schEndTime"];
              widget.sceneSetting.schEnable = properties["schEnable"];
              EasyLoading.showSuccess(S.of(context).executeSuccess);
            } else if (value.result == Result.FAILURE) {
              EasyLoading.showError(S.of(context).executeFailure);
            }
          }).whenComplete(() => EasyLoading.dismiss());
        });
  }
}
