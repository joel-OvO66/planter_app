import 'package:json_annotation/json_annotation.dart';

part 'TaskForm.g.dart';

@JsonSerializable()
class TaskForm {
    TaskForm() {}



    String? taskId;
    String? assignee;
    String? condition;
    String? comment;
    bool? initiator;
    String? processInstanceId;
    Map<String, dynamic>? formData;

    /**
     * 自行分配用户
     */
    Map<String, dynamic>? assignees;
    String? taskData;

    factory TaskForm.fromJson(Map<String, dynamic> json) => _$TaskFormFromJson(json);

    Map<String, dynamic> toJson() => _$TaskFormToJson(this);
}

class Condition{
    static String AGREE = "agree";
    static String REJECT = "reject";
}