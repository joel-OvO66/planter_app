// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Privilege.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Privilege _$PrivilegeFromJson(Map<String, dynamic> json) => Privilege()
  ..code = json['code'] as String?
  ..name = json['name'] as String?
  ..type = json['type'] as String?
  ..value = json['value'] as String?
  ..link = json['link'] as String?
  ..cssClass = json['cssClass'] as String?
  ..childrenCssClass = json['childrenCssClass'] as String?
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) => Privilege.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PrivilegeToJson(Privilege instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'link': instance.link,
      'cssClass': instance.cssClass,
      'childrenCssClass': instance.childrenCssClass,
      'children': instance.children,
    };
