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

part 'PlantCategory.g.dart';
    /// *
@JsonSerializable()
class PlantCategory extends AuditingEntity {
   PlantCategory({
       this.categoryId = 0,
       this.categoryName,
       this.remark,
       this.tenantId,
       this.plants,
   }){}
    /// 植物类别ID
    int categoryId;
    /// 类别名称
    String? categoryName;
    /// 备注
    String? remark;
    /// 农场
    String? tenantId;
    List<Plant>? plants;
   factory PlantCategory.fromJson(Map<String, dynamic> json) => _$PlantCategoryFromJson(json);
   Map<String, dynamic> toJson() => _$PlantCategoryToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
