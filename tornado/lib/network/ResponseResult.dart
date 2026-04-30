import 'package:json_annotation/json_annotation.dart';
/**
 * 错误返回信息
 */
part 'ResponseResult.g.dart';

@JsonSerializable()
class ResponseResult {
  /**
   * 错误代码
   */
  String? code;

  /**
   * 错误消息
   */
  String? message;

  ResponseResult({this.code, this.message}) {}

  factory ResponseResult.fromJson(Map<String, dynamic> json) => _$ResponseResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseResultToJson(this);
}
