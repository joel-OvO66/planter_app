import 'package:flutter/cupertino.dart';

class AnimationRoute extends PageRouteBuilder {
  final Widget widget;

  /**
   * 添加过度动画
   */
  AnimationRoute(this.widget)
      : super(
            transitionDuration: Duration(seconds: 2), //过渡时间
            pageBuilder: (
              //构造器
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn, //动画曲线
                )),
                child: child,
              );
            });
}
