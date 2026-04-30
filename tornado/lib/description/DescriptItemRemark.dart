import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tornado/theme.dart';

class DescriptionItemRemark extends StatelessWidget {
  final String label;
  final String? remark;

  DescriptionItemRemark(this.label, this.remark);

  Widget build(BuildContext context) {
    return Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: EdgeInsets.only(top: 10, bottom: 10, left: 16), child: Text(label, style: Theme.of(context).textTheme.labelMedium)),
        Container(
          width: MediaQuery.of(context).size.width - 14,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Text(remark != null ? remark! : '暂无', style: Theme.of(context).textTheme.labelMedium),
        )
      ])
    ]);
  }
}
