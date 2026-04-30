// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Folder _$FolderFromJson(Map<String, dynamic> json) => Folder()
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
  ..directory = json['directory'] as bool
  ..fileSize = (json['fileSize'] as num?)?.toInt()
  ..sortIndex = (json['sortIndex'] as num?)?.toInt()
  ..fileEntities = (json['fileEntities'] as List<dynamic>?)
      ?.map((e) => FileEntity.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FolderToJson(Folder instance) => <String, dynamic>{
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
      'fileSize': instance.fileSize,
      'sortIndex': instance.sortIndex,
      'fileEntities': instance.fileEntities,
    };
