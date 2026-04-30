// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ErrorResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse()
      ..code = json['code'] as String?
      ..message = json['message'] as String?
      ..type = $enumDecodeNullable(_$TypeEnumMap, json['type'])
      ..value = json['value'];

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'type': _$TypeEnumMap[instance.type],
      'value': instance.value,
    };

const _$TypeEnumMap = {
  Type.NOT_FOUND: 'NOT_FOUND',
  Type.DELETED: 'DELETED',
  Type.FIELD: 'FIELD',
  Type.SQL: 'SQL',
  Type.BUSINESS: 'BUSINESS',
};
