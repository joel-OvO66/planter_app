import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import '../../device/domain/v5/SensorV5Data.dart';
import '../../device/domain/SensorData.dart';
// region 前端扩展导入包
import '../entity/Room.dart';
// endregion

part 'RoomProfile.g.dart';
@JsonSerializable()
class RoomProfile {
   RoomProfile({
       this.roomId = 0,
       this.roomName,
       this.deviceId,
       this.remark,
       this.roomState,
       this.sensorData,
       this.sceneMode,
       this.currentSceneIndex = 0,
       this.sensorV5Data,
   }){}
    int roomId;
    /// 房间名称
    String? roomName;
    String? deviceId;
    String? remark;
    /// 房间状态
    RoomState? roomState;
    /// 环境传感器数据
    SensorData? sensorData;
    /// 场景模式
    String? sceneMode;
    /// 当前场景
    int currentSceneIndex;
    /// 以下是5寸屏的数据
    SensorV5Data? sensorV5Data;
   factory RoomProfile.fromJson(Map<String, dynamic> json) => _$RoomProfileFromJson(json);
   Map<String, dynamic> toJson() => _$RoomProfileToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
