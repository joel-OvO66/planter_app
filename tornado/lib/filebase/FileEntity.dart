import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/orm/AuditingEntity.dart';

import '../util/DateFormater.dart';
import 'File.dart';
import 'FileBase.dart';
import 'Folder.dart';

part 'FileEntity.g.dart';

/**
 * 文件对象(FileEntity)实体类
 *
 */
@JsonSerializable()
class FileEntity extends AuditingEntity {
  FileEntity() {}

  /**
   * FOT_ID
   */
  int? fotId;

  /**
   * BASE_ID
   */
  FileBase? fileBase;

  /**
   * 父文件ID
   */
  Folder? folder;

  /**
   * 文件名称
   */
  String? name;

  /**
   * 文件描述
   */
  String? remark;

  /**
   * 上否为文件
   */
  bool directory = true;

  /**
   * 是否被选中
   */
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool checked = false;

  factory FileEntity.fromJson(Map<String, dynamic> json) => (json['directory'] as bool) ? Folder.fromJson(json) : File.fromJson(json);

  Map<String, dynamic> toJson() => _$FileEntityToJson(this);
}
