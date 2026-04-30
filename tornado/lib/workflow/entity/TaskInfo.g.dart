// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskInfo _$TaskInfoFromJson(Map<String, dynamic> json) => TaskInfo()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..formKey = json['formKey'] as String?
  ..assignee = json['assignee'] as String?
  ..nextAssignee = json['nextAssignee'] as String?
  ..owner = json['owner'] as String?
  ..executionId = json['executionId'] as String?
  ..createTime = json['createTime'] == null
      ? null
      : DateTime.parse(json['createTime'] as String)
  ..end = json['end'] as bool?
  ..category = json['category'] as String?
  ..description = json['description'] as String?
  ..dueDate = json['dueDate'] as String?
  ..parentTaskId = json['parentTaskId'] as String?
  ..suspended = json['suspended'] as bool?
  ..processInstanceId = json['processInstanceId'] as String?
  ..processDefinitionId = json['processDefinitionId'] as String?
  ..taskDefinitionKey = json['taskDefinitionKey'] as String?
  ..tenantId = json['tenantId'] as String?
  ..businessKey = json['businessKey'] as String?
  ..processDefinitionKey = json['processDefinitionKey'] as String?
  ..processDefinitionName = json['processDefinitionName'] as String?
  ..processDefinitionVersion =
      (json['processDefinitionVersion'] as num?)?.toInt()
  ..startUserId = json['startUserId'] as String?
  ..processStartTime = json['processStartTime'] == null
      ? null
      : DateTime.parse(json['processStartTime'] as String)
  ..processInstanceName = json['processInstanceName'] as String?
  ..claimTime = json['claimTime'] == null
      ? null
      : DateTime.parse(json['claimTime'] as String)
  ..data = json['data'];

Map<String, dynamic> _$TaskInfoToJson(TaskInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'formKey': instance.formKey,
      'assignee': instance.assignee,
      'nextAssignee': instance.nextAssignee,
      'owner': instance.owner,
      'executionId': instance.executionId,
      'createTime': instance.createTime?.toIso8601String(),
      'end': instance.end,
      'category': instance.category,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'parentTaskId': instance.parentTaskId,
      'suspended': instance.suspended,
      'processInstanceId': instance.processInstanceId,
      'processDefinitionId': instance.processDefinitionId,
      'taskDefinitionKey': instance.taskDefinitionKey,
      'tenantId': instance.tenantId,
      'businessKey': instance.businessKey,
      'processDefinitionKey': instance.processDefinitionKey,
      'processDefinitionName': instance.processDefinitionName,
      'processDefinitionVersion': instance.processDefinitionVersion,
      'startUserId': instance.startUserId,
      'processStartTime': instance.processStartTime?.toIso8601String(),
      'processInstanceName': instance.processInstanceName,
      'claimTime': instance.claimTime?.toIso8601String(),
      'data': instance.data,
    };
