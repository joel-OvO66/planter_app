// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProcessDefinitionInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessDefinitionInfo _$ProcessDefinitionInfoFromJson(
        Map<String, dynamic> json) =>
    ProcessDefinitionInfo()
      ..id = json['id'] as String?
      ..category = json['category'] as String?
      ..name = json['name'] as String?
      ..key = json['key'] as String?
      ..description = json['description'] as String?
      ..version = (json['version'] as num?)?.toInt()
      ..deploymentId = json['deploymentId'] as String?
      ..resourceName = json['resourceName'] as String?
      ..diagramResourceName = json['diagramResourceName'] as String?
      ..hasStartFormKey = json['hasStartFormKey'] as bool?
      ..graphicalNotation = json['graphicalNotation'] as bool?
      ..suspended = json['suspended'] as bool?
      ..tenantId = json['tenantId'] as String?
      ..engineVersion = json['engineVersion'] as String?;

Map<String, dynamic> _$ProcessDefinitionInfoToJson(
        ProcessDefinitionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'key': instance.key,
      'description': instance.description,
      'version': instance.version,
      'deploymentId': instance.deploymentId,
      'resourceName': instance.resourceName,
      'diagramResourceName': instance.diagramResourceName,
      'hasStartFormKey': instance.hasStartFormKey,
      'graphicalNotation': instance.graphicalNotation,
      'suspended': instance.suspended,
      'tenantId': instance.tenantId,
      'engineVersion': instance.engineVersion,
    };
