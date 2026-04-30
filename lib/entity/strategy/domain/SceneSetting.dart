import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './FanSchedule.dart';
import './VentSchedule.dart';
// region 前端扩展导入包
import '../entity/Scene.dart';
// endregion

part 'SceneSetting.g.dart';
@JsonSerializable()
class SceneSetting {
   SceneSetting({
       this.modeEnable = 0,
       this.dim1Per = 50,
       this.dim2Per = 70,
       this.dim3Per = 100,
       this.schEnable = 0,
       this.schStartTime = 8*60*60,
       this.schEndTime = 18*60*60,
       this.schStartDate,
       this.schEndDate,
       this.ventSch1,
       this.ventSch2,
       this.ventSch3,
       this.fanSch1,
       this.fanSch2,
       this.fanSch3,
   }){}
    int modeEnable;
    int dim1Per;
    int dim2Per;
    int dim3Per;
    int schEnable;
    int schStartTime;
    int schEndTime;
    String? schStartDate;
    String? schEndDate;
    VentSchedule? ventSch1;
    VentSchedule? ventSch2;
    VentSchedule? ventSch3;
    FanSchedule? fanSch1;
    FanSchedule? fanSch2;
    FanSchedule? fanSch3;
   factory SceneSetting.fromJson(Map<String, dynamic> json) => _$SceneSettingFromJson(json);
   Map<String, dynamic> toJson() => _$SceneSettingToJson(this);

    // region 前端扩展定义属性及方法区
   List<DateTime> getSettingDateTimes() {
     List<DateTime> value = [];
     value.add(DateFormater.parseDate(schStartDate, "yyyy/MM/dd")?? DateTime.now());
     value.add(DateFormater.parseDate(schEndDate, "yyyy/MM/dd")?? DateTime.now());
     return value;
   }
    // endregion
}

enum SettingType {
    /// 播种
   SEEDING,
    /// 生长
   VEGETATIVE,
    /// 开花
   FLOWERING
}

    // region 前端扩展代码区
extension SettingTypeExtension on SettingType {
  SceneSetting? sceneSetting(Scene scene) {
    switch (this) {
      case SettingType.SEEDING:
        return scene.seedingParam;
      case SettingType.VEGETATIVE:
        return scene.vegetativeParam;
      case SettingType.FLOWERING:
        return scene.floweringParam;
    }
  }
}
    // endregion
