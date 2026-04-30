import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'SensorRecord.g.dart';
@JsonSerializable()
class SensorRecord {
   SensorRecord({
       this.id,
       this.deviceId,
       this.deviceName,
       this.type,
       this.value,
       this.formatValue,
       this.createTime,
       this.timestamp,
   }){}
    String? id;
    String? deviceId;
    String? deviceName;
    Type? type;
    Object? value;
    Object? formatValue;
    @JsonKey(toJson: DateFormater.dateTimeNoSecondToJson,fromJson: DateFormater.jsonToDateTimeNoSecond)
    DateTime? createTime;
    @JsonKey(toJson: DateFormater.dateTimeNoSecondToJson,fromJson: DateFormater.jsonToDateTimeNoSecond)
    DateTime? timestamp;
   factory SensorRecord.fromJson(Map<String, dynamic> json) => _$SensorRecordFromJson(json);
   Map<String, dynamic> toJson() => _$SensorRecordToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
enum Type {
  INTEGER,
  LONG,
  FLOAT,
  DOUBLE,
  TEXT,
  BOOLEAN,
  DATE,
  ENUM,
  ARRAY,
  GEO,
  OBJECT;
}
    // endregion
