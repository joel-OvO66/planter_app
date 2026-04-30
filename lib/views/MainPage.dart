import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/gen/assets.gen.dart';
import 'package:planter_app/views/plant/PlantsPage.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';

import '../Constants.dart';
import '../common/FarmService.dart';
import '../generated/l10n.dart';
import '../style/BrunoThemeConfig.dart';
import 'dashboard/DashboardPage.dart';
import 'profile/ProfilePage.dart';

/**
 * 主页
 */
class MainPage extends StatefulWidget {
  final int? roomId;
  const MainPage({Key? key, this.roomId}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

/**
 * 主页状态
 */
class _MainPageState extends State<MainPage> {
  DateTime? lastPopTime;

  /**
   * 当前显示的tab页
   */
  int _tabIndex = 0;

  @override
  void initState() {
    //初始化http服务
    HttpService.instance.init(Constants.BASE_URL, contextPath: 'rest/', connectTimeout: 10000, receiveTimeout: 1000 * 60 * 60 * 24, responseType: ResponseType.json, contentType: Headers.jsonContentType);
    super.initState();
    context.read<FarmService>().reloadFarms();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      BrnInitializer.register(allThemeConfig: BrunoThemeConfig.lightBrnTheme());
    } else {
      BrnInitializer.register(allThemeConfig: BrunoThemeConfig.darkBrnTheme());
    }
    return WillPopScope(
      onWillPop: () async {
        // 点击返回键的操作
        if (lastPopTime == null || DateTime.now().difference(lastPopTime!) > const Duration(seconds: 3)) {
          lastPopTime = DateTime.now();
          Fluttertoast.showToast(msg: S.of(context).exit);
          return false;
        } else {
          lastPopTime = DateTime.now();
          // 退出app
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true;
        }
      },
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          iconSize: 48.sp,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: _buildBarItem(Ionicons.home_outline), activeIcon: _buildBarItem(Ionicons.home_sharp), label: S.of(context).navBar_home),
            BottomNavigationBarItem(icon: _buildBarItemByImage(Assets.images.tabs.treeNormal), activeIcon: _buildBarItemByImage(Assets.images.tabs.treeSelected), label: S.of(context).navBar_plant),
            //BottomNavigationBarItem(icon: _buildBarItem(Ionicons.file_tray_stacked_outline), activeIcon: _buildBarItem(Ionicons.file_tray_stacked_sharp), label: S.of(context).navBar_plant),
            //BottomNavigationBarItem(icon: _buildBarItem(Assets.images.tabs.data3x), activeIcon: _buildBarItem(Assets.images.tabs.dataChecked3x), label: S.of(context).navBar_data),
            BottomNavigationBarItem(icon: _buildBarItem(Ionicons.person_outline), activeIcon: _buildBarItem(Ionicons.person_sharp), label: S.of(context).navBar_profile),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              print(index);
              _tabIndex = index;
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return DashboardPage(roomId: widget.roomId);
            case 1:
              return const PlantsPage();
            // case 2:
            //   return const AnalysisPage();
            default:
              return ProfilePage();
          }
        },
      ),
    );
  }

  Widget _buildBarItem(IconData iconData) {
    return Container(child: Icon(iconData, size: 42.sp), margin: EdgeInsets.only(top: 8.sp));
  }

  Widget _buildBarItemByImage(AssetGenImage img){
    return Container(child: img.image(width: 48.sp), margin: EdgeInsets.only(top: 8.sp));
  }

  Widget _tooltip(String num) {
    return Positioned(
        top: 4.sp,
        right: -14.sp,
        child: Container(
            padding: EdgeInsets.all(1),
            decoration: new BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
            constraints: BoxConstraints(minWidth: 15, minHeight: 12),
            child: Text(num, style: new TextStyle(color: Colors.white, fontSize: 11), textAlign: TextAlign.center)));
  }
}
