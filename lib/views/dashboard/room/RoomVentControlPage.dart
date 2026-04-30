import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';
import 'package:planter_app/entity/strategy/domain/SceneSetting.dart';
import 'package:planter_app/views/dashboard/room/ctrl2/LightingAutoControlView.dart';
import 'package:planter_app/views/dashboard/room/ctrl2/LightingManualControlView.dart';
import 'package:planter_app/views/dashboard/room/ctrl2/VentilatorAutoControlView.dart';
import 'package:planter_app/views/dashboard/room/ctrl2/VentilatorManualControlView.dart';

import '../../../entity/strategy/domain/ManModeParam.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import 'ctrl/FanControlTabView.dart';
import 'ctrl/LightingControlTabView.dart';
import 'ctrl/VentilatorControlTabView.dart';
import 'ctrl/WaterControlTabView.dart';

class RoomVentControlPage extends StatefulWidget {
  final RoomProfile room;
  const RoomVentControlPage({Key? key, required this.room}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomVentControlPageState();
}

class _RoomVentControlPageState extends State<RoomVentControlPage> {
  late final RoomProfile room;

  int tabIndex = 0;
  late final ManModeParam manModeParam;
  late final SceneSetting seedingParam;
  late final SceneSetting vegetativeParam;
  late final SceneSetting floweringParam;

  @override
  void initState() {
    super.initState();
    room = widget.room;
    manModeParam = room.sensorV5Data?.manModeParam ?? ManModeParam();
    seedingParam = room.sensorV5Data?.seedingParam ?? SceneSetting();
    vegetativeParam = room.sensorV5Data?.vegetativeParam ?? SceneSetting();
    floweringParam = room.sensorV5Data?.floweringParam ?? SceneSetting();
    tabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (room.sensorV5Data?.globalParam?.runMode == 1) {
      return _buildVentAutoTabPage();
    } else {
      return _buildVentManual();
    }
  }

  Widget _buildVentAutoTabPage () {
    tabIndex = _calcAutoSceneTabIndex();
    return DefaultTabController(
        length: 3,
        initialIndex: tabIndex,
        animationDuration: Duration.zero,
        child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).auto_vent_setting),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Material(
                    color: Colors.grey[200],
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      // labelPadding: EdgeInsets.zero,
                      tabs: [
                        Tab(
                          icon: Assets.images.dashboard.seedling3x.image(width: 56.sp),
                          text: S.of(context).sceneSetting_settingType_enum(SettingType.SEEDING),
                          iconMargin: const EdgeInsets.only(bottom: 0),
                        ),
                        Tab(
                          icon: Assets.images.dashboard.vegetative3x.image(width: 56.sp),
                          text: S.of(context).sceneSetting_settingType_enum(SettingType.VEGETATIVE),
                          iconMargin: const EdgeInsets.only(bottom: 0),
                        ),
                        Tab(
                          icon: Assets.images.dashboard.flowering3x.image(width: 56.sp),
                          text: S.of(context).sceneSetting_settingType_enum(SettingType.FLOWERING),
                          iconMargin: const EdgeInsets.only(bottom: 0),
                        ),
                      ],
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.label,
                    )),
              ),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  VentilatorAutoControlView(deviceId: room.deviceId!, settingType: SettingType.SEEDING, sceneSetting: seedingParam,),
                  VentilatorAutoControlView(deviceId: room.deviceId!, settingType: SettingType.VEGETATIVE, sceneSetting: vegetativeParam,),
                  VentilatorAutoControlView(deviceId: room.deviceId!, settingType: SettingType.FLOWERING, sceneSetting: floweringParam,),
                ]
            )
        )
    );
  }

  Widget _buildVentManual() {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).manual_vent_setting),
      ),
      body: VentilatorManualControlView(deviceId: room.deviceId!, manModeParam: manModeParam),
    );
  }

  int _calcAutoSceneTabIndex() {
    switch(widget.room.sensorV5Data?.lightRunningState?.autoScene) {
      case 1:
        tabIndex = 0;
        break;
      case 2:
        tabIndex = 1;
        break;
      case 3:
        tabIndex = 2;
        break;
      default:
        tabIndex = 0;
        break;
    }
    return tabIndex;
  }
}

