// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SceneSpec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SceneSpec _$SceneSpecFromJson(Map<String, dynamic> json) => SceneSpec(
  name: json['name'] as String?,
  brightness: json['brightness'] == null
      ? null
      : Brightness.fromJson(json['brightness'] as Map<String, dynamic>),
  sceneType: (json['sceneType'] as num?)?.toInt() ?? 0,
  spectrum: json['spectrum'] == null
      ? null
      : Spectrum.fromJson(json['spectrum'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SceneSpecToJson(SceneSpec instance) => <String, dynamic>{
  'name': instance.name,
  'brightness': instance.brightness,
  'sceneType': instance.sceneType,
  'spectrum': instance.spectrum,
};
