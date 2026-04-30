// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SystemConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemConfig _$SystemConfigFromJson(Map<String, dynamic> json) => SystemConfig(
  systemName: json['systemName'] as String?,
  systemDescription: json['systemDescription'] as String?,
  logo: json['logo'] as String?,
  recordNumber: json['recordNumber'] as String?,
  appUrl: json['appUrl'] as String?,
  appVersion: json['appVersion'] as String?,
  iosAppId: json['iosAppId'] as String?,
  qrCodeUrl: json['qrCodeUrl'] as String?,
  minVersion: json['minVersion'] as String?,
  maxVersion: json['maxVersion'] as String?,
);

Map<String, dynamic> _$SystemConfigToJson(SystemConfig instance) =>
    <String, dynamic>{
      'systemName': instance.systemName,
      'systemDescription': instance.systemDescription,
      'logo': instance.logo,
      'recordNumber': instance.recordNumber,
      'appUrl': instance.appUrl,
      'appVersion': instance.appVersion,
      'iosAppId': instance.iosAppId,
      'qrCodeUrl': instance.qrCodeUrl,
      'minVersion': instance.minVersion,
      'maxVersion': instance.maxVersion,
    };
