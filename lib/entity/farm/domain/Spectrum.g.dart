// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Spectrum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spectrum _$SpectrumFromJson(Map<String, dynamic> json) => Spectrum(
  dim1: (json['dim1'] as num?)?.toInt() ?? 0,
  dim2: (json['dim2'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SpectrumToJson(Spectrum instance) => <String, dynamic>{
  'dim1': instance.dim1,
  'dim2': instance.dim2,
};
