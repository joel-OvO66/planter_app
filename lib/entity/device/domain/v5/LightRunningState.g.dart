// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LightRunningState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightRunningState _$LightRunningStateFromJson(Map<String, dynamic> json) =>
    LightRunningState(
      runMode: (json['runMode'] as num?)?.toInt() ?? 0,
      dim1Per: (json['dim1Per'] as num?)?.toInt() ?? 0,
      dim2Per: (json['dim2Per'] as num?)?.toInt() ?? 0,
      dim3Per: (json['dim3Per'] as num?)?.toInt() ?? 0,
      schStartTime: (json['schStartTime'] as num?)?.toInt() ?? 0,
      schEndTime: (json['schEndTime'] as num?)?.toInt() ?? 0,
      autoScene: (json['autoScene'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LightRunningStateToJson(LightRunningState instance) =>
    <String, dynamic>{
      'runMode': instance.runMode,
      'dim1Per': instance.dim1Per,
      'dim2Per': instance.dim2Per,
      'dim3Per': instance.dim3Per,
      'schStartTime': instance.schStartTime,
      'schEndTime': instance.schEndTime,
      'autoScene': instance.autoScene,
    };
