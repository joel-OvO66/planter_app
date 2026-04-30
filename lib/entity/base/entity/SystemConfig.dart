import 'package:json_annotation/json_annotation.dart';
// region 前端扩展导入包
// endregion

part 'SystemConfig.g.dart';
@JsonSerializable()
class SystemConfig {
   SystemConfig({
       this.systemName,
       this.systemDescription,
       this.logo,
       this.recordNumber,
       this.appUrl,
       this.appVersion,
       this.iosAppId,
       this.qrCodeUrl,
       this.minVersion,
       this.maxVersion,
   }){}
    /// 系统名称
    String? systemName;
    /// 系统描述
    String? systemDescription;
    /// 系统logo
    String? logo;
    /// 备案号
    String? recordNumber;
    /// app 下载地址
    String? appUrl;
    String? appVersion;
    /// 苹果的app store Id，上架后获取
    String? iosAppId;
    /// app 二维码图片
    String? qrCodeUrl;
    /// 最低支持版本
    String? minVersion;
    /// 最新版本
    String? maxVersion;
   factory SystemConfig.fromJson(Map<String, dynamic> json) => _$SystemConfigFromJson(json);
   Map<String, dynamic> toJson() => _$SystemConfigToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
