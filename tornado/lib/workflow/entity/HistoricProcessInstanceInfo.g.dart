// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoricProcessInstanceInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricProcessInstanceInfo _$HistoricProcessInstanceInfoFromJson(
        Map<String, dynamic> json) =>
    HistoricProcessInstanceInfo()
      ..id = json['id'] as String?
      ..businessKey = json['businessKey'] as String?
      ..processDefinitionId = json['processDefinitionId'] as String?
      ..processDefinitionName = json['processDefinitionName'] as String?
      ..processDefinitionKey = json['processDefinitionKey'] as String?
      ..processDefinitionVersion =
          (json['processDefinitionVersion'] as num?)?.toInt()
      ..deploymentId = json['deploymentId'] as String?
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String)
      ..endTime = json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String)
      ..durationInMillis = (json['durationInMillis'] as num?)?.toInt()
      ..endActivityId = json['endActivityId'] as String?
      ..startUserId = json['startUserId'] as String?
      ..startActivityId = json['startActivityId'] as String?
      ..deleteReason = json['deleteReason'] as String?
      ..superProcessInstanceId = json['superProcessInstanceId'] as String?
      ..tenantId = json['tenantId'] as String?
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..processInstanceId = json['processInstanceId'] as String?
      ..processVariables =
          (json['processVariables'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      )
      ..data = json['data'];

Map<String, dynamic> _$HistoricProcessInstanceInfoToJson(
        HistoricProcessInstanceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessKey': instance.businessKey,
      'processDefinitionId': instance.processDefinitionId,
      'processDefinitionName': instance.processDefinitionName,
      'processDefinitionKey': instance.processDefinitionKey,
      'processDefinitionVersion': instance.processDefinitionVersion,
      'deploymentId': instance.deploymentId,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'durationInMillis': instance.durationInMillis,
      'endActivityId': instance.endActivityId,
      'startUserId': instance.startUserId,
      'startActivityId': instance.startActivityId,
      'deleteReason': instance.deleteReason,
      'superProcessInstanceId': instance.superProcessInstanceId,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'description': instance.description,
      'processInstanceId': instance.processInstanceId,
      'processVariables': instance.processVariables,
      'data': instance.data,
    };
