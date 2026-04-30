import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/workflow/entity/TaskInfo.dart';

part 'HistoricTaskInstanceInfo.g.dart';
@JsonSerializable()
class HistoricTaskInstanceInfo  extends TaskInfo {
  HistoricTaskInstanceInfo() {}

  String? deleteReason;
  DateTime? startTime;
  DateTime? endTime;
  int? durationInMillis;
  int? workTimeInMillis;

  factory HistoricTaskInstanceInfo.fromJson(Map<String, dynamic> json) => _$HistoricTaskInstanceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricTaskInstanceInfoToJson(this);
}
