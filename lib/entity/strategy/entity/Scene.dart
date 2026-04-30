import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import '../../strategy/domain/SceneSetting.dart';
import '../../farm/entity/Room.dart';
import '../../strategy/domain/ManModeParam.dart';
// region 前端扩展导入包
import 'package:planter_app/entity/strategy/entity/Point.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../farm/entity/Room.dart';
import '../../strategy/domain/ManModeParam.dart';
import '../../strategy/domain/SceneSetting.dart';
// endregion

part 'Scene.g.dart';
@JsonSerializable()
class Scene extends AuditingEntity {
   Scene({
       this.sceneId = 0,
       this.sceneName,
       this.room,
       this.sceneIndex = 0,
       this.shutdownTemp = 0,
       this.sunriseDay = 0,
       this.dimmingTemp = 0,
       this.brightnessPoints,
       this.spectrumDim1 = 0,
       this.spectrumDim2 = 0,
       this.remark,
       this.manModeParam,
       this.seedingParam,
       this.vegetativeParam,
       this.floweringParam,
       this.settingType,
   }){}
    int sceneId;
    /// 场景名称
    String? sceneName;
    /// 房间
    Room? room;
    /// 序号
    int sceneIndex;
    int shutdownTemp;
    int sunriseDay;
    int dimmingTemp;
    List<Point>? brightnessPoints;
    int spectrumDim1;
    int spectrumDim2;
    String? remark;
    ManModeParam? manModeParam;
    SceneSetting? seedingParam;
    SceneSetting? vegetativeParam;
    SceneSetting? floweringParam;
    SettingType? settingType;
   factory Scene.fromJson(Map<String, dynamic> json) => _$SceneFromJson(json);
   Map<String, dynamic> toJson() => _$SceneToJson(this);

    // region 前端扩展定义属性及方法区
void setSceneSetting(SettingType settingType, SceneSetting sceneSetting) {
    this.settingType = settingType;
    switch (settingType) {
      case SettingType.SEEDING:
        seedingParam = sceneSetting;
        break;
      case SettingType.VEGETATIVE:
        vegetativeParam = sceneSetting;
        break;
      case SettingType.FLOWERING:
        floweringParam = sceneSetting;
        break;
    }
  }
    // endregion
}

    // region 前端扩展代码区
    // endregion
