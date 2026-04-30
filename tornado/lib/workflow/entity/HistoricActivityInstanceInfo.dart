import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/workflow/entity/Comment.dart';

part 'HistoricActivityInstanceInfo.g.dart';

@JsonSerializable()
class HistoricActivityInstanceInfo   {
  HistoricActivityInstanceInfo() {}

  String? id;

  String? activityId;

  String? activityName;

  String? activityType;

  String? processDefinitionId;

  String? processInstanceId;

  String? executionId;

  String? taskId;

  String? calledProcessInstanceId;

  String? assignee;

  DateTime? startTime;

  DateTime? endTime;

  int? durationInMillis;

  String? tenantId;

  String? condition;

  List<Comment>? comments;

  // HistoricActivityInstanceInfo.TaskStatus status;

  factory HistoricActivityInstanceInfo.fromJson(Map<String, dynamic> json) => _$HistoricActivityInstanceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricActivityInstanceInfoToJson(this);

}
