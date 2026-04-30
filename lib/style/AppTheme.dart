import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planter_app/style/CustomSliderThumbShape.dart';
import 'package:tornado/theme.dart';

/**
 * 项目相关的主题颜色
 */
class AppTheme {
  static const Color text1 = Color.fromRGBO(18, 18, 18, 1);
  static const Color text88 = Color.fromRGBO(18, 18, 18, 0.88);
  static const Color titleColor = Color(0xff20262E);
  static const Color grey46 = Color.fromRGBO(18, 18, 18, 0.46);
  static const Color grey26 = Color.fromRGBO(18, 18, 18, 0.26);
  static const Color grey08 = Color.fromRGBO(18, 18, 18, 0.08);
  static const Color linear1 = Color.fromRGBO(51, 170, 250, 1.0);
  static const Color linear2 = Color.fromRGBO(34, 133, 239, 1.0);
  static const Color error1 = Color.fromRGBO(240, 68, 85, 1);
  static const Color white88 = Color.fromRGBO(255, 255, 255, 0.88);
  static const Color lightBlue3 = Color(0xffF1F8FF);
  static const Color lightBlue2 = Color(0xffDEEFFF);
  static const Color lightBlue = Color(0xffb3d9ff);
  static const Color colorPrimary = Color(0xff1890FF);
  static const Color colorBlueBg = Color(0xff00367A);
  static const Color colorLinear1 = Color(0xff1890FF);
  static const Color colorLinear2 = Color(0xff107fe7);
  static const Color lavender = Color(0xffAF94C4);
  static const Color colorRed = Colors.red;
  static const Color gray = Color(0xff6B7380);
  static const Color dividerColor = Color(0xffe8e9eb);
  static const Color borderColor = Color(0xffe8e9eb);
  static const Color gray999 = Color(0xff999999);
  static const Color grayEB = Color(0xffEBEBEB);
  static const Color primary = Color(0xff3AB967);
  static const Color secondary = Color(0xffF9A313);
  static const Color lightPrimary = Color.fromRGBO(58, 185, 103, 0.15);

  static const Color success = Color(0xff30BF78); //Color(0xff52c419)
  static const Color danger = Color(0xffF4664A); //Color(0xfff50b0b)
  static const Color warning = Color(0xffFAAD14); //Color(0xffff9600)
  static const Color lightWarning = Color(0x20FAAD14); //Color(0xffff9600)
  static const Color cyan = Color(0xff1dcbd2);
  static const Color overdue = Color(0xffAEB7C8);
  static const Color info = Color(0xff6DC8EC);
  static const Color deep = Color(0xff5D7092);
  static const Color boxShadow = Color(0x59000000);
  static const Color textColor = Color(0xff6B7380);
  static const Color textColorBlack = Color(0xff20262E);
  static const Color textColorWhite = Color(0xffFFFFFE);
  static const Color placeholderColor = Color(0xff959595);

  static const List<Color> chartColors = [Colors.green, Colors.amber, Colors.deepOrange, Colors.blue, Colors.cyan];

  /**
   * 全局样式 ，使用 titleStyle.copyWith()
   * 如果需要额外添加需要 style: titleStyle.copyWith(fontWeight: FontWeight.bold) 即可
   */

  static const black = TextStyle(color: Colors.black);
  static const white = TextStyle(color: Colors.white);
  static const bold = TextStyle(fontWeight: FontWeight.bold);
  static const loginLable = TextStyle(color: AppTheme.text88, fontSize: 16, fontWeight: FontWeight.bold);

//tab切换
  final GlobalKey globalKey = GlobalKey();
  Divider divider16 = Divider(height: 16.sp, thickness: 16.sp);
  static Divider divider24 = Divider(height: 24.sp, thickness: 24.sp);
  static Divider divider = Divider(height: 1.sp, thickness: 1.sp);
  static const shapeRadius16 = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));
  static const Widget dividerFull = Divider(height: 1, color: AppTheme.grayEB);
  static SizedBox verticalDivier = SizedBox(width: 1.sp, height: 30.sp, child: DecoratedBox(decoration: BoxDecoration(color: AppTheme.grayEB)));
  Container verticalDivierCon = Container(margin: EdgeInsets.only(left: 24.sp, right: 24.sp), child: verticalDivier);
  EdgeInsets searchPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 8);
  Image iconLeading = Image.asset('assets/images/common/back_arrow.png', width: 36.sp);
  Image iconLeadingWhite = Image.asset('assets/images/common/back_arrow_white.jpg', width: 36.sp);
  Container listDivider = Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: 20.sp),
    child: Divider(height: 1, color: Color(0xffE8E9EB)),
  );

//右上角更多和箭头
  Row moreTextArrow = Row(children: [
    Text('更多', style: TextStyle(fontSize: 24.sp, color: AppTheme.gray)),
    Container(child: Icon(Icons.arrow_forward_ios_rounded, size: 20.sp, color: AppTheme.gray), padding: EdgeInsets.only(left: 4.sp)),
  ]);

  // 更多 文字样式
  static const moreText = TextStyle(fontSize: 14, color: AppTheme.gray);

// 已经到底了文字
  static const noMoreText = TextStyle(fontSize: 14.0, color: AppTheme.gray);

//分割线

  /* 0x表示是16进制，ff 代表透明度，后面的6位是颜色值
   * 透明度：
   * 00%=FF（完全不透明）5%=F2 10%=E5 15%=D8 20%=CC 25%=BF 30%=B2 35%=A5 40%=99 45%=8c 50%=7F
   * 55%=72 60%=66 65%=59 70%=4c 75%=3F 80%=33 85%=21 90%=19 95%=0c 100%=00（全透明）
   */

  //light主题
  static ThemeData lightTheme() {
    Color primaryColor = const Color(0xff101010);
    Color secordaryColor = const Color(0xff146029);
    Color scaffoldBackgroundColor = const Color(0xffF5F5F5);

    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: primaryColor,
        primaryColorLight: secordaryColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white, size: 36.sp),
          toolbarHeight: 90.sp,
          elevation: 0.2,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 30.sp, color: textColorWhite),
          backgroundColor: primaryColor,
        ),
        tabBarTheme: TabBarThemeData(
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: secordaryColor,
          labelColor: Colors.black,
          unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.65),
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // 设置视觉密度：适应平台密度
        highlightColor: Colors.transparent,
        //去除点击tabbar的过度效果
        // primarySwatch: createMaterialColor(Color(0xff1890FF)),
        //主要决定导航和底部bottombar颜色
        // 可以通过Theme.of(context).textTheme.bodyText2获取
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 32.sp, color: textColorBlack),
          titleMedium: TextStyle(fontSize: 31.sp, color: textColorBlack),
          titleSmall: TextStyle(fontSize: 30.sp, color: textColorBlack),
          headlineLarge: TextStyle(fontSize: 32.sp, color: textColorBlack, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 31.sp, color: textColorBlack, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 30.sp, color: textColorBlack, fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontSize: 29.sp, color: textColorBlack),
          labelMedium: TextStyle(fontSize: 28.sp, color: textColorBlack),
          labelSmall: TextStyle(fontSize: 27.sp, color: textColorBlack),
          bodyLarge: TextStyle(fontSize: 26.sp, color: textColorBlack),
          bodyMedium: TextStyle(fontSize: 25.sp, color: textColorBlack),
          bodySmall: TextStyle(fontSize: 24.sp, color: textColorBlack),
        ),
        buttonTheme: ButtonThemeData(
          height: 50.sp,
          minWidth: 20.sp,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 12.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        checkboxTheme: CheckboxThemeData(),
        dataTableTheme: DataTableThemeData(),
        dialogTheme: DialogThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          backgroundColor: Colors.white,
        ),
        dividerTheme: DividerThemeData(thickness: 0.6),
        timePickerTheme: TimePickerThemeData(),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
          textColor: Colors.black,
          minVerticalPadding: 0,
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 8.sp,
          inactiveTrackColor: Color.fromRGBO(16, 16, 16, 0.06),
          inactiveTickMarkColor: Color.fromRGBO(16, 16, 16, 0.06),
          activeTrackColor: secordaryColor,
          activeTickMarkColor: secordaryColor,
          valueIndicatorColor: secordaryColor,
          thumbShape: CustomSliderThumbShape(Colors.white, secordaryColor),
          // rangeTrackShape:  RoundedRectRangeSliderTrackShape(),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedIconTheme: IconThemeData(color: secordaryColor),
          selectedItemColor: secordaryColor,
        ),
        tooltipTheme: const TooltipThemeData(),
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.under,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.borderColor, width: 1)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: secordaryColor, width: 1)),
          errorMaxLines: 2
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            ),
            clipBehavior: Clip.antiAlias),
        switchTheme: SwitchThemeData(trackColor: MaterialStateProperty.all(secordaryColor), materialTapTargetSize: MaterialTapTargetSize.padded),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: secordaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )),
        cupertinoOverrideTheme: CupertinoThemeData(barBackgroundColor: Colors.white, primaryColor: secordaryColor));
  }

  //dark主题
  static ThemeData darkTheme() {
    Color primaryColor = const Color(0xff101010);
    Color secordaryColor = const Color(0xff146029);
    Color scaffoldBackgroundColor = Colors.black;
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          iconTheme: IconThemeData(color: Colors.white, size: 36.sp),
          actionsIconTheme: IconThemeData(color: AppTheme.primary),
          toolbarHeight: 90.sp,
          elevation: 0.2,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 30.sp, color: textColorWhite),
        ),
        tabBarTheme: TabBarThemeData(
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: secordaryColor,

          // labelColor: Colors.black,
          // unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.65),
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // 设置视觉密度：适应平台密度
        highlightColor: Colors.transparent,
        //去除点击tabbar的过度效果
        // primarySwatch: createMaterialColor(Color(0xff1890FF)),
        //主要决定导航和底部bottombar颜色
        // 可以通过Theme.of(context).textTheme.bodyText2获取
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 32.sp, color: textColorWhite),
          titleMedium: TextStyle(fontSize: 31.sp, color: textColorWhite),
          titleSmall: TextStyle(fontSize: 30.sp, color: textColorWhite),
          headlineLarge: TextStyle(fontSize: 32.sp, color: textColorWhite, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 31.sp, color: textColorWhite, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 30.sp, color: textColorWhite, fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontSize: 29.sp, color: textColorWhite),
          labelMedium: TextStyle(fontSize: 28.sp, color: textColorWhite),
          labelSmall: TextStyle(fontSize: 27.sp, color: textColorWhite),
          bodyLarge: TextStyle(fontSize: 26.sp, color: textColorWhite),
          bodyMedium: TextStyle(fontSize: 25.sp, color: textColorWhite),
          bodySmall: TextStyle(fontSize: 24.sp, color: textColorWhite),
        ),
        buttonTheme: ButtonThemeData(
          height: 50.sp,
          minWidth: 20.sp,
        ),
        cardTheme: CardThemeData(
          // color: Colors.black,
          elevation: 0,
          margin: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 12.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedIconTheme: IconThemeData(color: Colors.white),
            selectedIconTheme: IconThemeData(color: secordaryColor),
            selectedItemColor: secordaryColor,
            backgroundColor: scaffoldBackgroundColor),
        checkboxTheme: CheckboxThemeData(),
        dataTableTheme: DataTableThemeData(),
        dialogTheme: DialogThemeData(),
        dividerTheme: DividerThemeData(thickness: 0.6),
        timePickerTheme: TimePickerThemeData(),
        sliderTheme: SliderThemeData(
          trackHeight: 8.sp,
          inactiveTrackColor: Colors.white24,
          inactiveTickMarkColor: Colors.white24,
          activeTrackColor: secordaryColor,
          activeTickMarkColor: secordaryColor,
          thumbShape: CustomSliderThumbShape(Colors.white, secordaryColor),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.black45,
          textColor: Colors.white70,
          minVerticalPadding: 0,
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
        ),
        tooltipTheme: TooltipThemeData(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: secordaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )),
        cupertinoOverrideTheme: CupertinoThemeData(primaryColor: secordaryColor));
  }
}
