// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FileEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileEntity _$FileEntityFromJson(Map<String, dynamic> json) => FileEntity()
  ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
  ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
  ..updateBy = json['updateBy'] as String?
  ..createBy = json['createBy'] as String?
  ..fotId = (json['fotId'] as num?)?.toInt()
  ..fileBase = json['fileBase'] == null
      ? null
      : FileBase.fromJson(json['fileBase'] as Map<String, dynamic>)
  ..folder = json['folder'] == null
      ? null
      : Folder.fromJson(json['folder'] as Map<String, dynamic>)
  ..name = json['name'] as String?
  ..remark = json['remark'] as String?
  ..directory = json['directory'] as bool;

Map<String, dynamic> _$FileEntityToJson(FileEntity instance) =>
    <String, dynamic>{
      'createTime': DateFormater.dateTimeToJson(instance.createTime),
      'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
      'updateBy': instance.updateBy,
      'createBy': instance.createBy,
      'fotId': instance.fotId,
      'fileBase': instance.fileBase,
      'folder': instance.folder,
      'name': instance.name,
      'remark': instance.remark,
      'directory': instance.directory,
    };
