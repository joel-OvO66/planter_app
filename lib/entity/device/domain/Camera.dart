import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'Camera.g.dart';
@JsonSerializable()
class Camera {
   Camera({
       this.cameraName,
       this.playUrl,
       this.cameraType,
   }){}
    String? cameraName;
    String? playUrl;
    String? cameraType;
   factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);
   Map<String, dynamic> toJson() => _$CameraToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
