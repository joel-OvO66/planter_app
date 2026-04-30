// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SensorData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorData _$SensorDataFromJson(Map<String, dynamic> json) => SensorData(
  temperatures: (json['temperatures'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  humidities: (json['humidities'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  co2s: (json['co2s'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  phs: (json['phs'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  illuminances: (json['illuminances'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  ecs: (json['ecs'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  atms: (json['atms'] as List<dynamic>?)
      ?.map((e) => SensorRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SensorDataToJson(SensorData instance) =>
    <String, dynamic>{
      'temperatures': instance.temperatures,
      'humidities': instance.humidities,
      'co2s': instance.co2s,
      'phs': instance.phs,
      'illuminances': instance.illuminances,
      'ecs': instance.ecs,
      'atms': instance.atms,
    };
