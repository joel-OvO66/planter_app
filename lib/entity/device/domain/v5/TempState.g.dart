// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TempState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempState _$TempStateFromJson(Map<String, dynamic> json) => TempState(
  enabled: json['enabled'] as bool? ?? false,
  tempValue: (json['tempValue'] as num?)?.toDouble() ?? 0,
  humidValue: (json['humidValue'] as num?)?.toDouble() ?? 0,
  vpdValue: (json['vpdValue'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$TempStateToJson(TempState instance) => <String, dynamic>{
  'enabled': instance.enabled,
  'tempValue': instance.tempValue,
  'humidValue': instance.humidValue,
  'vpdValue': instance.vpdValue,
};
