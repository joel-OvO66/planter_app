import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './SensorRecord.dart';
// region 前端扩展导入包
// endregion

part 'SensorData.g.dart';
@JsonSerializable()
class SensorData {
   SensorData({
       this.temperatures,
       this.humidities,
       this.co2s,
       this.phs,
       this.illuminances,
       this.ecs,
       this.atms,
   }){}
    /// 温度
    List<SensorRecord>? temperatures;
    /// 湿度
    List<SensorRecord>? humidities;
    /// 二氧化碳
    List<SensorRecord>? co2s;
    /// 光照度
    List<SensorRecord>? phs;
    /// 光照度
    List<SensorRecord>? illuminances;
    /// EC值
    List<SensorRecord>? ecs;
    /// 大气压
    List<SensorRecord>? atms;
   factory SensorData.fromJson(Map<String, dynamic> json) => _$SensorDataFromJson(json);
   Map<String, dynamic> toJson() => _$SensorDataToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
