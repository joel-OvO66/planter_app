// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) =>
    Role(
        roleId: (json['roleId'] as num?)?.toInt() ?? 0,
        roleCode: json['roleCode'] as String?,
        roleName: json['roleName'] as String?,
        enabled: json['enabled'] as bool? ?? false,
        remark: json['remark'] as String?,
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
        privilegeCodes: (json['privilegeCodes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'roleId': instance.roleId,
  'roleCode': instance.roleCode,
  'roleName': instance.roleName,
  'enabled': instance.enabled,
  'remark': instance.remark,
  'users': instance.users,
  'privilegeCodes': instance.privilegeCodes,
};
