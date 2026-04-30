// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  permissionId: (json['permissionId'] as num?)?.toInt() ?? 0,
  privilegeCode: json['privilegeCode'] as String?,
  role: json['role'] == null
      ? null
      : Role.fromJson(json['role'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'permissionId': instance.permissionId,
      'privilegeCode': instance.privilegeCode,
      'role': instance.role,
    };
