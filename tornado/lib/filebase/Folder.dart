import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/filebase/FileBase.dart';

import '../util/DateFormater.dart';
import 'FileEntity.dart';

part 'Folder.g.dart';

/**
 * 文件夹(Folder)实体类
 *
 */
@JsonSerializable()
class Folder extends FileEntity {
  Folder() {}

  /**
   * 文件夹大小
   */
  int? fileSize;

  /**
   * 同级排序
   */
  int? sortIndex;

  /**
   * 子文件
   */
  List<FileEntity>? fileEntities;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);
}
