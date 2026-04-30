// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment()
  ..id = json['id'] as String?
  ..message = json['message'] as String?
  ..type = json['type'] as String?
  ..taskId = json['taskId'] as String?
  ..processInstanceId = json['processInstanceId'] as String?;

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'type': instance.type,
      'taskId': instance.taskId,
      'processInstanceId': instance.processInstanceId,
    };
