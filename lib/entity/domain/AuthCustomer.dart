import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
// region 前端扩展导入包
// endregion

part 'AuthCustomer.g.dart';
@JsonSerializable()
class AuthCustomer {
   AuthCustomer({
       this.id = 0,
       this.name,
       this.email,
       this.password,
       this.avatar,
       this.token,
       this.extend,
   }){}
    /// 帐号ID
    int id;
    /// 帐号名称
    String? name;
    /// 姓名
    String? email;
    /// 密码
    String? password;
    /// 头像地址
    String? avatar;
    /// token
    String? token;
    /// 扩展数据
    Map? extend;
   factory AuthCustomer.fromJson(Map<String, dynamic> json) => _$AuthCustomerFromJson(json);
   Map<String, dynamic> toJson() => _$AuthCustomerToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
