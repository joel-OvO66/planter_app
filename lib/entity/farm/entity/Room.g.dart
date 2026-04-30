// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) =>
    Room(
        roomId: (json['roomId'] as num?)?.toInt() ?? 0,
        roomName: json['roomName'] as String?,
        deviceId: json['deviceId'] as String?,
        tenantId: json['tenantId'] as String?,
        remark: json['remark'] as String?,
        plants: (json['plants'] as List<dynamic>?)
            ?.map((e) => Plant.fromJson(e as Map<String, dynamic>))
            .toList(),
        roomState: $enumDecodeNullable(_$RoomStateEnumMap, json['roomState']),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'roomId': instance.roomId,
  'roomName': instance.roomName,
  'deviceId': instance.deviceId,
  'tenantId': instance.tenantId,
  'remark': instance.remark,
  'plants': instance.plants,
  'roomState': _$RoomStateEnumMap[instance.roomState],
};

const _$RoomStateEnumMap = {
  RoomState.NORMAL: 'NORMAL',
  RoomState.ALARM: 'ALARM',
  RoomState.OPERATING: 'OPERATING',
};
