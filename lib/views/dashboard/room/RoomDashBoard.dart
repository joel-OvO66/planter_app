import 'dart:async';
import 'dart:collection';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/common/RoomService.dart';
import 'package:planter_app/entity/device/domain/v5/FanState.dart';
import 'package:planter_app/entity/device/domain/v5/LightRunningState.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/style/BrunoThemeConfig.dart';
import 'package:planter_app/ui/DialogAlert.dart';
import 'package:planter_app/util/SceneUtil.dart';
import 'package:planter_app/views/dashboard/room/RoomFanControlPage.dart';
import 'package:planter_app/views/dashboard/room/RoomLightControlPage.dart';
import 'package:planter_app/views/dashboard/room/RoomVentControlPage.dart';
import 'package:planter_app/views/setting/DeviceSettingPage.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../api/IotController.dart';
import '../../../api/RoomController.dart';
import '../../../entity/device/domain/v5/SensorV5Data.dart';
import '../../../entity/domain/ResponseResult.dart';
import '../../../entity/strategy/domain/SceneSetting.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../ui/card/BasicCard.dart';
import '../../../ui/silder/DimSilderView.dart';
import '../../../util/DateTimeUtil.dart';
import '../scene/SceneForm.dart';
import '../scene/ScenesPage.dart';
import '../scene/param/SceneSettingDetailPage.dart';
import 'RoomControlPage.dart';
import 'RoomEnvironmentCard.dart';

/**
 * RoomDashBoard 主类
 **/
class RoomDashBoard extends StatefulWidget {
  final RoomProfile room;

  const RoomDashBoard({Key? key, required this.room}) : super(key: key);

  @override
  _RoomDashBoardState createState() => _RoomDashBoardState();
}

/**
 * RoomDashBoard UI布局
 **/
class _RoomDashBoardState extends State<RoomDashBoard> with _RoomDashBoardMixin {
  bool scrollTop = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void reloadRoomProfile() {
    Provider.of<RoomService>(context, listen: false).getRoomProfile();
    // EasyLoading.show();
    // RoomController.getRoomProfileById(widget.room.roomId).ifNotNull((value) {
    //   setState(() {
    //     widget.room.sensorV5Data = value.sensorV5Data;
    //   });
    // }).whenComplete(() => EasyLoading.dismiss());
  }

  @override
  Widget build(BuildContext context) {
    final roomId = context.watch<RoomService>().room?.roomId;
    if (roomId == widget.room.roomId) {
      widget.room.sensorV5Data = context.watch<RoomService>().room?.sensorV5Data;
    }
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          // 监听到滚动事件后进行处理
          if (scrollNotification is ScrollEndNotification) {
            if (scrollTop) {
              reloadRoomProfile();
            }
            scrollTop = false;
          }
          // 检查是否已到达顶部或底部
          if (scrollNotification.metrics.pixels <= 0) {
            scrollTop = true;
          }
          return true;
        },
        child: SingleChildScrollView(
            child: Column(
              children: [
                BrnCommonCardTitle(
                  padding: EdgeInsets.only(left: 24.sp, top: 12.sp, bottom: 6.sp),
                  title: S.of(context).dashBoard,
                  accessoryWidget: GestureDetector(
                      onTap: () {
                        //reloadRoomProfile();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeviceSettingPage(room: widget.room)));
                      },
                      child: Padding(padding: EdgeInsets.only(right: 24.sp), child: const Icon(Icons.settings))),
                  // accessoryText: '辅助文本',
                ),
                RoomEnvironmentCard(room: widget.room, enableTap: false),
                _buildRunningStateCard(),
                buildLightingCard(),
                buildVentilatorCard(),
                buildFanCard(),
                BrnCommonCardTitle(
                  padding: EdgeInsets.only(left: 24.sp, right: 24.sp, top: 12.sp, bottom: 6.sp),
                  title: S.of(context).growPlan,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScenesPage(room: widget.room)));
                  },
                  accessoryText: S.of(context).more,
                ),
                _buildSceneCards(),
                SizedBox(height: 100.sp)
              ],
            )
        )
    );
  }

  Widget _buildRunningStateCard() {
    LightRunningState? runningState = widget.room.sensorV5Data?.lightRunningState;
    SensorV5Data? sensorV5Data = widget.room.sensorV5Data;

    String text;
    String? dateText;
    SettingType settingType = SettingType.FLOWERING;
    switch(runningState?.autoScene) {
      case 1:
        dateText =  "${sensorV5Data?.seedingParam?.schStartDate} ~ ${sensorV5Data?.seedingParam?.schEndDate}";
        settingType = SettingType.SEEDING;
        break;
      case 2:
        dateText =  "${sensorV5Data?.vegetativeParam?.schStartDate} ~ ${sensorV5Data?.vegetativeParam?.schEndDate}";
        settingType = SettingType.VEGETATIVE;
        break;
      case 3:
        dateText =  "${sensorV5Data?.floweringParam?.schStartDate} ~ ${sensorV5Data?.floweringParam?.schEndDate}";
        settingType = SettingType.FLOWERING;
        break;
    }
    text = S.of(context).sceneSetting_settingType_enum(settingType);
    if (runningState?.autoScene == 0) {
      text = "None";
    }

    return BasicCard(
      title: S.of(context).dash_running_status,
      child: Padding(
          padding: EdgeInsets.only(left: 32.sp, top: 10.sp, bottom: 15.sp),
          child: BrnPairInfoTable(
            rowDistance: 15.sp,
            themeData: BrunoThemeConfig.lightBrnTheme().pairInfoTableConfig,
            itemSpacing: 25.sp,
            customKeyWidth: const FixedColumnWidth(120.0),
            children: <BrnInfoModal>[
              if (runningState?.runMode == 0) ...[
                BrnInfoModal(keyPart: "${S.of(context).workingMode}：", valuePart: S.of(context).manual),
              ] else ...[
                BrnInfoModal(keyPart: "${S.of(context).workingMode}：", valuePart: S.of(context).auto),
                BrnInfoModal(keyPart: "${S.of(context).growthStage}：", valuePart: text,),
                if (runningState?.autoScene != 0)
                  BrnInfoModal(keyPart: "${S.of(context).grow_date_range}：", valuePart: dateText),
              ]
            ],
          )),
    );
  }

  Widget _buildSceneRunningCard_old() {
    return BasicCard(
      title: "${S.of(context).current_mode}: ${widget.room.sensorV5Data?.globalParam?.runMode == 1 ? S.of(context).auto : S.of(context).manual}",
      extra: Switch(
        value: widget.room.sensorV5Data?.globalParam?.runMode == 1,
        onChanged: (bool value) {
          Map<String, dynamic> properties = HashMap();
          properties["runMode"] = value ? 1 : 0;
          EasyLoading.show();
          IotController.setProperties(widget.room.deviceId!, {"globalParam": properties}).then((result) {
            if (result.result == Result.SUCCESS) {
              EasyLoading.showSuccess(S.of(context).executeSuccess);
              setState(() {
                widget.room.sensorV5Data?.globalParam?.runMode = value ? 1 : 0;
              });
              // reloadRoomProfile();
            } else if (result.result == Result.FAILURE) {
              EasyLoading.showError(S.of(context).executeFailure);
            }
          }).whenComplete(() => EasyLoading.dismiss());
        },
      ),
      child: TextButton.icon(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControlPage(room: widget.room)));
          },
          label: Text(S.of(context).real_time_control)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControlPage(room: widget.room)));
      },
    );
  }

  Widget buildLightingCard() {
    LightRunningState? runningState = widget.room.sensorV5Data?.lightRunningState;
    return BasicCard(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoomLightControlPage(room: widget.room)));
        },
        child: Row(
          children: [
            SizedBox(
                width: 172.sp,
                height: 120.sp,
                child: Tab(icon: Assets.images.dashboard.lighting3x.image(width: 64.sp), text: S.of(context).dash_lighting)),
            Expanded(
                child: Column(
                  children: [
                    DimSilderView(label: "${S.of(context).dim}1", value: runningState?.dim1Per.toDouble() ?? 0),
                    DimSilderView(label: "${S.of(context).dim}2", value: runningState?.dim2Per.toDouble() ?? 0),
                    DimSilderView(label: "${S.of(context).dim}3", value: runningState?.dim3Per.toDouble() ?? 0),
                    BrnRichInfoGrid(
                      space: 10.sp,
                      themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
                      padding: EdgeInsets.only(top: 2.sp, bottom: 10.sp),
                      pairInfoList: <BrnRichGridInfo>[
                        BrnRichGridInfo("${S.of(context).onTime}: ", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(runningState?.schStartTime)),),
                        BrnRichGridInfo("${S.of(context).offTime}: ", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(runningState?.schEndTime))),
                      ],
                    )
                  ],
                )
            )
          ],
        )
    );
  }

  Widget buildVentilatorCard() {
    FanState? fanState = widget.room.sensorV5Data?.venState;
    SensorV5Data? sensorV5Data = widget.room.sensorV5Data;
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);

    SceneSetting? sceneSetting;
    switch(sensorV5Data?.lightRunningState?.autoScene) {
      case 1:
        sceneSetting = sensorV5Data?.seedingParam;
        break;
      case 2:
        sceneSetting = sensorV5Data?.vegetativeParam;
        break;
      case 3:
        sceneSetting = sensorV5Data?.floweringParam;
        break;
    }

    String? autoDesText = SceneUtils.getVentTempRange(context, fanState?.countDown?? 0, sceneSetting, settingProvider);

    return BasicCard(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoomVentControlPage(room: widget.room)));
        },
        child: Row(
          children: [
            SizedBox(
                width: 172.sp,
                height: 120.sp,
                child: Tab(icon: Assets.images.dashboard.ductFan3x.image(width: 64.sp), text:  S.of(context).dash_ventilator)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DimSilderView(label: "${S.of(context).speed}", value: fanState?.workLevel.toDouble() ?? 0, max: 10, divisions: 10, unit: ""),
                // Text("${S.of(context).run_countdown_timer}: ${DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(fanState?.countDown)) ?? '--'}",
                //     style: Theme.of(context).textTheme.bodyMedium),

                if (sensorV5Data?.lightRunningState?.runMode == 0) ...[
                  BrnRichInfoGrid(
                    space: 10.sp,
                    themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
                    padding: EdgeInsets.only(top: 2.sp, bottom: 10.sp),
                    pairInfoList: <BrnRichGridInfo>[
                      BrnRichGridInfo("${S.of(context).onTime}: ", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(sensorV5Data?.manModeParam?.ventOnTime)),),
                      BrnRichGridInfo("${S.of(context).offTime}: ", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(sensorV5Data?.manModeParam?.ventOffTime))),
                    ],
                  )
                ]
                else if(autoDesText != null && autoDesText.isNotEmpty) ...[
                  Text(autoDesText, style: Theme.of(context).textTheme.bodyMedium),
                ]
              ],
            ))
          ],
        ));
  }

  Widget buildFanCard() {
    FanState? fanState1 = widget.room.sensorV5Data?.fanState1;
    FanState? fanState2 = widget.room.sensorV5Data?.fanState2;

    LightRunningState? runningState = widget.room.sensorV5Data?.lightRunningState;
    SensorV5Data? sensorV5Data = widget.room.sensorV5Data;

    final settingProvider = Provider.of<SettingProvider>(context, listen: false);

    SceneSetting? sceneSetting;
    switch(sensorV5Data?.lightRunningState?.autoScene) {
      case 1:
        sceneSetting = sensorV5Data?.seedingParam;
        break;
      case 2:
        sceneSetting = sensorV5Data?.vegetativeParam;
        break;
      case 3:
        sceneSetting = sensorV5Data?.floweringParam;
        break;
    }

    String? autoDesText = SceneUtils.getFanTempRange(context, fanState1?.countDown?? 0, sceneSetting, settingProvider);

    return BasicCard(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoomFanControlPage(room: widget.room)));
        },
        child: Row(children: [
          SizedBox(
              width: 172.sp,
              height: 120.sp,
              child: Tab(icon: Assets.images.dashboard.circulationFan3x.image(width: 64.sp), text: S.of(context).dash_fan)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DimSilderView(label: "${S.of(context).speed}1", value: fanState1?.workLevel.toDouble() ?? 0, max: 10, divisions: 10, unit: ""),
              DimSilderView(label: "${S.of(context).speed}2", value: fanState2?.workLevel.toDouble() ?? 0, max: 10, divisions: 10, unit: ""),
              // Text("${S.of(context).run_countdown_timer}1: ${DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(fanState1?.countDown)) ?? '--'}",
              //     style: Theme.of(context).textTheme.bodyMedium),
              // Text("${S.of(context).run_countdown_timer}2: ${DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(fanState2?.countDown)) ?? '--'}",
              //     style: Theme.of(context).textTheme.bodyMedium),

              if (runningState?.runMode == 0) ...[
                BrnRichInfoGrid(
                  space: 10.sp,
                  themeData: BrunoThemeConfig.lightBrnTheme().pairRichInfoGridConfig,
                  padding: EdgeInsets.only(top: 2.sp, bottom: 10.sp),
                  pairInfoList: <BrnRichGridInfo>[
                    BrnRichGridInfo("${S.of(context).onTime}: ", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(sensorV5Data?.manModeParam?.fanOnTime)),),
                    BrnRichGridInfo("${S.of(context).offTime}: ", DateFormater.formatTimeNoSecond(DateTimeUtil.convertTime(sensorV5Data?.manModeParam?.fanOffTime))),
                  ],
                )
              ]
              else if(autoDesText != null && autoDesText.isNotEmpty) ...[
                Text(autoDesText, style: Theme.of(context).textTheme.bodyMedium),
              ]
            ],
          ))
        ]));
  }

  Widget _buildSceneCards() {
    SensorV5Data? sensorV5Data = widget.room.sensorV5Data;
    LightRunningState? runningState = widget.room.sensorV5Data?.lightRunningState;
    return Container(
        padding: EdgeInsets.only(left: 12.sp, right: 12.sp),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildSceneCard(
              S.of(context).sceneSetting_settingType_enum(SettingType.SEEDING),
              Assets.images.dashboard.seedling3x.image(), sensorV5Data?.seedingParam,
              SettingType.SEEDING,
              runningState?.runMode == 1 ? true : false,
          ),
          _buildSceneCard(
              S.of(context).sceneSetting_settingType_enum(SettingType.VEGETATIVE),
              Assets.images.dashboard.vegetative3x.image(), sensorV5Data?.vegetativeParam,
              SettingType.VEGETATIVE,
              runningState?.runMode == 1 ? true : false,
          ),
          _buildSceneCard(
              S.of(context).sceneSetting_settingType_enum(SettingType.FLOWERING),
              Assets.images.dashboard.flowering3x.image(),
              sensorV5Data?.floweringParam, SettingType.FLOWERING,
              runningState?.runMode == 1 ? true : false,
          )
        ])
    );
  }

  Widget _buildSceneCard(String name, Widget image, SceneSetting? sceneSetting, SettingType settingType, bool auto) {
    Widget container = Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.sp))),
        margin: EdgeInsets.all(12.sp),
        child: InkWell(
          onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScenesPage(room: widget.room)));
            if (sceneSetting != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SceneSettingDetailPage(deviceId: widget.room.deviceId!, setting: sceneSetting, settingType: settingType)));
            } else {
              DialogAlert.confirm(context, onOk: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SceneForm(roomId: widget.room.roomId))).then((value) {
                  if (value != null) {
                    reloadRoomProfile();
                  }
                });
              }, title: S.of(context).unsetting_scene);
            }
          },
          child: BrnIconButton(
              name: name,
              style: Theme.of(context).textTheme.labelSmall,
              direction: Direction.bottom,
              padding: 4.sp,
              iconHeight: 64.sp,
              iconWidth: 64.sp,
              iconWidget: image,
          )
        ),
    );


    if (sceneSetting != null && auto) {
      container = Stack(children: [
        Positioned(left: 0, top: 0, bottom: 0, right: 0, child: container),
        Positioned(
          right: 10.sp,
          top: 12.sp,
          child: BrnStateTag(
              tagText: sceneSetting.schEnable == 1 ? S.of(context).running : S.of(context).disabled,
              tagState: sceneSetting.schEnable == 1 ? TagState.running : TagState.invalidate
          ),
        )
      ]);
    }
    return SizedBox(width: (MediaQuery.of(context).size.width - 24.sp) / 3, height: 200.sp, child: container);
  }
}

/**
 * RoomDashBoard 数据逻辑
 **/
mixin _RoomDashBoardMixin<T extends StatefulWidget> on State<T> {}
