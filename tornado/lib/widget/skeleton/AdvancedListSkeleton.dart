import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

/**
 *
 */
class AdvancedListSkeleton extends StatelessWidget {
  /**
   * 名称
   */
  String title;

  /**
   * 副标题
   */
  String? subtitle;

  /**
   * 提示图片
   */
  Widget? leading;

  /**
   * 左上角状态图片
   */
  Widget? halve;

  /**
   * 描述数组
   * 左右布局 如 ['班组', '2021-09-14']
   */
  List<Widget>? details;

  /**
   * 点击跳转或者其他函数--需要，将函数放在setState(() {})中
   */
  Function? tap;

  AdvancedListSkeleton({Key? key, required this.title, this.subtitle, this.leading, this.halve, this.details, this.tap}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        child: Container(
      decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: 1, color: Color(0xffebeced)))),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            color: Colors.white,
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              leading: leading,
              title: Container(
                transform: Matrix4.translationValues(-6, 0, 0),
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      title,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                transform: Matrix4.translationValues(-6, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      child: Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
                    ),
                    _detailInfos()
                  ],
                ),
              ),
              onTap: () {
                if (tap != null) {
                  tap!();
                }
              },
            ),
          ),
          halve != null ? Positioned(top: 0, right: 0, child: halve!) : SizedBox.shrink(),
        ],
      ),
    ));
  }

  // 描述循环
  Widget _detailInfos() {
    List<Widget> children = [];
    if (details != null && details!.isNotEmpty) {
      for (var i = 0; i < details!.length; i++) {
        if (i % 2 == 0) {
          children.add(Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.only(bottom: 4),
              child: details![i],
            )),
            i < details!.length - 1
                ? Expanded(
                    child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 4),
                    child: details![i + 1],
                  ))
                : SizedBox.shrink(),
          ]));
        }
      }
    }
    return Column(
      children: children,
    );
  }
}
