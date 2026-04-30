import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:planter_app/api/IotController.dart';
import 'package:planter_app/api/RoomController.dart';
import 'package:planter_app/common/FarmService.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:date_format/date_format.dart';

class RoomService with ChangeNotifier {
  late Timer? timer ;
  RoomProfile? room;

  DateTime lastSyncTime = DateTime.now();

  RoomService() {
    timer = Timer.periodic(const Duration(seconds: 5),  (timer) async {
      getRoomProfile();
    });
  }

  void reloadRoom(RoomProfile? room) {
    this.room = room;
    getRoomProfile();
  }

  void getRoomProfile() async {
    if (room != null) {
      await RoomController.getRoomProfileById(room!.roomId).ifNotNull((value) {
        room?.sensorV5Data = value.sensorV5Data;
        notifyListeners();
      });
    } else {
      debugPrint("########### room null");
    }
  }

  void syncDeviceDateTime(bool enable) async {
    if (enable == true && room != null && room!.deviceId != null && DateTime.now().difference(lastSyncTime) > const Duration(minutes: 1)) {
      // 获取当前时间
      DateTime now = DateTime.now();
      var sysDate =  formatDate(now, [yyyy, '/', mm, '/', dd]);
      var sysTime = now.hour * 60 * 60 + now.minute * 60;
      lastSyncTime = now;

      Map<String, dynamic> properties = HashMap();
      properties["sysDate"] = sysDate;
      properties["sysTime"] = sysTime;
      await IotController.setProperties(room!.deviceId!, {"globalParam": properties});
    }
  }
}
