// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'File.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File()
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
  ..fileType = json['fileType'] as String?
  ..fileVersion = (json['fileVersion'] as num?)?.toInt()
  ..storagePath = json['storagePath'] as String?
  ..previewPath = json['previewPath'] as String?
  ..thumbPath = json['thumbPath'] as String?
  ..thumbUrl = json['thumbUrl'] as String?
  ..fileUrl = json['fileUrl'] as String?
  ..previewUrl = json['previewUrl'] as String?;

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
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
      'fileType': instance.fileType,
      'fileVersion': instance.fileVersion,
      'storagePath': instance.storagePath,
      'previewPath': instance.previewPath,
      'thumbPath': instance.thumbPath,
      'thumbUrl': instance.thumbUrl,
      'fileUrl': instance.fileUrl,
      'previewUrl': instance.previewUrl,
    };
