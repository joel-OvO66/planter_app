import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'VentSchedule.g.dart';
@JsonSerializable()
class VentSchedule {
   VentSchedule({
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
   factory VentSchedule.fromJson(Map<String, dynamic> json) => _$VentScheduleFromJson(json);
   Map<String, dynamic> toJson() => _$VentScheduleToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
