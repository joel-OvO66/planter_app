import 'dart:collection';
import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/api/IotController.dart';
import 'package:planter_app/entity/device/domain/v5/GlobalParam.dart';
import 'package:planter_app/entity/domain/ResponseResult.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';
import 'package:planter_app/ui/MainButton.dart';
import 'package:planter_app/ui/card/BasicCard.dart';
import 'package:planter_app/ui/silder/DimSilder.dart';
import 'package:planter_app/ui/silder/DimSilderRow.dart';
import 'package:planter_app/views/my_brn_select_tag.dart';

import '../../generated/l10n.dart';

class DeviceSettingPage extends StatefulWidget {
  final RoomProfile room;

  const DeviceSettingPage({Key? key, required this.room}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeviceSettingPageState();
}

class _DeviceSettingPageState extends State<DeviceSettingPage> with SingleTickerProviderStateMixin{
  late final RoomProfile room;
  late GlobalParam? globalParam;

  @override
  void initState() {
    super.initState();
    room = widget.room;
    globalParam = GlobalParam.fromJson(jsonDecode(jsonEncode(room.sensorV5Data?.globalParam)));
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
      appBar: AppBar(title: Text(S.of(context).device_setting)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.sp,),
            _buildWorkModeCard(),
            _buildTempUnitCard(),
            _buildScreenLock(),
            _buildKeySound(),
          ],
        ),
      ),
      bottomNavigationBar: _buildControlButton(),
    );
  }

  Widget _buildWorkModeCard() {
    return BasicCard(
      //: ${room.sensorV5Data?.globalParam?.runMode == 1 ? S.of(context).auto : S.of(context).manual
      title: S.of(context).workingMode,
      child:  Padding(
        padding: EdgeInsets.only(left: 32.sp, top: 25.sp, bottom: 25.sp),
        child: MyBrnSelectTag(
          tags: [
            S.of(context).manual,
            S.of(context).auto,
          ],
          isSingleSelect: true,
          fixWidthMode: false,
          softWrap: false,
          spacing: 20,
          onSelect: (value) {
            setState(() {
              globalParam?.runMode = value[0];
            });
          },
          initTagState: _getSelected(globalParam?.runMode), //globalParam?.runMode == 0 ? [false, true] : [true, false],
          tagWidth: _getTagWidth(context),
          alignment: Alignment.center,
          tagBackgroundColor: const Color(0xffF5F5F5),
          selectedTagBackgroundColor:const Color(0xff146029),
        ),
      )
    );
  }

  List<bool> _getSelected(int? runMode) {
    if(runMode == 0) return [true, false];
    return [false, true];
  }

  double _getTagWidth(context, {int rowCount = 2}) {
    double leftRightPadding = 40;
    double rowItemSpace = 12;
    return MediaQuery.of(context).size.width - leftRightPadding - rowItemSpace * (rowCount - 1) / rowCount;
  }

  Widget _buildTempUnitCard() {
    return BasicCard(
        title: S.of(context).setting_temperatureUnit,
        child:  Padding(
          padding: EdgeInsets.only(left: 32.sp, top: 35.sp, bottom: 25.sp),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BrnRadioButton(
                  radioIndex: 0,
                  isSelected: globalParam?.tempUnit == 0,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("°C",),
                  ),
                  onValueChangedAtIndex: (index, value) {
                    setState(() {
                      globalParam?.tempUnit = index;
                    });
                  },
                ),
                const SizedBox(width: 35,),
                BrnRadioButton(
                  radioIndex: 1,
                  isSelected: globalParam?.tempUnit == 1,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("°F",),
                  ),
                  onValueChangedAtIndex: (index, value) {
                    setState(() {
                      globalParam?.tempUnit = index;
                    });
                  },
                ),
              ],
            )
        )
    );
  }

  Widget _buildScreenLock() {
    return BasicCard(
        title: S.of(context).lock_screen_setting,
        child:  Padding(
          padding: EdgeInsets.only(left: 32.sp, top: 10.sp, bottom: 15.sp),
          child: Column(
            children: [
              SwitchListTile(
                title: Text(S.of(context).screen_lock),
                value: globalParam?.lockScreenEn == 1,
                onChanged: (bool value) {
                  setState(() {
                    globalParam?.lockScreenEn = value ? 1 : 0;
                  });
                },
              ),
              SizedBox(height: 15.sp),
              DimSilderRow(
                label: S.of(context).minute,
                padding: EdgeInsetsGeometry.only(left: 10.sp, right: 25.sp),
                value: globalParam?.lockScreenTime.toDouble() ?? 1,
                min: 0, max: 10,
                divisions: 10, unit: "",
                onChanged: (value) {
                  setState(() {
                    globalParam?.lockScreenTime = value.toInt();
                  });
                },),
            ],
          ),
        )
    );
  }


  Widget _buildKeySound() {
    return BasicCard(
        title: S.of(context).dev_key_sound_setting,
        child:  Padding(
          padding: EdgeInsets.only(left: 32.sp, top: 10.sp, bottom: 15.sp),
          child: Column(
            children: [
              SwitchListTile(
                title: Text(S.of(context).dev_key_sound),
                value: globalParam?.keySoundEn == 1,
                onChanged: (bool value) {
                  setState(() {
                    globalParam?.keySoundEn = value ? 1 : 0;
                  });
                },
              ),
            ],
          ),
        )
    );
  }

  Widget _buildControlButton() {
    return MainButton(
        text: S.of(context).send,
        onPressed: () {
          Map<String, dynamic> properties = HashMap();
          properties["runMode"] = globalParam?.runMode;
          properties["tempUnit"] = globalParam?.tempUnit;
          properties["lockScreenEn"] = globalParam?.lockScreenEn;
          properties["lockScreenTime"] = globalParam?.lockScreenTime;
          properties["keySoundEn"] = globalParam?.keySoundEn;

          EasyLoading.show();
          IotController.setProperties(widget.room.deviceId!, {"globalParam": properties}).then((value) {
            if (value.result == Result.SUCCESS) {
              EasyLoading.showSuccess(S.of(context).executeSuccess);
            } else if (value.result == Result.FAILURE) {
              EasyLoading.showError(S.of(context).executeFailure);
            }
          }).whenComplete(() => EasyLoading.dismiss());
        }
    );
  }
}

