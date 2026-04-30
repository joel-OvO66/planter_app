import 'package:json_annotation/json_annotation.dart';

part 'HistoricProcessInstanceInfo.g.dart';
@JsonSerializable()
class HistoricProcessInstanceInfo   {
  HistoricProcessInstanceInfo() {}

  String? id;

  String? businessKey;

  String? processDefinitionId;

  String? processDefinitionName;

  String? processDefinitionKey;

  int? processDefinitionVersion;

  String? deploymentId;

  DateTime? startTime;

  DateTime? endTime;

  int? durationInMillis;

  String? endActivityId;

  String? startUserId;

  String? startActivityId;

  String? deleteReason;

  String? superProcessInstanceId;

  String? tenantId;

  String? name;

  String? description;

  String? processInstanceId;

  Map<String, Object>? processVariables;

  /**
   * 业务数据
   */
  dynamic? data;

  factory HistoricProcessInstanceInfo.fromJson(Map<String, dynamic> json) => _$HistoricProcessInstanceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricProcessInstanceInfoToJson(this);
}
