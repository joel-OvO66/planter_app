import 'package:json_annotation/json_annotation.dart';

part 'ProcessDefinitionInfo.g.dart';
@JsonSerializable()
class ProcessDefinitionInfo   {
  ProcessDefinitionInfo() {}

  String? id;
  String? category;
  String? name;
  String? key;
  String? description;
  int? version;
  String? deploymentId;
  String? resourceName;
  String? diagramResourceName;
  bool? hasStartFormKey;
  bool? graphicalNotation;
  bool? suspended;
  String? tenantId;
  String? engineVersion;

  factory ProcessDefinitionInfo.fromJson(Map<String, dynamic> json) => _$ProcessDefinitionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessDefinitionInfoToJson(this);
}
