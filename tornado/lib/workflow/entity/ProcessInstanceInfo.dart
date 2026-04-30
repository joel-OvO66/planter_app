import 'package:json_annotation/json_annotation.dart';

part 'ProcessInstanceInfo.g.dart';
@JsonSerializable()
class ProcessInstanceInfo   {
  ProcessInstanceInfo() {}

  String? processInstanceId;
  String? processDefinitionId;
  String? processDefinitionName;
  String? processDefinitionKey;
  int? processDefinitionVersion;
  String? deploymentId;
  String? businessKey;
  bool? suspended;
  Map<String, Object>? processVariables;
  String? tenantId;
  String? name;
  String? description;
  String? localizedName;
  String? localizedDescription;
  DateTime? startTime;
  String? startUserId;

  factory ProcessInstanceInfo.fromJson(Map<String, dynamic> json) => _$ProcessInstanceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessInstanceInfoToJson(this);
}
