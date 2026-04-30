import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/theme.dart';

class DescriptionItemRemark extends StatelessWidget {
  final String label;
  final String? remark;
  final double? left;

  DescriptionItemRemark(this.label, this.remark, {this.left});

  Widget build(BuildContext context) {
    return Row(children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
              padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: left ?? 0.sp),
              child: Text(label, style: Theme.of(context).textTheme.labelLarge,)
          ),
          Container(
                width: MediaQuery.of(context).size.width - 30,
                padding: EdgeInsets.only(left: left ?? 28.sp, right: 16, bottom: 16),
                child: Text(remark ?? '暂无', style: Theme.of(context).textTheme.bodyMedium, ),
          ),
      ])
    ]);
  }
}
