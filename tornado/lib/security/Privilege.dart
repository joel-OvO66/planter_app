import 'package:json_annotation/json_annotation.dart';

part 'Privilege.g.dart';

@JsonSerializable()
class Privilege {
  String? code;
  String? name;
  String? type;
  String? value;
  String? link;
  String? cssClass;
  String? childrenCssClass;
  List<Privilege>? children;
  Privilege() {}
  factory Privilege.fromJson(Map<String, dynamic> json) => _$PrivilegeFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeToJson(this);
}
