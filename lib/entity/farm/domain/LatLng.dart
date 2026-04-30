import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'LatLng.g.dart';
    /// 位置
@JsonSerializable()
class LatLng {
   LatLng({
       this.lng = 0,
       this.lat = 0,
       this.alt = 0,
   }){}
    double lng;
    double lat;
    double alt;
   factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
   Map<String, dynamic> toJson() => _$LatLngToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
