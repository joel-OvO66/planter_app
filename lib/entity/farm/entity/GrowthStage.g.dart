// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GrowthStage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowthStage _$GrowthStageFromJson(Map<String, dynamic> json) =>
    GrowthStage(
        stageId: (json['stageId'] as num?)?.toInt() ?? 0,
        plant: json['plant'] == null
            ? null
            : Plant.fromJson(json['plant'] as Map<String, dynamic>),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$GrowthStageToJson(GrowthStage instance) =>
    <String, dynamic>{
      'createTime': DateFormater.dateTimeToJson(instance.createTime),
      'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
      'updateBy': instance.updateBy,
      'createBy': instance.createBy,
      'stageId': instance.stageId,
      'plant': instance.plant,
    };
