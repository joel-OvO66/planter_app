// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FanState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FanState _$FanStateFromJson(Map<String, dynamic> json) => FanState(
  enabled: json['enabled'] as bool? ?? false,
  workLevel: (json['workLevel'] as num?)?.toInt() ?? 0,
  countDown: (json['countDown'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FanStateToJson(FanState instance) => <String, dynamic>{
  'enabled': instance.enabled,
  'workLevel': instance.workLevel,
  'countDown': instance.countDown,
};
