import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'TempState.g.dart';
@JsonSerializable()
class TempState {
   TempState({
       this.enabled = false,
       this.tempValue = 0,
       this.humidValue = 0,
       this.vpdValue = 0,
   }){}
    bool enabled;
    double tempValue;
    double humidValue;
    double vpdValue;
   factory TempState.fromJson(Map<String, dynamic> json) => _$TempStateFromJson(json);
   Map<String, dynamic> toJson() => _$TempStateToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
