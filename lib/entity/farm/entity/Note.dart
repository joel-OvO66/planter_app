import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './Plant.dart';
// region 前端扩展导入包
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
// endregion

part 'Note.g.dart';

/// 笔记(Note)实体类
@JsonSerializable()
class Note extends AuditingTimeEntity {
  Note({
    this.noteId = 0,
    this.plant,
    this.noteContent,
    this.noteTime,
    this.attachments,
    this.waterVolume = 0,
    this.lightSchedule = 0,
    this.height = 0,
    this.distance = 0,
    this.potSize = 0,
    this.minTemp = 0,
    this.maxTemp = 0,
    this.minHumi = 0,
    this.maxHumi = 0,
    this.co2Level = 0,
    this.ph = 0,
    this.noteType,
  }) {}

  /// 笔记_ID
  int noteId;
  Plant? plant;

  /// 笔记名称
  String? noteContent;

  /// 笔记时间
  @JsonKey(toJson: DateFormater.dateTimeNoSecondToJson, fromJson: DateFormater.jsonToDateTimeNoSecond)
  DateTime? noteTime;

  /// 附件
  List<FileInfo>? attachments;

  /// 浇水量
  double waterVolume;

  /// 日照时长
  int lightSchedule;

  /// 高度
  double height;

  /// 间距
  double distance;

  /// 尺寸
  double potSize;

  /// 最小温度
  double minTemp;

  /// 最大温度
  double maxTemp;

  /// 最小湿度
  int minHumi;

  /// 最大湿度
  int maxHumi;

  /// CO2
  int co2Level;

  /// PH
  double ph;

  /// 笔记类型
  NoteType? noteType;
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  // region 前端扩展定义属性及方法区
  // endregion
}

enum NoteType {
  /// 浇水
  WATERING,

  /// 施肥
  NUTRIENTS,

  /// 虫害防治
  PEST_CONTROL,

  /// 修剪
  TRIM,

  /// 光照
  LIGHT_SCHEDULE,

  /// 高度
  HEIGHT,

  /// 间距
  LAMP_TO_PLANT_DISTANCE,

  /// 尺寸
  POT_SIZE,

  /// 环境
  TEMPERATURE_HUMIDITY,

  /// CO2
  CO2,

  /// 培训
  TRANING,

  /// 根PH值
  ROOT_PH,

  /// 其他
  OTHER
}

// region 前端扩展代码区
extension NoteTypeExtension on NoteType {
  IconData iconData() {
    switch (this) {
      case NoteType.WATERING:
        return Icons.water_drop_outlined;
      case NoteType.NUTRIENTS:
        return Icons.no_accounts;
      case NoteType.PEST_CONTROL:
        return Icons.pets_outlined;
      case NoteType.TRIM:
        return Ionicons.cut;
      case NoteType.LIGHT_SCHEDULE:
        return Icons.light;
      case NoteType.HEIGHT:
        return Icons.height;
      case NoteType.LAMP_TO_PLANT_DISTANCE:
        return Icons.social_distance_outlined;
      case NoteType.POT_SIZE:
        return Icons.photo_size_select_small_outlined;
      case NoteType.TEMPERATURE_HUMIDITY:
        return Icons.severe_cold_outlined;
      case NoteType.CO2:
        return Icons.co2_outlined;
      case NoteType.TRANING:
        return Icons.train_outlined;
      case NoteType.ROOT_PH:
        return Icons.room_preferences_outlined;
      case NoteType.OTHER:
        return Icons.comment_outlined;
    }
  }
}
// endregion
