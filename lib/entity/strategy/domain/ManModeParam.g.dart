// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ManModeParam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManModeParam _$ManModeParamFromJson(Map<String, dynamic> json) => ManModeParam(
  dim1Per: (json['dim1Per'] as num?)?.toInt() ?? 0,
  dim2Per: (json['dim2Per'] as num?)?.toInt() ?? 0,
  dim3Per: (json['dim3Per'] as num?)?.toInt() ?? 0,
  schEnable: (json['schEnable'] as num?)?.toInt() ?? 0,
  schStartTime: (json['schStartTime'] as num?)?.toInt() ?? 0,
  schEndTime: (json['schEndTime'] as num?)?.toInt() ?? 0,
  schStartDate: json['schStartDate'] as String?,
  schEndDate: json['schEndDate'] as String?,
  ventOnTime: (json['ventOnTime'] as num?)?.toInt() ?? 0,
  ventOffTime: (json['ventOffTime'] as num?)?.toInt() ?? 0,
  ventLevel: (json['ventLevel'] as num?)?.toInt() ?? 0,
  fanOnTime: (json['fanOnTime'] as num?)?.toInt() ?? 0,
  fanOffTime: (json['fanOffTime'] as num?)?.toInt() ?? 0,
  fanLevel: (json['fanLevel'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ManModeParamToJson(ManModeParam instance) =>
    <String, dynamic>{
      'dim1Per': instance.dim1Per,
      'dim2Per': instance.dim2Per,
      'dim3Per': instance.dim3Per,
      'schEnable': instance.schEnable,
      'schStartTime': instance.schStartTime,
      'schEndTime': instance.schEndTime,
      'schStartDate': instance.schStartDate,
      'schEndDate': instance.schEndDate,
      'ventOnTime': instance.ventOnTime,
      'ventOffTime': instance.ventOffTime,
      'ventLevel': instance.ventLevel,
      'fanOnTime': instance.fanOnTime,
      'fanOffTime': instance.fanOffTime,
      'fanLevel': instance.fanLevel,
    };
