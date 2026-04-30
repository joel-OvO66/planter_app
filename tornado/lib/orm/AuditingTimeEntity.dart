import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';

part 'AuditingTimeEntity.g.dart';

@JsonSerializable()
class AuditingTimeEntity {
  AuditingTimeEntity() {}

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

  factory AuditingTimeEntity.fromJson(Map<String, dynamic> json) => _$AuditingTimeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuditingTimeEntityToJson(this);
}
