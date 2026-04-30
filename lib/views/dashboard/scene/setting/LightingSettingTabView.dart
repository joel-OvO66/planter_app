import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/ui/silder/DimSilderEdit.dart';
import 'package:planter_app/views/my_brn_date_range_picker.dart';
import 'package:provider/provider.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../../components/TimeRadialGaugeRangeSlider.dart';
import '../../../../entity/strategy/domain/SceneSetting.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../ui/card/BasicCard.dart';
import '../../../../ui/silder/DimSilder.dart';
import '../../../../util/DateTimeUtil.dart';

/**
 * LightingSettingTabView 主类
 **/
class LightingSettingTabView extends StatefulWidget {
  final SceneSetting setting;

  final SettingType settingType;

  const LightingSettingTabView({Key? key, required this.setting, required this.settingType}) : super(key: key);

  @override
  _LightingSettingTabViewState createState() => _LightingSettingTabViewState();
}

/**
 * LightingSettingTabView UI布局
 **/
class _LightingSettingTabViewState extends State<LightingSettingTabView> {
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
    SceneSetting setting = widget.setting;
    return SingleChildScrollView(
        child: Column(children: [
      BasicCard(
        title: S.of(context).light,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 15.sp),),
            DimSilderEdit(
              label: " ${S.of(context).dim}1",
              icon: Assets.images.dashboard.lighting3x.image(width: 42.sp),
              value: setting.dim1Per.toDouble(),
              onChanged: (value) {
                setting.dim1Per = value.toInt();
              },
            ),
            Padding(padding: EdgeInsets.only(top: 15.sp),),
            DimSilderEdit(
              label: " ${S.of(context).dim}2",
              icon: Assets.images.dashboard.lighting3x.image(width: 42.sp),
              value: setting.dim2Per.toDouble(),
              onChanged: (value) {
                setting.dim2Per = value.toInt();
              },
            ),
            Padding(padding: EdgeInsets.only(top: 15.sp),),
            DimSilderEdit(
              label: " ${S.of(context).dim}3",
              icon: Assets.images.dashboard.lighting3x.image(width: 42.sp),
              value: setting.dim3Per.toDouble(),
              onChanged: (value) {
                setting.dim3Per = value.toInt();
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 15.sp),),
          ],
        ),
      ),
      //_buildTime()
      _buildLightGrowTime(),
    ]));
  }

  Widget _buildTime() {
    return BasicCard(
      title: S.of(context).light,
      child: Column(
        children: <Widget>[
          TimeRadialGaugeRangeSlider(
            startTime: widget.setting.schStartTime,
            endTime: widget.setting.schEndTime,
            onStartTimeChanged: (value) {
              widget.setting.schStartTime = value;
            },
            onEndTimeChanged: (value) {
              widget.setting.schEndTime = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLightGrowTime() {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return BasicCard(
        title: S.of(context).light,
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
                  initialStartDateTime: DateTimeUtil.convertTime(widget.setting.schStartTime),
                  initialEndDateTime: DateTimeUtil.convertTime(widget.setting.schEndTime),
                  onConfirm: (startDateTime, endDateTime, startlist, endlist) {
                    setState(() {
                      widget.setting.schStartTime = DateTimeUtil.convertNum(startDateTime);
                      widget.setting.schEndTime = DateTimeUtil.convertNum(endDateTime);
                    });
                  },
                  onClose: () {

                  },
                  onCancel: () {

                  },
                  onChange: (startDateTime, endDateTime, startlist, endlist) {

                  });
            }),
        child: Padding(
          padding: EdgeInsets.only(left: 12.sp, top: 12.sp, bottom: 12.sp),
          child: Column(
            children: [
              BrnRichInfoGrid(
                pairInfoList: <BrnRichGridInfo>[
                  BrnRichGridInfo("${S.of(context).onTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(widget.setting.schStartTime))),
                  BrnRichGridInfo("${S.of(context).offTime}：", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(widget.setting.schEndTime))),
                  // BrnInfoModal(keyPart: "${S.of(context).onTime}：", valuePart: manModeParam.schStartDate),
                  // BrnInfoModal(keyPart: "${S.of(context).offTime}：", valuePart: manModeParam.schEndDate),
                ],
              ),

              TimeRadialGaugeRangeSlider(
                startTime: widget.setting.schStartTime,
                endTime: widget.setting.schEndTime,
                onStartTimeChanged: (value) {
                  setState(() {
                    widget.setting.schStartTime = value;
                  });
                },
                onEndTimeChanged: (value) {
                  setState(() {
                    widget.setting.schEndTime = value;
                  });
                },
              ),
            ],
          )
        ));
  }
}
