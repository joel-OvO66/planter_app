// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuditingTimeEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditingTimeEntity _$AuditingTimeEntityFromJson(Map<String, dynamic> json) =>
    AuditingTimeEntity()
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?);

Map<String, dynamic> _$AuditingTimeEntityToJson(AuditingTimeEntity instance) =>
    <String, dynamic>{
      'createTime': DateFormater.dateTimeToJson(instance.createTime),
      'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
    };
