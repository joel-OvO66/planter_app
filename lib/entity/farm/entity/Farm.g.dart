// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Farm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Farm _$FarmFromJson(Map<String, dynamic> json) =>
    Farm(
        tenantId: (json['tenantId'] as num?)?.toInt() ?? 0,
        tenantName: json['tenantName'] as String?,
        address: json['address'] as String?,
        enabled: json['enabled'] as bool? ?? false,
        remark: json['remark'] as String?,
        deleted: json['deleted'] as bool? ?? false,
        latLng: json['latLng'] == null
            ? null
            : LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?
      ..point = json['point'] == null
          ? null
          : LatLng.fromJson(json['point'] as Map<String, dynamic>);

Map<String, dynamic> _$FarmToJson(Farm instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'tenantId': instance.tenantId,
  'tenantName': instance.tenantName,
  'address': instance.address,
  'enabled': instance.enabled,
  'remark': instance.remark,
  'deleted': instance.deleted,
  'latLng': instance.latLng,
  'point': instance.point,
};
