import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/orm/AuditingEntity.dart';

import '../bean/FileInfo.dart';
import '../orm/Diction.dart';
import '../util/DateFormater.dart';
import 'FileEntity.dart';

part 'FileBase.g.dart';

/**
 * 文件库(FileBase)实体类
 *
 */
@JsonSerializable()
class FileBase extends AuditingEntity {
  FileBase() {}

  /**
   * BASE_ID
   */
  int? baseId;

  /**
   * 资料库名称
   */
  String? baseName;

  /**
   * 库编码
   */
  String? baseCode;

  /**
   * 文件占用空间大小(k)
   */
  int? fileSpaceSize;

  /**
   * 最大文件空间大小（0表示不限制)
   */
  int? maxFileSpaceSize;

  /**
   * 封面
   */
  FileInfo? cover;

  /**
   * 备注
   */
  String? remark;

  /**
   * 启用
   */
  State? state;

  /**
   * 语言
   */
  String? language;

  /**
   * 分类
   */
  Diction? category;

  /**
   * 元
   */
  Map<String, dynamic>? metadata;

  /**
   * 文件数量
   */
  int fileCount = 0;

  /**
   * 分享人数
   */
  int? sharedCount = 0;

  /**
   * 可读
   */
  bool readable = true;

  /**
   * 可新建
   */
  bool creatable = true;

  /**
   * 可编辑
   */
  bool editable = true;

  /**
   * 可删除
   */
  bool deletable = true;

  List<FileEntity>? fileEntities;

  factory FileBase.fromJson(Map<String, dynamic> json) => _$FileBaseFromJson(json);

  Map<String, dynamic> toJson() => _$FileBaseToJson(this);
}

enum State {
  /**
   * 禁用
   */
  DISABLED,
  /**
   * 私有
   */
  PRIVATE,
  /**
   * 全局共享
   */
  SHARED_GLOBAL,
  /**
   * 部分共享
   */
  SHARED_SCOPE;
}
