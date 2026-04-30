import 'package:json_annotation/json_annotation.dart';

import '../util/DateFormater.dart';

part 'FileInfo.g.dart';

@JsonSerializable()
class FileInfo {
  FileInfo() {}

  /**
   * UID
   */
  String? uid;

  /**
   * 文件原名称
   */
  String? name;

  /**
   * uploading done error removed
   */
  String? status;

  /**
   * 服务端返回错误信息
   */
  String? response;

  /**
   * 文件存储相对路径，前缀没有"/"
   */
  String? filePath;

  /**
   * 文件下载地址
   */
  String? url;

  /**
   * 文件预览url,主要是 office文件和图片
   */
  String? thumbUrl;

  /**
   * 预览文件存储相对路径
   */
  String? thumbPath;

  /**
   * 文件大小
   */
  int? size;

  /**
   * 最后修改人
   */
  String? lastModified;

  /**
   * 最后修改时间
   */
  @JsonKey(toJson: DateFormater.dateTimeToJson, fromJson: DateFormater.jsonToDateTimeNoSecond)
  DateTime? lastModifiedDate;

  /**
   * 下载链接额外的 HTML 属性
   */
  var linkProps;

  String get extension {
    if (name == null) return "";
    int index = name!.lastIndexOf(".");
    if (index >= 0) {
      return name!.substring(index + 1);
    }
    return "";
  }

  factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
}
