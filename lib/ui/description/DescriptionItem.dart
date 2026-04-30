import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/theme.dart';
import 'package:tornado/widget/OutlineChip.dart';

class DescriptionItem extends StatelessWidget {
  final String label;
  final String? text;
  bool? tag;
  Widget? extra;
  GestureTapCallback? onTap;
  Color? chipColor;
  bool? noDivider;
  Color? labelColor;

  final EdgeInsetsGeometry? margin;

  DescriptionItem(this.label, this.text, {this.tag, this.margin, this.extra, this.chipColor, this.labelColor = Colors.blue, this.onTap, this.noDivider});

  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: Column(
          children: [
            InkWell(
                onTap: onTap,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //左侧lable
                  Container(
                    padding: EdgeInsets.only(top: 18.sp, bottom: 18.sp),
                    child: Text(label, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium),
                  ),
                  //左侧tag标签，文字，按钮
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 16),
                    child: tag != null && tag!
                        ? Container(transform: Matrix4.translationValues(6, 0, 0), child: OutlineChip(text ?? "", color: chipColor))
                        : (extra != null
                            ? extra
                            : Text(text ?? "",
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: onTap != null ? labelColor : Colors.black54, overflow: TextOverflow.clip))),
                  ))
                ])),
            //最后一行可以不需要分割线
            noDivider != null ? Divider(height: 0, thickness: 0, color: Colors.transparent) : Divider(height: .5, thickness: .5, color: ThemeColor.borderColor)
          ],
        ));
  }
}
