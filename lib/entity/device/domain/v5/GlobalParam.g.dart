// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GlobalParam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalParam _$GlobalParamFromJson(Map<String, dynamic> json) => GlobalParam(
  runMode: (json['runMode'] as num?)?.toInt() ?? 0,
  sysLang: (json['sysLang'] as num?)?.toInt() ?? 0,
  tempUnit: (json['tempUnit'] as num?)?.toInt() ?? 0,
  lockScreenEn: (json['lockScreenEn'] as num?)?.toInt() ?? 0,
  lockScreenTime: (json['lockScreenTime'] as num?)?.toInt() ?? 0,
  keySoundEn: (json['keySoundEn'] as num?)?.toInt() ?? 0,
  dataChageFlag: (json['dataChageFlag'] as num?)?.toInt() ?? 0,
  UI_Ver: json['UI_Ver'] as String?,
  Soft_Ver: json['Soft_Ver'] as String?,
  Hard_Ver: json['Hard_Ver'] as String?,
);

Map<String, dynamic> _$GlobalParamToJson(GlobalParam instance) =>
    <String, dynamic>{
      'runMode': instance.runMode,
      'sysLang': instance.sysLang,
      'tempUnit': instance.tempUnit,
      'lockScreenEn': instance.lockScreenEn,
      'lockScreenTime': instance.lockScreenTime,
      'keySoundEn': instance.keySoundEn,
      'dataChageFlag': instance.dataChageFlag,
      'UI_Ver': instance.UI_Ver,
      'Soft_Ver': instance.Soft_Ver,
      'Hard_Ver': instance.Hard_Ver,
    };
