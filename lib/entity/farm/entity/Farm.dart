import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import '../../farm/domain/LatLng.dart';
import '../../security/entity/User.dart';
// region 前端扩展导入包
// endregion

part 'Farm.g.dart';

/// 厂区
@JsonSerializable()
class Farm extends AuditingEntity {
  Farm({
    this.tenantId = 0,
    this.tenantName,
    this.address,
    this.enabled = false,
    this.remark,
    this.deleted = false,
    this.latLng,
  }) {}

  /// 无注释
  int tenantId;

  /// 工厂名称
  String? tenantName;

  /// 地址
  String? address;

  /// 是否启用
  bool enabled;
  String? remark;
  bool deleted;

  /// 临时字段：坐标
  LatLng? latLng;
  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
  Map<String, dynamic> toJson() => _$FarmToJson(this);

  // region 前端扩展定义属性及方法区
  LatLng? point;

  void copy(Farm farm) {
    tenantName = farm.tenantName;
    address = farm.address;
    remark = farm.remark;
  }
  // endregion
}

// region 前端扩展代码区
// endregion
