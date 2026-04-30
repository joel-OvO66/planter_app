import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'FanSchedule.g.dart';
@JsonSerializable()
class FanSchedule {
   FanSchedule({
       this.enable = 0,
       this.lowTemp = 0,
       this.highTemp = 0,
       this.workLevel = 0,
       this.workTime = 0,
   }){}
    int enable;
    int lowTemp;
    int highTemp;
    int workLevel;
    int workTime;
   factory FanSchedule.fromJson(Map<String, dynamic> json) => _$FanScheduleFromJson(json);
   Map<String, dynamic> toJson() => _$FanScheduleToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
