// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlantCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantCategory _$PlantCategoryFromJson(Map<String, dynamic> json) =>
    PlantCategory(
        categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
        categoryName: json['categoryName'] as String?,
        remark: json['remark'] as String?,
        tenantId: json['tenantId'] as String?,
        plants: (json['plants'] as List<dynamic>?)
            ?.map((e) => Plant.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
      ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
      ..updateBy = json['updateBy'] as String?
      ..createBy = json['createBy'] as String?;

Map<String, dynamic> _$PlantCategoryToJson(PlantCategory instance) =>
    <String, dynamic>{
      'createTime': DateFormater.dateTimeToJson(instance.createTime),
      'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
      'updateBy': instance.updateBy,
      'createBy': instance.createBy,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'remark': instance.remark,
      'tenantId': instance.tenantId,
      'plants': instance.plants,
    };
