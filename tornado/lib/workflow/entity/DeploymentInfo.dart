import 'package:json_annotation/json_annotation.dart';

import 'ProcessDefinitionInfo.dart';

part 'DeploymentInfo.g.dart';
@JsonSerializable()
class DeploymentInfo  {
  DeploymentInfo() {}

  String? id;

  String? name;

  DateTime? deploymentTime;

  String? category;

  String? key;

  String? tenantId;

  List<ProcessDefinitionInfo>? processDefinitionInfos;

  factory DeploymentInfo.fromJson(Map<String, dynamic> json) => _$DeploymentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentInfoToJson(this);
}
