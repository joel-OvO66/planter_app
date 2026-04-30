import 'package:json_annotation/json_annotation.dart';

part 'ModelInfo.g.dart';
@JsonSerializable()
class ModelInfo  {
  ModelInfo() {}

  String? id;
  String? name;
  String? key;
  String? category;
  DateTime? createTime;
  DateTime? lastUpdateTime;
  int? version;
  String? metaInfo;
  String? deploymentId;
  String? tenantId;
  bool? hasEditorSource;
  bool? hasEditorSourceExtra;

  factory ModelInfo.fromJson(Map<String, dynamic> json) => _$ModelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ModelInfoToJson(this);
}
