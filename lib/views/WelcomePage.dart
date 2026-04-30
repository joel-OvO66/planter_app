import 'package:bruno/bruno.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';

import '../Constants.dart';
import '../common/AuthService.dart';
import '../gen/assets.gen.dart';
import '../style/BrunoThemeConfig.dart';
import 'LoginPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> with _WelcomePageMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = context.read<AuthService>();
    authService.setFirstLogin(false);

    Swiper swiper = Swiper.children(
      autoplay: false,
      loop: false,
      index: swiperIndex,
      itemWidth: MediaQuery.of(context).size.width,
      itemHeight: MediaQuery.of(context).size.height,
      onIndexChanged: (index) {
        swiperIndex = index;
        setState(() {});
      },
      pagination:
          const SwiperPagination(margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0), builder: DotSwiperPaginationBuilder(color: Color(0xff92cba6), activeColor: Color(0xffffffff), size: 8.0, activeSize: 8.0)),
      children: <Widget>[Assets.images.welcome.welcome1.image(fit: BoxFit.cover), Assets.images.welcome.welcome2.image(fit: BoxFit.cover), Assets.images.welcome.welcome3.image(fit: BoxFit.cover)],
    );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          swiper,
          AnimatedOpacity(
            opacity: swiperIndex == 2 ? 1 : 0,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
            child: Stack(fit: StackFit.expand, children: <Widget>[
              Positioned(
                  bottom: 30,
                  left: MediaQuery.of(context).size.width / 2 - 90,
                  child: MaterialButton(
                    minWidth: 180,
                    height: 48,
                    color: Colors.white,
                    elevation: 0,
                    highlightElevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    child: const Text('立即体验', style: TextStyle(color: Color(0xff36AE63))),
                    onPressed: () {
                      // 添加过度动画
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => route == null);
                    },
                  ))
            ]),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => route == null);
              },
              child: const Text('跳过', style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}

mixin _WelcomePageMixin<T extends StatefulWidget> on State<T> {
  int swiperIndex = 0;

  int opacity = 0;
}
