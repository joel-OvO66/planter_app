// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskForm _$TaskFormFromJson(Map<String, dynamic> json) => TaskForm()
  ..taskId = json['taskId'] as String?
  ..assignee = json['assignee'] as String?
  ..condition = json['condition'] as String?
  ..comment = json['comment'] as String?
  ..initiator = json['initiator'] as bool?
  ..processInstanceId = json['processInstanceId'] as String?
  ..formData = json['formData'] as Map<String, dynamic>?
  ..assignees = json['assignees'] as Map<String, dynamic>?
  ..taskData = json['taskData'] as String?;

Map<String, dynamic> _$TaskFormToJson(TaskForm instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'assignee': instance.assignee,
      'condition': instance.condition,
      'comment': instance.comment,
      'initiator': instance.initiator,
      'processInstanceId': instance.processInstanceId,
      'formData': instance.formData,
      'assignees': instance.assignees,
      'taskData': instance.taskData,
    };
