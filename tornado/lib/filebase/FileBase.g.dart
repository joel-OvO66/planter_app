// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FileBase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileBase _$FileBaseFromJson(Map<String, dynamic> json) => FileBase()
  ..createTime = DateFormater.jsonToDateTime(json['createTime'] as String?)
  ..updateTime = DateFormater.jsonToDateTime(json['updateTime'] as String?)
  ..updateBy = json['updateBy'] as String?
  ..createBy = json['createBy'] as String?
  ..baseId = (json['baseId'] as num?)?.toInt()
  ..baseName = json['baseName'] as String?
  ..baseCode = json['baseCode'] as String?
  ..fileSpaceSize = (json['fileSpaceSize'] as num?)?.toInt()
  ..maxFileSpaceSize = (json['maxFileSpaceSize'] as num?)?.toInt()
  ..cover = json['cover'] == null
      ? null
      : FileInfo.fromJson(json['cover'] as Map<String, dynamic>)
  ..remark = json['remark'] as String?
  ..state = $enumDecodeNullable(_$StateEnumMap, json['state'])
  ..language = json['language'] as String?
  ..category = json['category'] == null
      ? null
      : Diction.fromJson(json['category'] as Map<String, dynamic>)
  ..metadata = json['metadata'] as Map<String, dynamic>?
  ..fileCount = (json['fileCount'] as num).toInt()
  ..sharedCount = (json['sharedCount'] as num?)?.toInt()
  ..readable = json['readable'] as bool
  ..creatable = json['creatable'] as bool
  ..editable = json['editable'] as bool
  ..deletable = json['deletable'] as bool
  ..fileEntities = (json['fileEntities'] as List<dynamic>?)
      ?.map((e) => FileEntity.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FileBaseToJson(FileBase instance) => <String, dynamic>{
      'createTime': DateFormater.dateTimeToJson(instance.createTime),
      'updateTime': DateFormater.dateTimeToJson(instance.updateTime),
      'updateBy': instance.updateBy,
      'createBy': instance.createBy,
      'baseId': instance.baseId,
      'baseName': instance.baseName,
      'baseCode': instance.baseCode,
      'fileSpaceSize': instance.fileSpaceSize,
      'maxFileSpaceSize': instance.maxFileSpaceSize,
      'cover': instance.cover,
      'remark': instance.remark,
      'state': _$StateEnumMap[instance.state],
      'language': instance.language,
      'category': instance.category,
      'metadata': instance.metadata,
      'fileCount': instance.fileCount,
      'sharedCount': instance.sharedCount,
      'readable': instance.readable,
      'creatable': instance.creatable,
      'editable': instance.editable,
      'deletable': instance.deletable,
      'fileEntities': instance.fileEntities,
    };

const _$StateEnumMap = {
  State.DISABLED: 'DISABLED',
  State.PRIVATE: 'PRIVATE',
  State.SHARED_GLOBAL: 'SHARED_GLOBAL',
  State.SHARED_SCOPE: 'SHARED_SCOPE',
};
