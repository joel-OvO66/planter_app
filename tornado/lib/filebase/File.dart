import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/filebase/FileBase.dart';
import 'package:tornado/filebase/Folder.dart';

import '../util/DateFormater.dart';
import 'FileEntity.dart';

part 'File.g.dart';

/**
 * 文件(File)实体类
 *
 */
@JsonSerializable()
class File extends FileEntity {
  File() {}

  /**
   * 文件大小
   */
  int? fileSize;

  /**
   * 文件类型
   */
  String? fileType;

  /**
   * 文件版本
   */
  int? fileVersion;

  /**
   * 存储路径
   */
  String? storagePath;

  /**
   * 预览路径
   */
  String? previewPath;

  /**
   * 缩略图路径
   */
  String? thumbPath;

  /**
   * 缩略图url
   */
  String? thumbUrl;
  /**
   * 原文件下载url
   */
  String? fileUrl;

  /**
   * 文件预览url
   */
  String? previewUrl;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);

  static String formatFileSize(int bytes) {
    const units = ['B', 'K', 'M', 'G', 'T'];
    double size = bytes.toDouble();
    int unitIndex = 0;

    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }
    if (size != 0) {
      return "${size.toStringAsFixed(2)} ${units[unitIndex]}";
    } else {
      return "0 K";
    }
  }

  bool isImage() {
    if (fileType == null || fileType!.length == 0) {
      return false;
    }
    String lower = this.fileType!.toLowerCase();
    return "png" == lower || "jpg" == lower || "jpeg" == lower || "gif" == lower;
  }
}
