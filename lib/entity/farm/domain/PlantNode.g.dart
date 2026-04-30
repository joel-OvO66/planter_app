// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlantNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantNode _$PlantNodeFromJson(Map<String, dynamic> json) => PlantNode(
  noteCount: (json['noteCount'] as num?)?.toInt() ?? 0,
  waterDaysAgo: (json['waterDaysAgo'] as num?)?.toInt(),
  nutrientDaysAgo: (json['nutrientDaysAgo'] as num?)?.toInt(),
  pestControlDaysAgo: (json['pestControlDaysAgo'] as num?)?.toInt(),
  trimDaysAgo: (json['trimDaysAgo'] as num?)?.toInt(),
  lightSchedule: (json['lightSchedule'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toDouble(),
  distance: (json['distance'] as num?)?.toDouble(),
  potSize: (json['potSize'] as num?)?.toDouble(),
  minTemp: (json['minTemp'] as num?)?.toDouble(),
  maxTemp: (json['maxTemp'] as num?)?.toDouble(),
  minHumi: (json['minHumi'] as num?)?.toInt(),
  maxHumi: (json['maxHumi'] as num?)?.toInt(),
  co2Level: (json['co2Level'] as num?)?.toInt(),
  ph: (json['ph'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PlantNodeToJson(PlantNode instance) => <String, dynamic>{
  'noteCount': instance.noteCount,
  'waterDaysAgo': instance.waterDaysAgo,
  'nutrientDaysAgo': instance.nutrientDaysAgo,
  'pestControlDaysAgo': instance.pestControlDaysAgo,
  'trimDaysAgo': instance.trimDaysAgo,
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
};
