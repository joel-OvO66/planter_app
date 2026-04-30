/**
 * 自定义主题 by mbb
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ThemeColor {
  static const Color borderColor = Color(0xffe8e9eb);
  static const Color placeholderColor = Color(0xff959595);
  static const Color bgGray = Color(0xffF4F5F6);

  /**
   * 主题色的primarySwatch值获取
   */
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }
}

// 已经到底了文字
TextStyle NO_MORE_TEXT = TextStyle(fontSize: 24.sp, color: Color(0xffcbcbcb));

// TextStyle FORM_LABEL_STYLE = TextStyle(fontSize: 26.sp, color: Color(0xff080808));
//
// TextStyle FORM_PLACEHOLDER_STYLE = TextStyle(fontSize: 25.sp, color: Color(0xff959595));
//
// TextStyle FORM_CONTROL_STYLE = TextStyle(fontSize: 25.sp, color: Color(0xff404040));

/**其他内容**/
const AdvancedListSkeletonColor = TextStyle(color: Color(0xff6B7380), fontSize: 12, overflow: TextOverflow.ellipsis);
