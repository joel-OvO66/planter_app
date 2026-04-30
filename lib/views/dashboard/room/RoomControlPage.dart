import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';

import '../../../entity/strategy/domain/ManModeParam.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import 'ctrl/FanControlTabView.dart';
import 'ctrl/LightingControlTabView.dart';
import 'ctrl/VentilatorControlTabView.dart';
import 'ctrl/WaterControlTabView.dart';

class RoomControlPage extends StatelessWidget {
  final RoomProfile room;

  final int tabIndex;

  const RoomControlPage({Key? key, this.tabIndex = 0, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ManModeParam manModeParam;
    if (room.sensorV5Data != null && room.sensorV5Data!.manModeParam != null) {
      manModeParam = room.sensorV5Data!.manModeParam!;
    } else {
      manModeParam = ManModeParam();
    }
    return DefaultTabController(
        length: 3,
        initialIndex: tabIndex,
        child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).real_time_control),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Material(
                    color: Colors.grey[200],
                    child: TabBar(
                  padding: EdgeInsets.only(top: 12.sp),
                  tabs: [
                    TabIcon(
                      activeIcon: Assets.images.dashboard.lighting3x.image(width: 64.sp),
                      inactiveIcon: Assets.images.dashboard.lightingBlk3x.image(width: 64.sp),
                    ),
                    TabIcon(
                      activeIcon: Assets.images.dashboard.ductFan3x.image(width: 64.sp),
                      inactiveIcon: Assets.images.dashboard.ductFanBlk3x.image(width: 64.sp),
                    ),
                    TabIcon(
                      activeIcon: Assets.images.dashboard.circulationFan3x.image(width: 64.sp),
                      inactiveIcon: Assets.images.dashboard.circulationFanBlk3x.image(width: 64.sp),
                    ),
                    // TabIcon(
                    //   activeIcon: Assets.images.dashboard.tempHumid3x.image(width: 64.sp),
                    //   inactiveIcon: Assets.images.dashboard.tempHumidBlk3x.image(width: 64.sp),
                    // )
                  ],
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.label,
                )),
              ),
            ),
            body: TabBarView(children: [
              LightingControlTabView(deviceId: room.deviceId!, manModeParam: manModeParam),
              VentilatorControlTabView(deviceId: room.deviceId!, manModeParam: manModeParam),
              FanControlTabView(deviceId: room.deviceId!, manModeParam: manModeParam),
              // WaterControlTabView(room: room),
            ])));
  }
}

class TabIcon extends StatelessWidget {
  final Widget activeIcon;
  final Widget inactiveIcon;

  TabIcon({required this.activeIcon, required this.inactiveIcon});

  @override
  Widget build(BuildContext context) {
    final TabController? controller = DefaultTabController.of(context);
    bool isSelected = controller?.index == controller?.animation?.value.round();

    return Container(padding: EdgeInsets.only(bottom: 12.sp), child: isSelected ? activeIcon : inactiveIcon);
  }
}
