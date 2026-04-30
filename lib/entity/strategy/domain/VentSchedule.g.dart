// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VentSchedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VentSchedule _$VentScheduleFromJson(Map<String, dynamic> json) => VentSchedule(
  enable: (json['enable'] as num?)?.toInt() ?? 0,
  lowTemp: (json['lowTemp'] as num?)?.toInt() ?? 0,
  highTemp: (json['highTemp'] as num?)?.toInt() ?? 0,
  workLevel: (json['workLevel'] as num?)?.toInt() ?? 0,
  workTime: (json['workTime'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VentScheduleToJson(VentSchedule instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'lowTemp': instance.lowTemp,
      'highTemp': instance.highTemp,
      'workLevel': instance.workLevel,
      'workTime': instance.workTime,
    };
