import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/api/RoomController.dart';
import 'package:planter_app/common/AuthService.dart';
import 'package:planter_app/common/RoomService.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/views/dashboard/device/DeviceScanPage.dart';
import 'package:planter_app/views/dashboard/room/RoomDashBoard.dart';
import 'package:planter_app/views/dashboard/room/RoomEditForm.dart';
import 'package:planter_app/views/dashboard/room/RoomsPage.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';

import '../../api/SecurityController.dart';
import '../../common/FarmService.dart';
import '../../entity/farm/domain/RoomProfile.dart';
import '../../entity/farm/entity/Farm.dart';
import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../../style/AppTheme.dart';
import '../setting/FarmForm.dart';
import '../setting/FarmsPage.dart';
import 'room/RoomForm.dart';

class DashboardPage extends StatefulWidget {
  ///默认显示的room
  final int? roomId;

  const DashboardPage({Key? key, this.roomId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  bool bInit = false;
  // 未读消息数量
  int noticeNum = 0;

  Farm? currentFarm;

  List<RoomProfile> rooms = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: rooms.isNotEmpty ? 1 : 0, length: rooms.length, vsync: this);
    _initFarmRoom();
  }

  Future<void> _initFarmRoom() async {
    FarmService farmService = Provider.of<FarmService>(context, listen: false);
    AuthService authService = Provider.of<AuthService>(context, listen: false);

    await farmService.reloadFarms();
    currentFarm = farmService.currentFarm;
    if (currentFarm != null) {
      await SecurityController.changeFarm(currentFarm!.tenantId.toString()).then((value) {
        authService.setToken(value);
      });
    }
    bInit = true;
    _reloadRooms();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentFarm = context.watch<FarmService>().currentFarm;
    return Scaffold(
        appBar: AppBar(
            title: Visibility(
              visible: currentFarm != null,
              child: GestureDetector(
                onTap: changeFarm,
                child: Column(children: [
                  Container(margin: EdgeInsets.only(top: 0, bottom: 0.sp, left: 0, right: 0), child: Row(children: _buildCurrentFarm()))
                  // , WeatherWidget()
                ]),
              ),
            ),
            actions: [
              // IconButton(
              //   padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0),
              //   icon: Assets.images.homeAlarmMessage.image(width: 48.sp),
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmsPage()));
              //   },
              // ),
              PopupMenuButton<String>(
                  offset: const Offset(0, 10),
                  onSelected: (value) {
                    switch (value) {
                      case "Sweep":
                        navigateRoomForm();
                        break;
                      case "Manually":
                        navigateRoomForm();
                        break;
                      case "Management":
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RoomsPage(rooms: rooms)));
                        break;
                      case "Network":
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DeviceScanPage()));
                        break;
                    }
                  },
                  itemBuilder: (context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Sweep',
                        child: Row(children: [const Icon(Ionicons.scan, color: Colors.black38), SizedBox(width: 20.sp), Text(S.of(context).create_room_scan)]),
                      ),
                      // PopupMenuItem<String>(value: 'Manually', child: Row(children: [Icon(Ionicons.hand_left), SizedBox(width: 10.sp), Text(S.of(context).create_room_manual)])),
                      const PopupMenuDivider(),
                      PopupMenuItem<String>(
                          value: 'Management',
                          child: Row(children: [const Icon(Ionicons.list_circle_outline, color: Colors.black38), SizedBox(width: 20.sp), Text(S.of(context).room_manage)]),
                      ),

                      const PopupMenuDivider(),
                      PopupMenuItem<String>(
                        value: 'Network',
                        child: Row(children: [const Icon(Icons.contactless_outlined, color: Colors.black38), SizedBox(width: 20.sp), Text(S.of(context).network_configure)]),
                      ),
                    ];
                  },
                  child: Container(padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 10), child: Assets.images.homePlus.image(width: 48.sp)))
            ],
            bottom: (rooms.length > 1)
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(36),
                    child: TabBar(
                      tabs: rooms.map((f) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 4.sp),
                          child: Text(f.roomName!),
                        );
                      }).toList(),
                      indicatorWeight: 3,
                      isScrollable: true,
                      indicatorColor: AppTheme.colorPrimary,
                      labelColor: Colors.white,
                      unselectedLabelColor: Color.fromRGBO(255, 255, 255, 0.65),
                      controller: _tabController,
                    ))
                : null),
        body: _buildRooms());
  }

  Widget _buildRooms() {
    if(!bInit) {
      return Container();
    }
    else if(currentFarm == null) {
      reloadRoomToRoomService(context, null);
      return buildEmptyFarms();
    }
    else if (rooms.isEmpty) {
      reloadRoomToRoomService(context, null);
      return buildEmptyRooms();
    } else if (rooms.length == 1) {
      reloadRoomToRoomService(context, rooms[0]);
      return RoomDashBoard(room: rooms[0]);
    } else {
      return TabBarView(
          controller: _tabController,
          children: rooms.map((room) {
            return RoomDashBoard(room: room);
          }).toList());
    }
  }

  Widget buildEmptyRooms() {
    return Column(
      children: [
        Container(
          height: 170.sp,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 300.sp, bottom: 35.sp),
          //child: Assets.images.farmSetting.farmlistEmpty.image(width: double.infinity),
        ),
        Text(S.of(context).no_rooms, style: TextStyle(color: Colors.black87, fontSize: 21.sp)),
        SizedBox(height: 20.sp),
        TextButton.icon(
          onPressed: () {
            navigateRoomForm();
          },
          label: Text(S.of(context).create_room, style: TextStyle(color: Colors.white, fontSize: 14.0)),
          icon: Assets.images.homePlus.image(width: 28.sp),
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppTheme.primary),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
              )),
              minimumSize: WidgetStateProperty.all(const Size(130, 40))),
        ),
      ],
    );
  }

  void navigateRoomForm() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomEditForm(bCreate: true,))).then((value) {
      if (value != null) {
        _reloadRooms();
      }
    });
  }

  Widget buildEmptyFarms() {
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    FarmService farmService = Provider.of<FarmService>(context, listen: false);
    context.read<FarmService>();

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 24.sp, right: 24.0.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(48.sp), topRight: Radius.circular(48.sp)),
          image: const DecorationImage(image: AssetImage('assets/images/home_bg2.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              height: 170.sp,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 300.sp, bottom: 35.sp),
              //child: Assets.images.farmSetting.farmlistEmpty.image(width: double.infinity),
            ),
            Text(S.of(context).farms_list_empty_tip_add, style: TextStyle(color: Colors.black87, fontSize: 21.sp)),
            SizedBox(height: 20.sp),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FarmForm(bCreate: true,))).then((farm) {
                  if (farm != null) {
                    SecurityController.changeFarm(farm!.tenantId.toString()).then((value) {
                      authService.setToken(value);
                      farmService.setCurrentFarm(farm.tenantId);
                      _reloadRooms();
                    });
                  }
                });
              },
              label: Text(S.of(context).create_farm, style: const TextStyle(color: Colors.white, fontSize: 14.0)),
              icon: Assets.images.homePlus.image(width: 28.sp),
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppTheme.primary),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                  minimumSize: WidgetStateProperty.all(const Size(130, 40))),
            ),
          ],
        ));
  }

  List<Widget> _buildCurrentFarm() {
    Farm? currentMember = context.select<FarmService, Farm?>((FarmService pp) => pp.currentFarm);
    if (currentMember != null) {
      String factoryName = currentMember.tenantName!;
      return [
        Text(factoryName, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppTheme.textColorWhite, fontWeight: FontWeight.w600)),
        Assets.images.homeArrowDownWhite.image(width: 42.sp)
      ];
    } else {
      return [
        Text(S.of(context).create_farm, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppTheme.placeholderColor, fontWeight: FontWeight.w600)),
        Assets.images.arrowRightWhite.image(width: 42.sp)
      ];
    }
  }

  void changeFarm() {
    List<Farm> farms = context.read<FarmService>().farms;
    FarmService farmService = Provider.of<FarmService>(context, listen: false);
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    context.read<FarmService>();
    if (farms.isEmpty) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmForm(bCreate: true,)));
      });
      return;
    }
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      clipBehavior: Clip.antiAlias, // 新增clipBehavior参数
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Column(children: [
              ...farms
              .map((farm) => ListTile(
                    title: Text(farm.tenantName!, style: Theme.of(context).textTheme.labelMedium),
                    selected: currentFarm!.tenantId == farm.tenantId,
                    selectedTileColor: Colors.grey[200],
                    onTap: () {
                      if (currentFarm!.tenantId != farm.tenantId) {
                        SecurityController.changeFarm(farm.tenantId.toString()).then((value) {
                          authService.setToken(value);
                          farmService.setCurrentFarm(farm.tenantId);
                          _reloadRooms();
                        });
                      }
                      Navigator.of(context).pop();
                    },
                  ))
              .toList(),
          AppTheme.dividerFull,
          InkWell(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmsPage())).then((value) {
                    if (currentFarm != null) {
                      SecurityController.changeFarm(currentFarm!.tenantId.toString()).then((value) {
                        authService.setToken(value);
                        _reloadRooms();
                      });
                    } else {
                      _reloadRooms(showLoading: false);
                    }
                  });
                });
              },
              child: ListTile(
                  contentPadding: EdgeInsets.only(right: 48.sp, left: 24.sp),
                  title: Text(S.of(context).farm_management, style: Theme.of(context).textTheme.labelMedium),
                  trailing: Assets.images.farmSetting.settingsLine.image(width: 40.sp, height: 40.sp)))
        ]));
      },
    );
  }

  void _reloadRooms({bool showLoading = true}) {
    if (showLoading) {
      EasyLoading.show();
    }
    if (currentFarm == null) {
      rooms = [];
      reloadRoomToRoomService(context, null);
      _tabController = TabController(initialIndex: 0, length: rooms.length, vsync: this);
      if(showLoading) EasyLoading.dismiss();
      return;
    }

    RoomController.getAllRoomProfiles().ifNotNull((value) {
      setState(() {
        rooms = value;
        if (rooms.isNotEmpty) {
          _tabController = TabController(initialIndex: 0, length: rooms.length, vsync: this);
          int index = 0;
          if (widget.roomId != null) {
            for (var i = 0; i < rooms.length; i++) {
              if (rooms[i].roomId == widget.roomId) {
                index = i;
                break;
              }
            }
          }
          reloadRoomToRoomService(context, rooms[index]);
          _tabController.animateTo(index);

          _tabController.addListener((){
            if(_tabController.indexIsChanging) {
              final index = _tabController.index;
              reloadRoomToRoomService(context, rooms[index]);
            }
          });
        }
      });
    }).whenComplete(() {
      if (showLoading) EasyLoading.dismiss();
      if(rooms.isEmpty) {
        reloadRoomToRoomService(context, null);
      }
    });
  }

  void reloadRoomToRoomService(BuildContext context, RoomProfile? room) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    Provider.of<RoomService>(context, listen: false).reloadRoom(room);
    if (room != null) {
      Provider.of<RoomService>(context, listen: false).syncDeviceDateTime(settingProvider.autoSyncDevTime);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
