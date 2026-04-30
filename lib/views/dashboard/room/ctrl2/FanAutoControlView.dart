import 'dart:collection';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/api/IotController.dart';
import 'package:planter_app/entity/domain/ResponseResult.dart';
import 'package:planter_app/ui/MainButton.dart';
import 'package:planter_app/util/SceneUtil.dart';
import 'package:provider/provider.dart';

import '../../../../entity/strategy/domain/FanSchedule.dart';
import '../../../../entity/strategy/domain/SceneSetting.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../provider/SettingProvider.dart';
import '../../../../style/AppTheme.dart';
import '../../../../ui/NumberInputBox.dart';
import '../../../../ui/card/BasicCard.dart';
import '../../../../ui/silder/DimSilder.dart';

class FanAutoControlView extends StatefulWidget {
  final String deviceId;

  final SettingType settingType;
  final SceneSetting sceneSetting;

  const FanAutoControlView({Key? key, required this.deviceId, required this.settingType, required this.sceneSetting,}) : super(key: key);

  @override
  _FanAutoControlViewState createState() => _FanAutoControlViewState();
}

class _FanAutoControlViewState extends State<FanAutoControlView> with SingleTickerProviderStateMixin {
  late SettingType settingType;

  late FanSchedule fanSch1;
  late FanSchedule fanSch2;
  late FanSchedule fanSch3;

  @override
  void initState() {
    super.initState();
    fanSch1 = widget.sceneSetting.fanSch1 ?? FanSchedule();
    fanSch2 = widget.sceneSetting.fanSch2 ?? FanSchedule();
    fanSch3 = widget.sceneSetting.fanSch3 ?? FanSchedule();

    settingType = widget.settingType;
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
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              children: [
                _buildAutoSetting(),
              ]
          )
      ),
      bottomNavigationBar: _buildControlButton(),
    );
  }

  Widget _buildAutoSetting() {
    return SingleChildScrollView(
        child: Column(children: [
          BasicCard(
            title: S.of(context).fan,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.sp),
                _buildSetting(fanSch1),
                AppTheme.divider,
                SizedBox(height: 32.sp),
                _buildSetting(fanSch2),
                AppTheme.divider,
                SizedBox(height: 32.sp),
                _buildSetting(fanSch3),
              ],
            ),
          ),
        ])
    );
  }

  Widget _buildSetting(FanSchedule vent_sch) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 16.sp),
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


  Widget _buildControlButton() {
    return MainButton(
        text: S.of(context).send,
        onPressed: () {
          Map<String, dynamic> properties = HashMap();
          properties["fanSch1"] = fanSch1.toJson();
          properties["fanSch2"] = fanSch2.toJson();
          properties["fanSch3"] = fanSch3.toJson();

          EasyLoading.show();
          IotController.setProperties(widget.deviceId, {SceneUtils.getPropertiesKey(settingType): properties}).then((value) {
            if (value.result == Result.SUCCESS) {
              EasyLoading.showSuccess(S.of(context).executeSuccess);
            } else if (value.result == Result.FAILURE) {
              EasyLoading.showError(S.of(context).executeFailure);
            }
          }).whenComplete(() => EasyLoading.dismiss());
        });
  }
}
