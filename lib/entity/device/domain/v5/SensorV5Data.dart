import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import '../../../strategy/domain/SceneSetting.dart';
import './FanState.dart';
import './LightRunningState.dart';
import './TempState.dart';
import './GlobalParam.dart';
import '../../../strategy/domain/ManModeParam.dart';
// region 前端扩展导入包
// endregion

part 'SensorV5Data.g.dart';
@JsonSerializable()
class SensorV5Data {
   SensorV5Data({
       this.lightRunningState,
       this.manModeParam,
       this.globalParam,
       this.seedingParam,
       this.vegetativeParam,
       this.floweringParam,
       this.fanState1,
       this.fanState2,
       this.venState,
       this.tempState1,
       this.tempState2,
   }){}
    LightRunningState? lightRunningState;
    ManModeParam? manModeParam;
    GlobalParam? globalParam;
    SceneSetting? seedingParam;
    SceneSetting? vegetativeParam;
    SceneSetting? floweringParam;
    FanState? fanState1;
    FanState? fanState2;
    FanState? venState;
    TempState? tempState1;
    TempState? tempState2;
   factory SensorV5Data.fromJson(Map<String, dynamic> json) => _$SensorV5DataFromJson(json);
   Map<String, dynamic> toJson() => _$SensorV5DataToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
