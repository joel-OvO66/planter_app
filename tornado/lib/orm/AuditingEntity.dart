import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';

part 'AuditingEntity.g.dart';

@JsonSerializable()
class AuditingEntity {
  AuditingEntity() {}

  /**
   * 创建时间
   */
  @JsonKey(toJson: DateFormater.dateTimeToJson, fromJson: DateFormater.jsonToDateTime)
  DateTime? createTime;

  /**
   * 修改时间
   */
  @JsonKey(toJson: DateFormater.dateTimeToJson, fromJson: DateFormater.jsonToDateTime)
  DateTime? updateTime;

  /**
   * 最后修改人
   */
  String? updateBy;

  /**
   * 创建人
   */
  String? createBy;

  factory AuditingEntity.fromJson(Map<String, dynamic> json) => _$AuditingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuditingEntityToJson(this);
}
