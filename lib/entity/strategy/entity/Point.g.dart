// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) => Point(
  time: (json['time'] as num?)?.toInt() ?? 0,
  value: (json['value'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
  'time': instance.time,
  'value': instance.value,
};
