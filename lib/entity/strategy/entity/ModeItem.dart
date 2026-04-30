import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './Mode.dart';
// region 前端扩展导入包
// endregion

part 'ModeItem.g.dart';
    /// 模式项(ModeItem)实体类
@JsonSerializable()
class ModeItem extends AuditingEntity {
   ModeItem({
       this.itemId = 0,
       this.mode,
       this.itemName,
       this.sortIndex = 0,
   }){}
    /// ITEM_ID
    int itemId;
    Mode? mode;
    String? itemName;
    /// 排序
    int sortIndex;
   factory ModeItem.fromJson(Map<String, dynamic> json) => _$ModeItemFromJson(json);
   Map<String, dynamic> toJson() => _$ModeItemToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
