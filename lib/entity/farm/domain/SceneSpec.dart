import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './Spectrum.dart';
import './Brightness.dart';
// region 前端扩展导入包
// endregion

part 'SceneSpec.g.dart';
@JsonSerializable()
class SceneSpec {
   SceneSpec({
       this.name,
       this.brightness,
       this.sceneType = 0,
       this.spectrum,
   }){}
    String? name;
    Brightness? brightness;
    int sceneType;
    Spectrum? spectrum;
   factory SceneSpec.fromJson(Map<String, dynamic> json) => _$SceneSpecFromJson(json);
   Map<String, dynamic> toJson() => _$SceneSpecToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
