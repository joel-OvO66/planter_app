// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModeItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModeItem _$ModeItemFromJson(Map<String, dynamic> json) =>
    ModeItem(
        itemId: (json['itemId'] as num?)?.toInt() ?? 0,
        mode: json['mode'] == null
            ? null
            : Mode.fromJson(json['mode'] as Map<String, dynamic>),
        itemName: json['itemName'] as String?,
        sortIndex: (json['sortIndex'] as num?)?.toInt() ?? 0,
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$ModeItemToJson(ModeItem instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'itemId': instance.itemId,
  'mode': instance.mode,
  'itemName': instance.itemName,
  'sortIndex': instance.sortIndex,
};
