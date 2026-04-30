
import 'package:json_annotation/json_annotation.dart';

part 'TaskInfo.g.dart';

@JsonSerializable()
class TaskInfo {

    TaskInfo(){}

    /**
     * 任务Id
     */
    String? id;

    /**
     * 任务名称
     */
    String? name;

    /**
     * 任务来源 Key
     */
    String? formKey;

    /**
     * 委派此任务的人员
     */
    String? assignee;

    /**
     * 流程下一个预选人
     */
    String? nextAssignee;

    /**
     * 负责此任务的人员
     */
    String? owner;

    /**
     * 任务执行Id
     */
    String? executionId;

    /**
     * 任务创建时间
     */
    DateTime? createTime;

    /**
     * 是否结束
     */
    bool? end;

    /**
     * 任务的类别。这是一个可选字段，允许“标记”属于某个类别的任务。
     */
    String? category;

    /**
     * 任务的自由文本描述
     */
    String? description;

    /**
     * 任务的截止日期。
     */
    String? dueDate;

    /**
     * 此任务是子任务的父任务
     */
    String? parentTaskId;

    /**
     * 任务是否挂起
     */
    bool? suspended;

    /**
     * 流程实例Id
     */
    String? processInstanceId;

    /**
     * 流程定义Id
     */
    String? processDefinitionId;

    /**
     * 定义此任务的流程中活动的ID
     */
    String? taskDefinitionKey;

    /**
     * 此任务的租户标识符
     */
    String? tenantId;

    /**
     * 业务key
     */
    String? businessKey;

    /**
     * 流程定义key
     */
    String? processDefinitionKey;

    /**
     * 流程定义名称
     */
    String? processDefinitionName;

    /**
     * 流程定义版本
     */
    int? processDefinitionVersion;

    /**
     * 发起人
     */
    String? startUserId;

    DateTime? processStartTime;

    /**
     * 流程实例名称
     */
    String? processInstanceName;


    DateTime? claimTime;

    /**
     * 业务数据
     */
    dynamic? data;

    factory TaskInfo.fromJson(Map<String, dynamic> json) => _$TaskInfoFromJson(json);

    Map<String, dynamic> toJson() => _$TaskInfoToJson(this);
}
