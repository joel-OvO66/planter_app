// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) =>
    Note(
        noteId: (json['noteId'] as num?)?.toInt() ?? 0,
        plant: json['plant'] == null
            ? null
            : Plant.fromJson(json['plant'] as Map<String, dynamic>),
        noteContent: json['noteContent'] as String?,
        noteTime: DateFormater.jsonToDateTimeNoSecond(
          json['noteTime'] as String?,
        ),
        attachments: (json['attachments'] as List<dynamic>?)
            ?.map((e) => FileInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        waterVolume: (json['waterVolume'] as num?)?.toDouble() ?? 0,
        lightSchedule: (json['lightSchedule'] as num?)?.toInt() ?? 0,
        height: (json['height'] as num?)?.toDouble() ?? 0,
        distance: (json['distance'] as num?)?.toDouble() ?? 0,
        potSize: (json['potSize'] as num?)?.toDouble() ?? 0,
        minTemp: (json['minTemp'] as num?)?.toDouble() ?? 0,
        maxTemp: (json['maxTemp'] as num?)?.toDouble() ?? 0,
        minHumi: (json['minHumi'] as num?)?.toInt() ?? 0,
        maxHumi: (json['maxHumi'] as num?)?.toInt() ?? 0,
        co2Level: (json['co2Level'] as num?)?.toInt() ?? 0,
        ph: (json['ph'] as num?)?.toDouble() ?? 0,
        noteType: $enumDecodeNullable(_$NoteTypeEnumMap, json['noteType']),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?);

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'noteId': instance.noteId,
  'plant': instance.plant,
  'noteContent': instance.noteContent,
  'noteTime': DateFormater.dateTimeNoSecondToJson(instance.noteTime),
  'attachments': instance.attachments,
  'waterVolume': instance.waterVolume,
  'lightSchedule': instance.lightSchedule,
  'height': instance.height,
  'distance': instance.distance,
  'potSize': instance.potSize,
  'minTemp': instance.minTemp,
  'maxTemp': instance.maxTemp,
  'minHumi': instance.minHumi,
  'maxHumi': instance.maxHumi,
  'co2Level': instance.co2Level,
  'ph': instance.ph,
  'noteType': _$NoteTypeEnumMap[instance.noteType],
};

const _$NoteTypeEnumMap = {
  NoteType.WATERING: 'WATERING',
  NoteType.NUTRIENTS: 'NUTRIENTS',
  NoteType.PEST_CONTROL: 'PEST_CONTROL',
  NoteType.TRIM: 'TRIM',
  NoteType.LIGHT_SCHEDULE: 'LIGHT_SCHEDULE',
  NoteType.HEIGHT: 'HEIGHT',
  NoteType.LAMP_TO_PLANT_DISTANCE: 'LAMP_TO_PLANT_DISTANCE',
  NoteType.POT_SIZE: 'POT_SIZE',
  NoteType.TEMPERATURE_HUMIDITY: 'TEMPERATURE_HUMIDITY',
  NoteType.CO2: 'CO2',
  NoteType.TRANING: 'TRANING',
  NoteType.ROOT_PH: 'ROOT_PH',
  NoteType.OTHER: 'OTHER',
};
