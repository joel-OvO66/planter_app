import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Statistic2Card extends StatelessWidget {
  Widget? icon;

  Widget? content;

  String title;

  Color? color;

  Color backgroundColor;

  bool left;

  final BoxBorder? border;

  GestureTapCallback? onTap;

  double? radius;

  Statistic2Card({
    Key? key,
    this.icon,
    this.content,
    required this.title,
    this.border,
    this.backgroundColor = Colors.white,
    this.color,
    this.left = true,
    this.radius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(8.sp, 8.sp, 28.sp, 16.sp),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.all(Radius.circular(radius ?? 16.sp)), border: border),
        child: Column(crossAxisAlignment: left ? CrossAxisAlignment.start : CrossAxisAlignment.end, children: [
          if (icon != null)
            Align(
              child: icon,
              alignment: Alignment.topLeft,
            ),
          if (content != null) Align(alignment: Alignment.center, child: content),
          Align(alignment: Alignment.center, child: Text(title, style: TextStyle(fontSize: 26.sp, color: color ?? Color(0xff333333)))),
        ]),
      ),
    );
  }
}
