// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseResult _$ResponseResultFromJson(Map<String, dynamic> json) =>
    ResponseResult(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseResultToJson(ResponseResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
