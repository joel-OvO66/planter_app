// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Scene.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scene _$SceneFromJson(Map<String, dynamic> json) =>
    Scene(
        sceneId: (json['sceneId'] as num?)?.toInt() ?? 0,
        sceneName: json['sceneName'] as String?,
        room: json['room'] == null
            ? null
            : Room.fromJson(json['room'] as Map<String, dynamic>),
        sceneIndex: (json['sceneIndex'] as num?)?.toInt() ?? 0,
        shutdownTemp: (json['shutdownTemp'] as num?)?.toInt() ?? 0,
        sunriseDay: (json['sunriseDay'] as num?)?.toInt() ?? 0,
        dimmingTemp: (json['dimmingTemp'] as num?)?.toInt() ?? 0,
        brightnessPoints: (json['brightnessPoints'] as List<dynamic>?)
            ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
            .toList(),
        spectrumDim1: (json['spectrumDim1'] as num?)?.toInt() ?? 0,
        spectrumDim2: (json['spectrumDim2'] as num?)?.toInt() ?? 0,
        remark: json['remark'] as String?,
        manModeParam: json['manModeParam'] == null
            ? null
            : ManModeParam.fromJson(
                json['manModeParam'] as Map<String, dynamic>,
              ),
        seedingParam: json['seedingParam'] == null
            ? null
            : SceneSetting.fromJson(
                json['seedingParam'] as Map<String, dynamic>,
              ),
        vegetativeParam: json['vegetativeParam'] == null
            ? null
            : SceneSetting.fromJson(
                json['vegetativeParam'] as Map<String, dynamic>,
              ),
        floweringParam: json['floweringParam'] == null
            ? null
            : SceneSetting.fromJson(
                json['floweringParam'] as Map<String, dynamic>,
              ),
        settingType: $enumDecodeNullable(
          _$SettingTypeEnumMap,
          json['settingType'],
        ),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$SceneToJson(Scene instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'sceneId': instance.sceneId,
  'sceneName': instance.sceneName,
  'room': instance.room,
  'sceneIndex': instance.sceneIndex,
  'shutdownTemp': instance.shutdownTemp,
  'sunriseDay': instance.sunriseDay,
  'dimmingTemp': instance.dimmingTemp,
  'brightnessPoints': instance.brightnessPoints,
  'spectrumDim1': instance.spectrumDim1,
  'spectrumDim2': instance.spectrumDim2,
  'remark': instance.remark,
  'manModeParam': instance.manModeParam,
  'seedingParam': instance.seedingParam,
  'vegetativeParam': instance.vegetativeParam,
  'floweringParam': instance.floweringParam,
  'settingType': _$SettingTypeEnumMap[instance.settingType],
};

const _$SettingTypeEnumMap = {
  SettingType.SEEDING: 'SEEDING',
  SettingType.VEGETATIVE: 'VEGETATIVE',
  SettingType.FLOWERING: 'FLOWERING',
};
