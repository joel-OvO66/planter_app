import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class BasicCard extends StatelessWidget {
  Widget? icon;
  Widget? extra;

  String? title;

  String? subtitle;

  EdgeInsetsGeometry? padding;

  GestureTapCallback? onTap;

  double? radius;

  /// 内容
  Widget? child;

  /// 头
  Widget? head;

  /// 尾巴
  Widget? tail;

  TextStyle? titleStyle;

  BasicCard({Key? key, this.icon, this.extra, this.title, this.subtitle, this.titleStyle, this.head, this.tail, this.child, this.radius, this.onTap, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius ?? 20.sp))),
          child: Padding(
              padding: padding ?? EdgeInsets.only(top: 15.sp, left: 6.sp, bottom: 8.sp, right: 12.sp),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                head ?? _buildHead(context),
                if (child != null) child!,
                if (tail != null) tail!,
              ]))),
    );
  }

  Widget _buildHead(BuildContext context) {
    if (icon != null || title != null || extra != null) {
      return Row(children: [SizedBox(width: 12.sp), if (icon != null) icon!, SizedBox(width: 10.sp), _buildTitle(context), const Spacer(), if (extra != null) extra!]);
    } else {
      return Container();
    }
  }

  Widget _buildTitle(BuildContext context) {
    Text titleWidget = Text(title ?? "", style: Theme.of(context).textTheme.titleMedium);
    if (subtitle != null) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [titleWidget, Text(subtitle!, style: Theme.of(context).textTheme.titleSmall)]);
    } else {
      return titleWidget;
    }
  }
}
