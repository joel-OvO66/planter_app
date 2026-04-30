// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuditingEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditingEntity _$AuditingEntityFromJson(Map<String, dynamic> json) =>
    AuditingEntity()
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$AuditingEntityToJson(AuditingEntity instance) =>
    <String, dynamic>{
      'createTime': DateFormater.dateTimeToJson(instance.createTime),
      'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
      'updateBy': instance.updateBy,
      'createBy': instance.createBy,
    };
