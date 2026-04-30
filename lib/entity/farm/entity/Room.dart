import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './Plant.dart';
// region 前端扩展导入包
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../gen/assets.gen.dart';
import 'Farm.dart';
import 'Plant.dart';
// endregion

part 'Room.g.dart';
@JsonSerializable()
class Room extends AuditingEntity {
   Room({
       this.roomId = 0,
       this.roomName,
       this.deviceId,
       this.tenantId,
       this.remark,
       this.plants,
       this.roomState,
   }){}
    int roomId;
    /// 房间名称
    String? roomName;
    /// 设备ID
    String? deviceId;
    /// 农场
    String? tenantId;
    /// 备注
    String? remark;
    /// 房间下种的植物
    List<Plant>? plants;
    /// 房间状态
    RoomState? roomState;
   factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
   Map<String, dynamic> toJson() => _$RoomToJson(this);

    // region 前端扩展定义属性及方法区
@override
  bool operator ==(Object other) => identical(this, other) || other is Room && runtimeType == other.runtimeType && roomId == other.roomId;

  @override
  int get hashCode => roomId.hashCode;
    // endregion
}

    /// 房间状态
enum RoomState {
    /// 正常
   NORMAL,
    /// 报警
   ALARM,
    /// 操作中
   OPERATING
}

    // region 前端扩展代码区
extension RoomStateExtension on RoomState {
  Color color() {
    switch (this) {
      case RoomState.NORMAL:
        return Colors.white70;
      case RoomState.ALARM:
        return const Color.fromRGBO(242, 91, 65, 0.2);
      case RoomState.OPERATING:
        return const Color.fromRGBO(245, 181, 21, 0.2);
    }
  }

  Widget icon() {
    switch (this) {
      case RoomState.NORMAL:
        return SizedBox(height: 48.sp);
      case RoomState.ALARM:
        return Assets.images.homeWarning.image(width: 48.sp);
      case RoomState.OPERATING:
        return Assets.images.homeOperating.image(width: 48.sp);
    }
  }
}
    // endregion
