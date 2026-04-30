import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/theme.dart';

class HeadTransparentCard extends StatelessWidget {
  /**
   * 标题
   */
  String? title;

  /**
   * 内容
   */
  Widget? body;

  /**
   * 右上角组件
   */
  Widget? extra;

  /**
   * 左上角图标
   */
  Widget? icon;

  /**
   * card footer区
   */
  Widget? footer;

  /**
   * body padding
   */
  EdgeInsetsGeometry? padding;

  GestureTapCallback? onTap;

  double? radius;

  HeadTransparentCard({Key? key, this.title, this.icon, this.extra, this.footer, this.body, this.padding, this.radius, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget card = Column(children: [
      title != null ? _buildHeader(context) : const SizedBox.shrink(),
      onTap != null ? GestureDetector(onTap: onTap, child: _buildBody(context)) : _buildBody(context),
      if (footer != null) _buildFooter(),
    ]);
    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: card);
    } else {
      return card;
    }
  }

  Widget _buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(2)),
        width: MediaQuery.of(context).size.width,
        padding: padding ?? EdgeInsets.only(left: 16.sp, right: 16.sp, top: 16.sp, bottom: 16.sp),
        child: body);
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        height: 86.sp,
        padding: EdgeInsets.only(left: 0.sp, right: 16.sp, top: 0.sp, bottom: 0.sp),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(245, 245, 245, 0.8), width: 1))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          if (icon != null) icon!,
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                  margin: EdgeInsets.only(left: 14.sp),
                  child: Text(title!, style: Theme.of(context).textTheme.headlineSmall!.copyWith(  overflow: TextOverflow.ellipsis),
                      maxLines: 1))),
          if (extra != null) extra!
        ]));
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.only(left: 24.sp, top: 6.sp, bottom: 6.sp, right: 24.sp),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xffEBEBEB)))),
      child: footer,
    );
  }
}
