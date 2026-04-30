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

/**
 * VentilatorControlTabView 主类
 **/
class VentilatorControlTabView extends StatefulWidget {
  final String deviceId;

  final ManModeParam manModeParam;

  const VentilatorControlTabView({Key? key, required this.deviceId, required this.manModeParam}) : super(key: key);

  @override
  _VentilatorControlTabViewState createState() => _VentilatorControlTabViewState();
}

/**
 * VentilatorControlTabView UI布局
 **/
class _VentilatorControlTabViewState extends State<VentilatorControlTabView> with _VentilatorControlTabViewMixin, SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late List<Tab> _tabs;

  late ManModeParam manModeParam;
  bool _initialized = false; // 用于确保 didChangeDependencies 初始化逻辑只运行一次
  @override
  void initState() {
    super.initState();
    manModeParam = ManModeParam.fromJson(jsonDecode(jsonEncode(widget.manModeParam)));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _tabs = [Tab(text: S.of(context).manual), Tab(text: S.of(context).cycle)];
      _tabController = TabController(initialIndex: 0, length: _tabs.length, vsync: this);
      _initialized = true; // 确保只初始化一次
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BasicCard(
        title: S.of(context).venFan,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              controller: _tabController,
              backgroundColor: Theme.of(context).primaryColorLight,
              unselectedBackgroundColor: const Color(0xffF5F5F5),
              borderWidth: 0,
              labelSpacing: 10,
              height: 80.sp,
              contentPadding: EdgeInsets.symmetric(horizontal: 56.sp),
              radius: 4,
              labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              tabs: _tabs,
              onTap: (int index) {
                setState(() {});
              },
            ),
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
      ),
      if (_tabController.index == 1) _buildCycleWidget(),
      Spacer(),
      _buildControlButton()
    ]);
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
          if (_tabController.index == 1) {
            properties["ventOnTime"] = manModeParam.ventOnTime;
            properties["ventOffTime"] = manModeParam.ventOffTime;
          } else {
            properties["ventOnTime"] = 0;
            properties["ventOffTime"] = DateTimeUtil.convertNum(DateTimeUtil.getLastSecondOfDay(DateTime.now()));
          }
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

/**
 * VentilatorControlTabView 数据逻辑
 **/
mixin _VentilatorControlTabViewMixin<T extends StatefulWidget> on State<T> {}
