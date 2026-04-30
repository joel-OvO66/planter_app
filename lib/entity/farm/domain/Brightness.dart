import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
import 'package:planter_app/entity/strategy/entity/Point.dart';
// endregion

part 'Brightness.g.dart';
@JsonSerializable()
class Brightness {
   Brightness({
       this.shutdownTemp = 0,
       this.sunriseDay = 0,
       this.dimmingTemp = 0,
       this.points,
   }){}
    int shutdownTemp;
    int sunriseDay;
    int dimmingTemp;
    List<Point>? points;
   factory Brightness.fromJson(Map<String, dynamic> json) => _$BrightnessFromJson(json);
   Map<String, dynamic> toJson() => _$BrightnessToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
