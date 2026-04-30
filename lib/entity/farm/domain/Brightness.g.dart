// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Brightness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brightness _$BrightnessFromJson(Map<String, dynamic> json) => Brightness(
  shutdownTemp: (json['shutdownTemp'] as num?)?.toInt() ?? 0,
  sunriseDay: (json['sunriseDay'] as num?)?.toInt() ?? 0,
  dimmingTemp: (json['dimmingTemp'] as num?)?.toInt() ?? 0,
  points: (json['points'] as List<dynamic>?)
      ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BrightnessToJson(Brightness instance) =>
    <String, dynamic>{
      'shutdownTemp': instance.shutdownTemp,
      'sunriseDay': instance.sunriseDay,
      'dimmingTemp': instance.dimmingTemp,
      'points': instance.points,
    };
