import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import '../../farm/entity/Room.dart';
import './ModeItem.dart';
// region 前端扩展导入包
// endregion

part 'Mode.g.dart';
    /// 模式(Mode)实体类
@JsonSerializable()
class Mode extends AuditingEntity {
   Mode({
       this.modeId = 0,
       this.modeName,
       this.tenantId,
       this.room,
       this.modeItems,
   }){}
    /// MODE_ID
    int modeId;
    /// 模式名称
    String? modeName;
    /// 农场
    String? tenantId;
    Room? room;
    List<ModeItem>? modeItems;
   factory Mode.fromJson(Map<String, dynamic> json) => _$ModeFromJson(json);
   Map<String, dynamic> toJson() => _$ModeToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
