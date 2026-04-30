// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeploymentInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeploymentInfo _$DeploymentInfoFromJson(Map<String, dynamic> json) =>
    DeploymentInfo()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..deploymentTime = json['deploymentTime'] == null
          ? null
          : DateTime.parse(json['deploymentTime'] as String)
      ..category = json['category'] as String?
      ..key = json['key'] as String?
      ..tenantId = json['tenantId'] as String?
      ..processDefinitionInfos = (json['processDefinitionInfos']
              as List<dynamic>?)
          ?.map(
              (e) => ProcessDefinitionInfo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DeploymentInfoToJson(DeploymentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'deploymentTime': instance.deploymentTime?.toIso8601String(),
      'category': instance.category,
      'key': instance.key,
      'tenantId': instance.tenantId,
      'processDefinitionInfos': instance.processDefinitionInfos,
    };
