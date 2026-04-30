// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoricActivityInstanceInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricActivityInstanceInfo _$HistoricActivityInstanceInfoFromJson(
        Map<String, dynamic> json) =>
    HistoricActivityInstanceInfo()
      ..id = json['id'] as String?
      ..activityId = json['activityId'] as String?
      ..activityName = json['activityName'] as String?
      ..activityType = json['activityType'] as String?
      ..processDefinitionId = json['processDefinitionId'] as String?
      ..processInstanceId = json['processInstanceId'] as String?
      ..executionId = json['executionId'] as String?
      ..taskId = json['taskId'] as String?
      ..calledProcessInstanceId = json['calledProcessInstanceId'] as String?
      ..assignee = json['assignee'] as String?
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String)
      ..endTime = json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String)
      ..durationInMillis = (json['durationInMillis'] as num?)?.toInt()
      ..tenantId = json['tenantId'] as String?
      ..condition = json['condition'] as String?
      ..comments = (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HistoricActivityInstanceInfoToJson(
        HistoricActivityInstanceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityId': instance.activityId,
      'activityName': instance.activityName,
      'activityType': instance.activityType,
      'processDefinitionId': instance.processDefinitionId,
      'processInstanceId': instance.processInstanceId,
      'executionId': instance.executionId,
      'taskId': instance.taskId,
      'calledProcessInstanceId': instance.calledProcessInstanceId,
      'assignee': instance.assignee,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'durationInMillis': instance.durationInMillis,
      'tenantId': instance.tenantId,
      'condition': instance.condition,
      'comments': instance.comments,
    };
