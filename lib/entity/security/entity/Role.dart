import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './User.dart';
import './Permission.dart';
// region 前端扩展导入包
// endregion

part 'Role.g.dart';
    /// 系统角色
@JsonSerializable()
class Role extends AuditingEntity {
   Role({
       this.roleId = 0,
       this.roleCode,
       this.roleName,
       this.enabled = false,
       this.remark,
       this.users,
       this.privilegeCodes,
   }){}
    /// 角色ID
    int roleId;
    /// 角色编码
    String? roleCode;
    /// 角色名称
    String? roleName;
    /// 启用/停用
    bool enabled;
    /// 备注
    String? remark;
    /// 角色下的用户
    List<User>? users;
    /// 资源编码
    List<String>? privilegeCodes;
   factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
   Map<String, dynamic> toJson() => _$RoleToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

enum DefaultRole {
    /// 默认角色
   STAFF,
    /// 保养人员
   MAINTAIN_USER,
    /// 维修人员
   REPAIR_USER,
    /// 精密度检查人员
   PRECISE_USER,
    /// 厂区管理员
   MANAGER,
    /// 系统管理员
   ADMIN
}

    // region 前端扩展代码区
    // endregion
