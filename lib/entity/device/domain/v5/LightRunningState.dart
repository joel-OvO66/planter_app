import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'LightRunningState.g.dart';
@JsonSerializable()
class LightRunningState {
   LightRunningState({
       this.runMode = 0,
       this.dim1Per = 0,
       this.dim2Per = 0,
       this.dim3Per = 0,
       this.schStartTime = 0,
       this.schEndTime = 0,
       this.autoScene = 0,
   }){}
    /// 1自动， 0手动
    int runMode;
    /// 调光值 0-100
    int dim1Per;
    /// 调光值 0-100
    int dim2Per;
    /// 调光值 0-100
    int dim3Per;
    /// 开始开灯时间 0*60-23*60+59
    int schStartTime;
    /// 开始开灯时间 0*60-23*60+59
    int schEndTime;
    /// 当前运行的种植期,1表示苗期,2表示生长期，3表示花期, 手动模式下为0
    int autoScene;
   factory LightRunningState.fromJson(Map<String, dynamic> json) => _$LightRunningStateFromJson(json);
   Map<String, dynamic> toJson() => _$LightRunningStateToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
