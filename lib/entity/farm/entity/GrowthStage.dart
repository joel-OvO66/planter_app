import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './Plant.dart';
// region 前端扩展导入包
// endregion

part 'GrowthStage.g.dart';
    /// 生产阶段—生长模板
@JsonSerializable()
class GrowthStage extends AuditingEntity {
   GrowthStage({
       this.stageId = 0,
       this.plant,
   }){}
    int stageId;
    Plant? plant;
   factory GrowthStage.fromJson(Map<String, dynamic> json) => _$GrowthStageFromJson(json);
   Map<String, dynamic> toJson() => _$GrowthStageToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
