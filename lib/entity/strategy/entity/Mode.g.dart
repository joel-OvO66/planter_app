// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mode _$ModeFromJson(Map<String, dynamic> json) =>
    Mode(
        modeId: (json['modeId'] as num?)?.toInt() ?? 0,
        modeName: json['modeName'] as String?,
        tenantId: json['tenantId'] as String?,
        room: json['room'] == null
            ? null
            : Room.fromJson(json['room'] as Map<String, dynamic>),
        modeItems: (json['modeItems'] as List<dynamic>?)
            ?.map((e) => ModeItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$ModeToJson(Mode instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'modeId': instance.modeId,
  'modeName': instance.modeName,
  'tenantId': instance.tenantId,
  'room': instance.room,
  'modeItems': instance.modeItems,
};
