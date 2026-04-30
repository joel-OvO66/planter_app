import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './Role.dart';
// region 前端扩展导入包
// endregion

part 'Permission.g.dart';
    /// 权限管理
@JsonSerializable()
class Permission {
   Permission({
       this.permissionId = 0,
       this.privilegeCode,
       this.role,
   }){}
    /// ID
    int permissionId;
    /// 资源编码
    String? privilegeCode;
    /// 角色
    Role? role;
   factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
   Map<String, dynamic> toJson() => _$PermissionToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
