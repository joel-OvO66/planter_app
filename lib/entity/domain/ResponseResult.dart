import 'package:json_annotation/json_annotation.dart';
// region 前端扩展导入包
// endregion

part 'ResponseResult.g.dart';

@JsonSerializable()
class ResponseResult {
  ResponseResult({
    required this.result,
    required this.errorCode,
    this.data,
  }) {}
  Result result;
  String? errorCode;
  dynamic data;

  factory ResponseResult.fromJson(Map<String, dynamic> json) => _$ResponseResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseResultToJson(this);
}

enum Result {
  SUCCESS,
  FAILURE;
}
