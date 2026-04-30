import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../style/AppTheme.dart';

class ListTileItem extends StatelessWidget {
  /**
   * 图标和文字
   */
  Widget? leading;

  /**
   * 标题图标
   */
  Widget? titleLeading;
  String? title;
  String? subtitle;

  /**
   * 标题下的widget
   */
  Widget? content;

  /// 详情区
  List<Widget>? detail;

  /**
   * footer区
   */
  Widget? footer;

  final Widget? trailing;

  final GestureTapCallback? onTap;

  final int crossAxisCount;

  final double bottom;

  final double horizontalTitleGap;

  final EdgeInsetsGeometry? contentPadding;

  ListTileItem(
      {Key? key,
      this.leading,
      required this.title,
      this.subtitle,
      this.content,
      this.onTap,
      this.trailing,
      this.crossAxisCount = 2,
      this.bottom = 4,
      this.detail,
      this.footer,
      this.contentPadding,
      this.horizontalTitleGap = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile listTile = ListTile(
      contentPadding: contentPadding,
      leading: leading,
      horizontalTitleGap: horizontalTitleGap,
      title: Text(title ?? "", style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: true),
      subtitle: Text(subtitle ?? '',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w300),
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true),
      trailing: trailing,
      // selected: selected!,
      onTap: onTap,
    );
    if (content != null || detail != null || footer != null) {
      return GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listTile,
              if (content != null) AppTheme.divider,
              if (content != null) content!,
              if (detail != null && detail!.isNotEmpty)
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 30.sp, right: 0, top: 0, bottom: bottom),
                    child: StaggeredGrid.count(
                      mainAxisSpacing: 5.sp,
                      crossAxisCount: crossAxisCount,
                      children: detail!,
                    )),
              if (footer != null)
                Container(
                    decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xffEBEBEB), width: 1.2.sp))),
                    padding: EdgeInsets.only(left: 30.sp, right: 20.sp, top: 16.sp, bottom: 12.sp),
                    child: footer)
            ],
          ));
    } else {
      return listTile;
    }
  }
}
