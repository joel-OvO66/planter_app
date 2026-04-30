import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/theme.dart';

class DescriptItemExpandableText extends StatelessWidget {
  final String label;
  final String? remark;
  final int maxLines;

  DescriptItemExpandableText(this.label, this.remark, {this.maxLines = 2});

  Widget build(BuildContext context) {
    return Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: 28.sp), child: Text(label, style: Theme.of(context).textTheme.labelLarge)),
        Container(
          width: MediaQuery.of(context).size.width - 4,
          padding: EdgeInsets.only(left: 28.sp, right: 16, bottom: 16),
          child: BrnExpandableText(text: remark ?? "", maxLines: maxLines, textStyle: Theme.of(context).textTheme.labelMedium),
        )
      ])
    ]);
  }
}
