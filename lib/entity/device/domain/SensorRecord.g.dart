// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SensorRecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorRecord _$SensorRecordFromJson(Map<String, dynamic> json) => SensorRecord(
  id: json['id'] as String?,
  deviceId: json['deviceId'] as String?,
  deviceName: json['deviceName'] as String?,
  type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
  value: json['value'],
  formatValue: json['formatValue'],
  createTime: DateFormater.jsonToDateTimeNoSecond(
    json['createTime'] as String?,
  ),
  timestamp: DateFormater.jsonToDateTimeNoSecond(json['timestamp'] as String?),
);

Map<String, dynamic> _$SensorRecordToJson(SensorRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'type': _$TypeEnumMap[instance.type],
      'value': instance.value,
      'formatValue': instance.formatValue,
      'createTime': DateFormater.dateTimeNoSecondToJson(instance.createTime),
      'timestamp': DateFormater.dateTimeNoSecondToJson(instance.timestamp),
    };

const _$TypeEnumMap = {
  Type.INTEGER: 'INTEGER',
  Type.LONG: 'LONG',
  Type.FLOAT: 'FLOAT',
  Type.DOUBLE: 'DOUBLE',
  Type.TEXT: 'TEXT',
  Type.BOOLEAN: 'BOOLEAN',
  Type.DATE: 'DATE',
  Type.ENUM: 'ENUM',
  Type.ARRAY: 'ARRAY',
  Type.GEO: 'GEO',
  Type.OBJECT: 'OBJECT',
};
