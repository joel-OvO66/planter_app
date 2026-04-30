import 'package:json_annotation/json_annotation.dart';

import 'ResponseResult.dart';
/**
 * 错误返回信息
 */
part 'ErrorResponse.g.dart';

@JsonSerializable()
class ErrorResponse extends ResponseResult {
  /**
   * 错误类型
   */
  Type? type;

  /**
   * 错误值
   */
  Object? value;

  ErrorResponse() {}

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

enum Type {
  /**
   * 数据找不到
   */
  NOT_FOUND,
  /**
   * 数据已删除
   */
  DELETED,
  /**
   * 字段错误
   */
  FIELD,
  /**
   * 数据库异常
   */
  SQL,
  /**
   * 业务逻辑错误
   */
  BUSINESS
}
