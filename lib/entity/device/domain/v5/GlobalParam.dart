import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'GlobalParam.g.dart';
@JsonSerializable()
class GlobalParam {
   GlobalParam({
       this.runMode = 0,
       this.sysLang = 0,
       this.tempUnit = 0,
       this.lockScreenEn = 0,
       this.lockScreenTime = 0,
       this.keySoundEn = 0,
       this.dataChageFlag = 0,
       this.UI_Ver,
       this.Soft_Ver,
       this.Hard_Ver,
   }){}
    int runMode;
    int sysLang;
    int tempUnit;
    int lockScreenEn;
    int lockScreenTime;
    int keySoundEn;
    int dataChageFlag;
    String? UI_Ver;
    String? Soft_Ver;
    String? Hard_Ver;
   factory GlobalParam.fromJson(Map<String, dynamic> json) => _$GlobalParamFromJson(json);
   Map<String, dynamic> toJson() => _$GlobalParamToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
