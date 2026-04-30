import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './GrowthStage.dart';
import './PlantCategory.dart';
import './Room.dart';
import './Note.dart';

// region 前端扩展导入包
// endregion

part 'Plant.g.dart';

@JsonSerializable()
class Plant extends AuditingEntity {
  Plant({
    this.plantId = 0,
    this.plantCategory,
    this.room,
    this.plantName,
    this.tenantId,
    this.remark,
    this.cover,
    this.growthStages,
    this.notes,
  }) {}
  int plantId;
  PlantCategory? plantCategory;

  /// 房间
  Room? room;

  /// 类别名称
  String? plantName;

  /// 农场
  String? tenantId;

  /// 用户头像
  FileInfo? cover;

  /// 备注
  String? remark;
  List<GrowthStage>? growthStages;

  /// PLANT_ID
  List<Note>? notes;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);

  Map<String, dynamic> toJson() => _$PlantToJson(this);

// region 前端扩展定义属性及方法区
// endregion
}

// region 前端扩展代码区
// endregion
