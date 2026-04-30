import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'Spectrum.g.dart';
@JsonSerializable()
class Spectrum {
   Spectrum({
       this.dim1 = 0,
       this.dim2 = 0,
   }){}
    int dim1;
    int dim2;
   factory Spectrum.fromJson(Map<String, dynamic> json) => _$SpectrumFromJson(json);
   Map<String, dynamic> toJson() => _$SpectrumToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
