// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Authenticity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authenticity _$AuthenticityFromJson(Map<String, dynamic> json) => Authenticity()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..fullName = json['fullName'] as String?
  ..avatar = json['avatar'] as String?
  ..token = json['token'] as String
  ..authorities =
      (json['authorities'] as List<dynamic>?)?.map((e) => e as String).toSet()
  ..privileges = (json['privileges'] as List<dynamic>?)
      ?.map((e) => Privilege.fromJson(e as Map<String, dynamic>))
      .toList()
  ..extend = json['extend'] as Map<String, dynamic>?;

Map<String, dynamic> _$AuthenticityToJson(Authenticity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'token': instance.token,
      'authorities': instance.authorities?.toList(),
      'privileges': instance.privileges,
      'extend': instance.extend,
    };
