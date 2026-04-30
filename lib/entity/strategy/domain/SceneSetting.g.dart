// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SceneSetting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SceneSetting _$SceneSettingFromJson(Map<String, dynamic> json) => SceneSetting(
  modeEnable: (json['modeEnable'] as num?)?.toInt() ?? 0,
  dim1Per: (json['dim1Per'] as num?)?.toInt() ?? 0,
  dim2Per: (json['dim2Per'] as num?)?.toInt() ?? 0,
  dim3Per: (json['dim3Per'] as num?)?.toInt() ?? 0,
  schEnable: (json['schEnable'] as num?)?.toInt() ?? 0,
  schStartTime: (json['schStartTime'] as num?)?.toInt() ?? 0,
  schEndTime: (json['schEndTime'] as num?)?.toInt() ?? 0,
  schStartDate: json['schStartDate'] as String?,
  schEndDate: json['schEndDate'] as String?,
  ventSch1: json['ventSch1'] == null
      ? null
      : VentSchedule.fromJson(json['ventSch1'] as Map<String, dynamic>),
  ventSch2: json['ventSch2'] == null
      ? null
      : VentSchedule.fromJson(json['ventSch2'] as Map<String, dynamic>),
  ventSch3: json['ventSch3'] == null
      ? null
      : VentSchedule.fromJson(json['ventSch3'] as Map<String, dynamic>),
  fanSch1: json['fanSch1'] == null
      ? null
      : FanSchedule.fromJson(json['fanSch1'] as Map<String, dynamic>),
  fanSch2: json['fanSch2'] == null
      ? null
      : FanSchedule.fromJson(json['fanSch2'] as Map<String, dynamic>),
  fanSch3: json['fanSch3'] == null
      ? null
      : FanSchedule.fromJson(json['fanSch3'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SceneSettingToJson(SceneSetting instance) =>
    <String, dynamic>{
      'modeEnable': instance.modeEnable,
      'dim1Per': instance.dim1Per,
      'dim2Per': instance.dim2Per,
      'dim3Per': instance.dim3Per,
      'schEnable': instance.schEnable,
      'schStartTime': instance.schStartTime,
      'schEndTime': instance.schEndTime,
      'schStartDate': instance.schStartDate,
      'schEndDate': instance.schEndDate,
      'ventSch1': instance.ventSch1,
      'ventSch2': instance.ventSch2,
      'ventSch3': instance.ventSch3,
      'fanSch1': instance.fanSch1,
      'fanSch2': instance.fanSch2,
      'fanSch3': instance.fanSch3,
    };
