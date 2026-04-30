// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LatLng.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
  lng: (json['lng'] as num?)?.toDouble() ?? 0,
  lat: (json['lat'] as num?)?.toDouble() ?? 0,
  alt: (json['alt'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
  'lng': instance.lng,
  'lat': instance.lat,
  'alt': instance.alt,
};
