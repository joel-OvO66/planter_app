import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../OutlineChip.dart';

class SimpleListSkeleton extends StatelessWidget {

  //名称
  String? name;
  //副标题
  String? subTitle;
  String? description;
  //是否有点，通知前的小圆点
  bool isCircle;
  Color? circleColor;
  // 点击跳转或者其他函数--需要，将函数放在setState(() {})中;
  Function? tap;
  //右边箭头前的 文字或者其他--需要，为空写成''
  String? moreTxt;
  String? chipText;
  Color? chipColor;
  // 左侧的 默认属性--图片--可以不列举
  Widget? leading;
  bool? fiveWidth;

  // 去掉右箭头
  bool? arrowRight;

  double titleLeft = 14;
  double subLeft = 11;
  double wLeft = 46;
  double wRight = 22;

  SimpleListSkeleton({Key? key, this.leading, this.name, this.subTitle, this.description, required this.isCircle, this.fiveWidth, this.moreTxt, this.arrowRight, this.chipText, this.chipColor, this.circleColor, this.tap}) : super(key: key);

  Widget build(BuildContext context) {

    if(isCircle){
      titleLeft = 0;
      subLeft = 11;
    } else {
      titleLeft = 0;
      subLeft = 0;
    }

    if(arrowRight!){
      if(isCircle){
        wLeft = 46;
      } else {
        wLeft = 110;
        wRight = 86;
      }
    } else {
      if(isCircle){
        wRight = 22;
      } else {
        wLeft = 78;
        wRight = 78;
      }
    }
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListTile(
        leading: leading,
        title: Container(
          height: 40,
          transform: Matrix4.translationValues(titleLeft, -4, 0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              isCircle ? circle() : Text(''),
              Expanded(
                  child: Text( name!, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),)
              )
            ],
          ),
        ),
        subtitle: Container(
          transform: Matrix4.translationValues(titleLeft, -8, 0),
          margin: EdgeInsets.only(left: subLeft),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( subTitle!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis)),
              if(description != null) Text( description!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis))
            ],
          ),
        ),
        onTap: () {
          if (tap != null) {
            tap!();
          }
        },
        trailing: Container(
            width: wLeft,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: wRight,
                      alignment: Alignment.centerRight,
                      child: chipText != null ? OutlineChip(chipText, color: chipColor, width: fiveWidth != null ? 78 : null,) : Text(moreTxt!,
                          overflow: TextOverflow.ellipsis, maxLines: 1, textAlign: TextAlign.right, style: TextStyle(fontSize: 22)) ,
                    ),
                    arrowRight! ? Icon(Icons.keyboard_arrow_right, color: Colors.black45, size: 22) : Text('')
                  ],
                )
              ],
            )),
      ),
    );
  }

  //小圆点
  Widget circle() {
    return Container(
      width: 5,
      height: 5,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: circleColor != null ? circleColor : Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
    );
  }
}
