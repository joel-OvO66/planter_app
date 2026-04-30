import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'FanState.g.dart';
@JsonSerializable()
class FanState {
   FanState({
       this.enabled = false,
       this.workLevel = 0,
       this.countDown = 0,
   }){}
    /// 设备使能
    bool enabled;
    /// 风力档位
    int workLevel;
    /// 运行倒计时
    int countDown;
   factory FanState.fromJson(Map<String, dynamic> json) => _$FanStateFromJson(json);
   Map<String, dynamic> toJson() => _$FanStateToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
