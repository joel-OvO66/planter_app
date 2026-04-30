import 'dart:async';

import 'package:bruno/bruno.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:planter_app/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';

import '../Constants.dart';
import '../common/AuthService.dart';
import '../gen/assets.gen.dart';
import '../style/BrunoThemeConfig.dart';
import 'LoginPage.dart';
import 'MainPage.dart';
import 'account/RegisterPage.dart';

class WelcomePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomePage2State();
}

class WelcomePage2State extends State<WelcomePage2> with _WelcomePageMixin {
  //int cnt = 10;
  //Timer? mTimer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
   // mTimer?.cancel();
    super.dispose();
  }

  Future<void> _setupTimerWork(timer) async {
    // setState(() {
    //   if(cnt > 0) cnt = cnt - 1;
    // });
    // if (cnt <= 0) {
    //   AuthService authService = context.read<AuthService>();
    //   authService.setFirstLogin(false);
    //
    //   Navigator.pushAndRemoveUntil(context,
    //       MaterialPageRoute(builder: (BuildContext context) => authService.isLoggedIn() ? const MainPage() : LoginPage()),
    //           (route) => route == null
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = context.read<AuthService>();
    authService.setFirstLogin(false);

    //mTimer = Timer.periodic(const Duration(seconds: 1), _setupTimerWork);

    Container container = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/app_bg2.png'), fit: BoxFit.cover),
      ),
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          container,
          AnimatedOpacity(
            opacity: 1,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
            child: Stack(fit: StackFit.expand, children: <Widget>[
              Positioned(
                  bottom: 210,
                  left: MediaQuery.of(context).size.width / 2 - 90,
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 180,
                        height: 41,
                        color: Colors.white,
                        elevation: 0,
                        highlightElevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        child: Text(S.of(context).account_login, style: const TextStyle(color: Color(0xff36AE63))),
                        onPressed: () {
                          // 添加过度动画
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return LoginPage();
                          }));//=> LoginPage()), (route) => route == null);
                        },
                      ),
                      const SizedBox(height: 30,),
                      MaterialButton(
                        minWidth: 180,
                        height: 41,
                        color: Colors.white,
                        elevation: 0,
                        highlightElevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        child: Text(S.of(context).create_account, style: const TextStyle(color: Color(0xff36AE63))),
                        onPressed: () {
                          // 添加过度动画
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return const RegisterPage();
                          }));
                          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const RegisterPage()), (route) => route == null);
                        },
                      )
                    ],
                  )
              )
            ]),
          ),
          Positioned(
            bottom: 60,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return authService.isLoggedIn() ? const MainPage() : LoginPage();
                }));
                //=> authService.isLoggedIn() ? const MainPage() : LoginPage()),(route) => route == null);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${S.of(context).skip}", style: const TextStyle(fontSize: 14, color: Colors.white)),
                  //Text(" $cnt", style: const TextStyle(fontSize: 14, color: Colors.red)),
                  //const Text(" S", style: const TextStyle(fontSize: 12, color: Colors.white)),
                ]
              ),
            ),
          ),
          Positioned(
            top: 145,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text("${S.of(context).welcome} ${S.of(context).appName}", style: TextStyle(color: Colors.white, fontSize: 46.sp, fontWeight: FontWeight.w600)),),
          ),
        ],
      ),
    );
  }
}

mixin _WelcomePageMixin<T extends StatefulWidget> on State<T> {
  int swiperIndex = 0;

  int opacity = 0;
}
