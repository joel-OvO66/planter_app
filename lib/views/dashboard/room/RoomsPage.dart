import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/entity/farm/entity/Room.dart';
import 'package:planter_app/views/dashboard/room/RoomEditForm.dart';
import 'package:planter_app/views/dashboard/room/RoomForm.dart';

import '../../../api/RoomController.dart';
import '../../../entity/farm/domain/RoomProfile.dart';
import '../../../generated/l10n.dart';
import '../../../ui/DialogAlert.dart';
import '../../../ui/SlidableItem.dart';
import '../../../ui/list/ListTileItem.dart';
import '../../MainPage.dart';

/**
 * RoomsPage 主类
 **/
class RoomsPage extends StatefulWidget {
  final List<RoomProfile> rooms;

  const RoomsPage({Key? key, required this.rooms}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

/**
 * RoomsPage UI布局
 **/
class _RoomsPageState extends State<RoomsPage> {
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
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).room_manage)),
        body: Container(
          padding: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 12.sp),
          child: ListView.separated(
            itemCount: widget.rooms.length,
            itemBuilder: (context, index) {
              RoomProfile room = widget.rooms[index];
              return SlidableItem(
                  showEdit: false,
                  editOnTap: () {
                    Room oldRoom = Room()
                      ..roomId = room.roomId
                      ..roomName = room.roomName
                      ..deviceId = room.deviceId
                      ..remark = room.remark;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoomForm(room: oldRoom))).then((value) {
                      if (value != null) {
                        setState(() {
                          room.roomName = value.roomName;
                          room.deviceId = value.deviceId;
                          room.remark = value.remark;
                        });
                      }
                    });
                  },
                  deleteOnTap: () {
                    DialogAlert.removeConfirm(context, () {
                      RoomController.removeRoomById(room.roomId).then((value) {
                        Fluttertoast.showToast(msg: S.of(context).removeSuccess);
                        setState(() {
                          widget.rooms.removeWhere((element) => element.roomId == room.roomId);
                        });
                      }).onError((error, stackTrace) => null);
                    });
                  },
                  child: ListTileItem(
                      leading: Icon(Ionicons.aperture_outline, color: Theme.of(context).primaryColorLight),
                      horizontalTitleGap: 24.sp,
                      title: room.roomName!,
                      subtitle: room.remark,
                      trailing: Icon(Icons.arrow_forward_ios, size: 24.sp),
                      onTap: () {
                        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(roomId: room.roomId)), (route) => route == null);
                        // Room oldRoom = Room()
                        //   ..roomId = room.roomId
                        //   ..roomName = room.roomName
                        //   ..deviceId = room.deviceId
                        //   ..remark = room.remark;
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoomEditForm(room: oldRoom))).then((value) {
                        //
                        // });

                        Room oldRoom = Room()
                          ..roomId = room.roomId
                          ..roomName = room.roomName
                          ..deviceId = room.deviceId
                          ..remark = room.remark;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoomEditForm(room: oldRoom, bCreate: false,))).then((value) {
                          if (value != null) {
                            setState(() {
                              room.roomName = value.roomName;
                              room.deviceId = value.deviceId;
                              room.remark = value.remark;
                            });
                          }
                        });
                      },
                  )
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 24.sp);
            },
          ),
        ));
  }
}
