import 'package:flutter/material.dart';
import 'package:tornado/theme.dart';

class FormItemContainer extends StatelessWidget {
  /**
   * 控件
   */
  Widget control;

  /**
   * 标题
   */
  String? label;

  /**
   * 是否必填
   */
  bool required;

  FormItemContainer({Key? key, this.label, this.required = false, required this.control}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ThemeColor.borderColor, width: 1))),
        child: _buildItem(context));
  }

  Widget _buildItem(BuildContext context) {
    if (label != null) {
      return Column(
        children: [Container(margin: EdgeInsets.only(left: 20, top: 12), child: _buildLabel(context)), control],
      );
    } else {
      return control;
    }
  }

  Widget _buildLabel(BuildContext context) {
    if (required) {
      return Row(
        children: [Text(label!, style: Theme.of(context).textTheme.labelSmall), Text('* ', style: TextStyle(color: Colors.red))],
      );
    } else {
      return Row(
        children: [Text(label!, style: Theme.of(context).textTheme.labelSmall)],
      );
    }
  }
}
