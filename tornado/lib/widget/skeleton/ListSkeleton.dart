import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../OutlineChip.dart';

class ListSkeleton extends StatelessWidget {
  //名称
  String title;

  //副标题
  String? subTitle;
  List? listOthers = [];

  // 点击跳转或者其他函数--需要，将函数放在setState(() {})中;
  Function? tap;

  //字体颜色
  Color? titleColor;
  Color? subTtitleColor;

  //右边箭头前的 文字或者其他--需要，为空写成''
  String? moreTxt;

  // 左侧的 默认属性--图片--可以不列举
  Widget? leading;
  String? chipText;
  Color? chipColor;
  String? time;
  String? position;
  String? line;

  double left = 16;
  double arrowPosition = 0;

  ListSkeleton(
      {Key? key,
      this.leading,
      required this.title,
      this.subTitle,
      this.listOthers,
      this.position,
      this.time,
      this.line,
      this.chipText,
      this.chipColor,
      this.titleColor,
      this.subTtitleColor,
      this.moreTxt,
      this.tap})
      : super(key: key);

  Widget build(BuildContext context) {
    if (listOthers != null) {
      switch ((listOthers!.length / 2).toString()) {
        case '0.5':
          arrowPosition = -8;
          break;
        case '1.0':
          arrowPosition = 0;
          break;
        default:
          arrowPosition = 8;
          break;
      }
    }
    return Container(
      color: Colors.white,
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 6, 8, 6),
          leading: leading,
          title: FractionallySizedBox(
            widthFactor: 1.4,
            child: Container(
              transform: Matrix4.translationValues(chipText != null ? 26 : 40, 0, 0),
              padding: EdgeInsets.only(left: leading != null ? 0 : left, bottom: 4),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(title, style: Theme.of(context).textTheme.labelMedium!.copyWith(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold, color: titleColor)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 120,
                        child: Text(subTitle != null ? subTitle! : '', style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis, color: subTtitleColor)),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
          subtitle: FractionallySizedBox(
              widthFactor: chipText != null ? 1.1 : 1.17,
              child: listOthers != null
                  ? Container(
                      transform: Matrix4.translationValues(chipText != null ? -10 : 6, 0, 0),
                      padding: EdgeInsets.only(left: leading != null ? 0 : left),
                      child: Column(
                        children: [
                          _buildFun(context),
                        ],
                      ),
                    )
                  : Container(
                      height: 0,
                      child: Text(''),
                    )),
          onTap: () {
            if (tap != null) {
              tap!();
            }
          },
          trailing: Container(
              width: chipText != null ? 100 : 50,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Container(
                    width: chipText != null ? 78 : 20,
                    alignment: Alignment.centerRight,
                    transform: Matrix4.translationValues(0, arrowPosition + 1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [if (chipText != null) OutlineChip(chipText, color: chipColor)],
                    ),
                  ),
                  listOthers == null
                      ? Icon(Icons.keyboard_arrow_right, color: Colors.black45, size: 22)
                      : Container(
                          transform: Matrix4.translationValues(0, arrowPosition, 0),
                          child: Icon(Icons.keyboard_arrow_right, color: Colors.black45, size: 22),
                        ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildFun(BuildContext context) {
    if (listOthers != null) {
      final List fixedList = Iterable<int>.generate(listOthers!.length).toList();
      return Column(
        children: fixedList.map(
          (idx) {
            var item = listOthers![idx];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // odd 表示左边的数据， even 代表右边的数据
                // 如果只有 odd 的话，那么当前就是一行显示并且有省咯号
                chipText != null
                    ? Container(
                        transform: Matrix4.translationValues(4, 0, 0),
                        child: Text(item['odd'].toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis)),
                      )
                    : Expanded(child: Text(item['odd'].toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis))),
                if (item['even'] != null) Text(item['even'].toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis)),
              ],
            );
          },
        ).toList(),
      );
    } else {
      return Text('');
    }
  }
}
