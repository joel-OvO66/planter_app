import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'ManModeParam.g.dart';
@JsonSerializable()
class ManModeParam {
   ManModeParam({
       this.dim1Per = 0,
       this.dim2Per = 0,
       this.dim3Per = 0,
       this.schEnable = 0,
       this.schStartTime = 0,
       this.schEndTime = 0,
       this.schStartDate,
       this.schEndDate,
       this.ventOnTime = 0,
       this.ventOffTime = 0,
       this.ventLevel = 0,
       this.fanOnTime = 0,
       this.fanOffTime = 0,
       this.fanLevel = 0,
   }){}
    int dim1Per;
    int dim2Per;
    int dim3Per;
    int schEnable;
    int schStartTime;
    int schEndTime;
    String? schStartDate;
    String? schEndDate;
    int ventOnTime;
    int ventOffTime;
    int ventLevel;
    int fanOnTime;
    int fanOffTime;
    int fanLevel;
   factory ManModeParam.fromJson(Map<String, dynamic> json) => _$ManModeParamFromJson(json);
   Map<String, dynamic> toJson() => _$ManModeParamToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
