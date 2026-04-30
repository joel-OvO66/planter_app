// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FileInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) => FileInfo()
  ..uid = json['uid'] as String?
  ..name = json['name'] as String?
  ..status = json['status'] as String?
  ..response = json['response'] as String?
  ..filePath = json['filePath'] as String?
  ..url = json['url'] as String?
  ..thumbUrl = json['thumbUrl'] as String?
  ..thumbPath = json['thumbPath'] as String?
  ..size = (json['size'] as num?)?.toInt()
  ..lastModified = json['lastModified'] as String?
  ..lastModifiedDate =
      DateFormater.jsonToDateTimeNoSecond(json['lastModifiedDate'] as String?)
  ..linkProps = json['linkProps'];

Map<String, dynamic> _$FileInfoToJson(FileInfo instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'status': instance.status,
      'response': instance.response,
      'filePath': instance.filePath,
      'url': instance.url,
      'thumbUrl': instance.thumbUrl,
      'thumbPath': instance.thumbPath,
      'size': instance.size,
      'lastModified': instance.lastModified,
      'lastModifiedDate':
          DateFormater.dateTimeToJson(instance.lastModifiedDate),
      'linkProps': instance.linkProps,
    };
