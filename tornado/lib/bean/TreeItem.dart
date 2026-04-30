import 'package:json_annotation/json_annotation.dart';

part 'TreeItem.g.dart';

@JsonSerializable()
class TreeItem {

  TreeItem() {}
  /**
   * 整个树范围内的所有节点的 key 值不能重复且不为空！
   */
  String? key;

  /**
   * 标题
   */
  String? title;

  /**
   * 节点前的图标，与 nzShowIcon 组合使用
   */
  String? icon;

  /**
   * 设置为叶子节点(叶子节点不可被拖拽模式放置)
   */
  bool isLeaf = true;

  /**
   * 设置节点 Checkbox 是否选中
   */
  bool checked=false;

  /**
   * 设置节点本身是否选中
   */
  bool selected=false;

  /**
   * 设置节点是否展开(叶子节点无效)
   */
  bool expanded=false;

  /**
   * 设置节点是否可被选中
   */
  bool selectable = true;

  /**
   * 设置是否禁用节点(不可进行任何操作)
   */
  bool disabled = false;

  /**
   * 设置节点禁用 Checkbox
   */
  bool disableCheckbox = false;

  /**
   * 子节点
   */
  List<TreeItem>? children;

  /**
   * 类型，扩展字段
   */
  String? type;

  /**
   * 上级key,扩展字段
   */
  String? parentKey;

  /**
   * 层级编码，扩展字段
   */
  String? layerCode;

  /**
   * 自定义属性字段
   */
  Map<String, dynamic>? data;

  factory TreeItem.fromJson(Map<String, dynamic> json) => _$TreeItemFromJson(json);

  Map<String, dynamic> toJson() => _$TreeItemToJson(this);
}
