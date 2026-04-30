// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseResult _$ResponseResultFromJson(Map<String, dynamic> json) =>
    ResponseResult(
      result: $enumDecode(_$ResultEnumMap, json['result']),
      errorCode: json['errorCode'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ResponseResultToJson(ResponseResult instance) =>
    <String, dynamic>{
      'result': _$ResultEnumMap[instance.result]!,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

const _$ResultEnumMap = {Result.SUCCESS: 'SUCCESS', Result.FAILURE: 'FAILURE'};
