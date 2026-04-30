// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) =>
    Feedback(
        feedId: (json['feedId'] as num?)?.toInt() ?? 0,
        content: json['content'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        reply: json['reply'] as String?,
        handler: json['handler'] as String?,
        handleTime: DateFormater.jsonToDateTimeNoSecond(
          json['handleTime'] as String?,
        ),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?);

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'feedId': instance.feedId,
  'content': instance.content,
  'user': instance.user,
  'reply': instance.reply,
  'handler': instance.handler,
  'handleTime': DateFormater.dateTimeNoSecondToJson(instance.handleTime),
};
