import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import '../../farm/entity/Farm.dart';
import './Role.dart';
// region 前端扩展导入包
// endregion

part 'User.g.dart';
    /// 用户
@JsonSerializable()
class User extends AuditingEntity {
   User({
       this.userId = 0,
       this.userName,
       this.superUser = false,
       this.realName,
       this.avatarUrl,
       this.mobile,
       this.email,
       this.password,
       this.enabled = false,
       this.gender = false,
       this.lastLoginTime,
       this.avatar,
       this.remark,
       this.position,
       this.roles,
       this.farms,
       this.tenantId,
   }){}
    /// Id
    int userId;
    /// 帐号
    String? userName;
    /// 用户是否为超级用户
    bool superUser;
    /// 用户姓名
    String? realName;
    /// 头像链接
    String? avatarUrl;
    /// 手机号码
    String? mobile;
    /// 邮箱
    String? email;
    /// 密码
    String? password;
    /// 启用/停用
    bool enabled;
    /// 性别
    bool gender;
    /// 最后登录时间
    @JsonKey(toJson: DateFormater.dateTimeNoSecondToJson,fromJson: DateFormater.jsonToDateTimeNoSecond)
    DateTime? lastLoginTime;
    /// 用户头像
    FileInfo? avatar;
    /// 备注
    String? remark;
    /// 职位
    String? position;
    /// 角色
    List<Role>? roles;
    /// 所在的工厂
    List<Farm>? farms;
    String? tenantId;
   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
   Map<String, dynamic> toJson() => _$UserToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
