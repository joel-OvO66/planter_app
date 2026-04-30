// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProcessInstanceInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessInstanceInfo _$ProcessInstanceInfoFromJson(Map<String, dynamic> json) =>
    ProcessInstanceInfo()
      ..processInstanceId = json['processInstanceId'] as String?
      ..processDefinitionId = json['processDefinitionId'] as String?
      ..processDefinitionName = json['processDefinitionName'] as String?
      ..processDefinitionKey = json['processDefinitionKey'] as String?
      ..processDefinitionVersion =
          (json['processDefinitionVersion'] as num?)?.toInt()
      ..deploymentId = json['deploymentId'] as String?
      ..businessKey = json['businessKey'] as String?
      ..suspended = json['suspended'] as bool?
      ..processVariables =
          (json['processVariables'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      )
      ..tenantId = json['tenantId'] as String?
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..localizedName = json['localizedName'] as String?
      ..localizedDescription = json['localizedDescription'] as String?
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String)
      ..startUserId = json['startUserId'] as String?;

Map<String, dynamic> _$ProcessInstanceInfoToJson(
        ProcessInstanceInfo instance) =>
    <String, dynamic>{
      'processInstanceId': instance.processInstanceId,
      'processDefinitionId': instance.processDefinitionId,
      'processDefinitionName': instance.processDefinitionName,
      'processDefinitionKey': instance.processDefinitionKey,
      'processDefinitionVersion': instance.processDefinitionVersion,
      'deploymentId': instance.deploymentId,
      'businessKey': instance.businessKey,
      'suspended': instance.suspended,
      'processVariables': instance.processVariables,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'description': instance.description,
      'localizedName': instance.localizedName,
      'localizedDescription': instance.localizedDescription,
      'startTime': instance.startTime?.toIso8601String(),
      'startUserId': instance.startUserId,
    };
