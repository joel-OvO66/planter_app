// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoomProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomProfile _$RoomProfileFromJson(Map<String, dynamic> json) => RoomProfile(
  roomId: (json['roomId'] as num?)?.toInt() ?? 0,
  roomName: json['roomName'] as String?,
  deviceId: json['deviceId'] as String?,
  remark: json['remark'] as String?,
  roomState: $enumDecodeNullable(_$RoomStateEnumMap, json['roomState']),
  sensorData: json['sensorData'] == null
      ? null
      : SensorData.fromJson(json['sensorData'] as Map<String, dynamic>),
  sceneMode: json['sceneMode'] as String?,
  currentSceneIndex: (json['currentSceneIndex'] as num?)?.toInt() ?? 0,
  sensorV5Data: json['sensorV5Data'] == null
      ? null
      : SensorV5Data.fromJson(json['sensorV5Data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoomProfileToJson(RoomProfile instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'deviceId': instance.deviceId,
      'remark': instance.remark,
      'roomState': _$RoomStateEnumMap[instance.roomState],
      'sensorData': instance.sensorData,
      'sceneMode': instance.sceneMode,
      'currentSceneIndex': instance.currentSceneIndex,
      'sensorV5Data': instance.sensorV5Data,
    };

const _$RoomStateEnumMap = {
  RoomState.NORMAL: 'NORMAL',
  RoomState.ALARM: 'ALARM',
  RoomState.OPERATING: 'OPERATING',
};
