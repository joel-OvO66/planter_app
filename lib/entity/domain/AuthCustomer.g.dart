// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthCustomer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthCustomer _$AuthCustomerFromJson(Map<String, dynamic> json) => AuthCustomer(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  avatar: json['avatar'] as String?,
  token: json['token'] as String?,
  extend: json['extend'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$AuthCustomerToJson(AuthCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
      'token': instance.token,
      'extend': instance.extend,
    };
