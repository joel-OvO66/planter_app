// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) =>
    User(
        userId: (json['userId'] as num?)?.toInt() ?? 0,
        userName: json['userName'] as String?,
        superUser: json['superUser'] as bool? ?? false,
        realName: json['realName'] as String?,
        avatarUrl: json['avatarUrl'] as String?,
        mobile: json['mobile'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        enabled: json['enabled'] as bool? ?? false,
        gender: json['gender'] as bool? ?? false,
        lastLoginTime: DateFormater.jsonToDateTimeNoSecond(
          json['lastLoginTime'] as String?,
        ),
        avatar: json['avatar'] == null
            ? null
            : FileInfo.fromJson(json['avatar'] as Map<String, dynamic>),
        remark: json['remark'] as String?,
        position: json['position'] as String?,
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
            .toList(),
        farms: (json['farms'] as List<dynamic>?)
            ?.map((e) => Farm.fromJson(e as Map<String, dynamic>))
            .toList(),
        tenantId: json['tenantId'] as String?,
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'userId': instance.userId,
  'userName': instance.userName,
  'superUser': instance.superUser,
  'realName': instance.realName,
  'avatarUrl': instance.avatarUrl,
  'mobile': instance.mobile,
  'email': instance.email,
  'password': instance.password,
  'enabled': instance.enabled,
  'gender': instance.gender,
  'lastLoginTime': DateFormater.dateTimeNoSecondToJson(instance.lastLoginTime),
  'avatar': instance.avatar,
  'remark': instance.remark,
  'position': instance.position,
  'roles': instance.roles,
  'farms': instance.farms,
  'tenantId': instance.tenantId,
};
