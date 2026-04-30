// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => ModelInfo()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..key = json['key'] as String?
  ..category = json['category'] as String?
  ..createTime = json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String)
  ..lastUpdateTime = json['lastUpdateTime'] == null
      ? null
      : DateTime.parse(json['lastUpdateTime'] as String)
  ..version = (json['version'] as num?)?.toInt()
  ..metaInfo = json['metaInfo'] as String?
  ..deploymentId = json['deploymentId'] as String?
  ..tenantId = json['tenantId'] as String?
  ..hasEditorSource = json['hasEditorSource'] as bool?
  ..hasEditorSourceExtra = json['hasEditorSourceExtra'] as bool?;

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'category': instance.category,
      'createTime': instance.createTime?.toIso8601String(),
      'lastUpdateTime': instance.lastUpdateTime?.toIso8601String(),
      'version': instance.version,
      'metaInfo': instance.metaInfo,
      'deploymentId': instance.deploymentId,
      'tenantId': instance.tenantId,
      'hasEditorSource': instance.hasEditorSource,
      'hasEditorSourceExtra': instance.hasEditorSourceExtra,
    };
