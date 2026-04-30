// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SensorV5Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorV5Data _$SensorV5DataFromJson(Map<String, dynamic> json) => SensorV5Data(
  lightRunningState: json['lightRunningState'] == null
      ? null
      : LightRunningState.fromJson(
          json['lightRunningState'] as Map<String, dynamic>,
        ),
  manModeParam: json['manModeParam'] == null
      ? null
      : ManModeParam.fromJson(json['manModeParam'] as Map<String, dynamic>),
  globalParam: json['globalParam'] == null
      ? null
      : GlobalParam.fromJson(json['globalParam'] as Map<String, dynamic>),
  seedingParam: json['seedingParam'] == null
      ? null
      : SceneSetting.fromJson(json['seedingParam'] as Map<String, dynamic>),
  vegetativeParam: json['vegetativeParam'] == null
      ? null
      : SceneSetting.fromJson(json['vegetativeParam'] as Map<String, dynamic>),
  floweringParam: json['floweringParam'] == null
      ? null
      : SceneSetting.fromJson(json['floweringParam'] as Map<String, dynamic>),
  fanState1: json['fanState1'] == null
      ? null
      : FanState.fromJson(json['fanState1'] as Map<String, dynamic>),
  fanState2: json['fanState2'] == null
      ? null
      : FanState.fromJson(json['fanState2'] as Map<String, dynamic>),
  venState: json['venState'] == null
      ? null
      : FanState.fromJson(json['venState'] as Map<String, dynamic>),
  tempState1: json['tempState1'] == null
      ? null
      : TempState.fromJson(json['tempState1'] as Map<String, dynamic>),
  tempState2: json['tempState2'] == null
      ? null
      : TempState.fromJson(json['tempState2'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SensorV5DataToJson(SensorV5Data instance) =>
    <String, dynamic>{
      'lightRunningState': instance.lightRunningState,
      'manModeParam': instance.manModeParam,
      'globalParam': instance.globalParam,
      'seedingParam': instance.seedingParam,
      'vegetativeParam': instance.vegetativeParam,
      'floweringParam': instance.floweringParam,
      'fanState1': instance.fanState1,
      'fanState2': instance.fanState2,
      'venState': instance.venState,
      'tempState1': instance.tempState1,
      'tempState2': instance.tempState2,
    };
