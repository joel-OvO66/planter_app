// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TreeItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeItem _$TreeItemFromJson(Map<String, dynamic> json) => TreeItem()
  ..key = json['key'] as String?
  ..title = json['title'] as String?
  ..icon = json['icon'] as String?
  ..isLeaf = json['isLeaf'] as bool
  ..checked = json['checked'] as bool
  ..selected = json['selected'] as bool
  ..expanded = json['expanded'] as bool
  ..selectable = json['selectable'] as bool
  ..disabled = json['disabled'] as bool
  ..disableCheckbox = json['disableCheckbox'] as bool
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) => TreeItem.fromJson(e as Map<String, dynamic>))
      .toList()
  ..type = json['type'] as String?
  ..parentKey = json['parentKey'] as String?
  ..layerCode = json['layerCode'] as String?
  ..data = json['data'] as Map<String, dynamic>?;

Map<String, dynamic> _$TreeItemToJson(TreeItem instance) => <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'icon': instance.icon,
      'isLeaf': instance.isLeaf,
      'checked': instance.checked,
      'selected': instance.selected,
      'expanded': instance.expanded,
      'selectable': instance.selectable,
      'disabled': instance.disabled,
      'disableCheckbox': instance.disableCheckbox,
      'children': instance.children,
      'type': instance.type,
      'parentKey': instance.parentKey,
      'layerCode': instance.layerCode,
      'data': instance.data,
    };
