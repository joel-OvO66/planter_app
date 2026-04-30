// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plant _$PlantFromJson(Map<String, dynamic> json) =>
    Plant(
        plantId: (json['plantId'] as num?)?.toInt() ?? 0,
        plantCategory: json['plantCategory'] == null
            ? null
            : PlantCategory.fromJson(
                json['plantCategory'] as Map<String, dynamic>,
              ),
        room: json['room'] == null
            ? null
            : Room.fromJson(json['room'] as Map<String, dynamic>),
        plantName: json['plantName'] as String?,
        tenantId: json['tenantId'] as String?,
        remark: json['remark'] as String?,
        cover: json['cover'] == null
            ? null
            : FileInfo.fromJson(json['cover'] as Map<String, dynamic>),
        growthStages: (json['growthStages'] as List<dynamic>?)
            ?.map((e) => GrowthStage.fromJson(e as Map<String, dynamic>))
            .toList(),
        notes: (json['notes'] as List<dynamic>?)
            ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$PlantToJson(Plant instance) => <String, dynamic>{
  'createTime': DateFormater.dateTimeToJson(instance.createTime),
  'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
  'updateBy': instance.updateBy,
  'createBy': instance.createBy,
  'plantId': instance.plantId,
  'plantCategory': instance.plantCategory,
  'room': instance.room,
  'plantName': instance.plantName,
  'tenantId': instance.tenantId,
  'cover': instance.cover,
  'remark': instance.remark,
  'growthStages': instance.growthStages,
  'notes': instance.notes,
};
