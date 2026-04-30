import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'PlantNode.g.dart';

@JsonSerializable()
class PlantNode {
  PlantNode({
    this.noteCount = 0,
    this.waterDaysAgo,
    this.nutrientDaysAgo,
    this.pestControlDaysAgo,
    this.trimDaysAgo,
    this.lightSchedule,
    this.height,
    this.distance,
    this.potSize,
    this.minTemp,
    this.maxTemp,
    this.minHumi,
    this.maxHumi,
    this.co2Level,
    this.ph,
  }) {}
  int noteCount;

  /// 浇水量
  int? waterDaysAgo;
  int? nutrientDaysAgo;
  int? pestControlDaysAgo;
  int? trimDaysAgo;

  /// 日照时长
  int? lightSchedule;

  /// 高度
  double? height;

  /// 间距
  double? distance;

  /// 尺寸
  double? potSize;

  /// 最小温度
  double? minTemp;

  /// 最大温度
  double? maxTemp;

  /// 最小湿度
  int? minHumi;

  /// 最大湿度
  int? maxHumi;

  /// CO2
  int? co2Level;

  /// PH
  double? ph;
  factory PlantNode.fromJson(Map<String, dynamic> json) => _$PlantNodeFromJson(json);
  Map<String, dynamic> toJson() => _$PlantNodeToJson(this);

  // region 前端扩展定义属性及方法区
  // endregion
}

// region 前端扩展代码区
// endregion
