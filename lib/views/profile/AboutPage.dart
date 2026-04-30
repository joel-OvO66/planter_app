import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:planter_app/api/SecurityController.dart';
import 'package:provider/provider.dart';

import '../../common/AuthService.dart';
import '../../common/FarmService.dart';
import '../../generated/l10n.dart';
import '../LoginPage.dart';
import '../account/PrivacyAgreementPage.dart' show PrivacyAgreementPage;
import 'UseTermsPage.dart';

/**
    AboutPage 主类
 **/
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

/**
    AboutPage UI布局
 **/
class _AboutPageState extends State<AboutPage> with _AboutPageMixin {
  late AnimationController _controller;
  PackageInfo? packageInfo;
  @override
  void initState() {
    super.initState();
    getSystemConfig();
    PackageInfo.fromPlatform().then((value) {
      if (mounted) {
        setState(() {
          packageInfo = value;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).setting_aboutUs)),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            child: Column(children: [
              Container(margin: const EdgeInsets.only(top: 40, bottom: 12), child: Image.asset('assets/icons/logo.png', width: 150.sp, height: 150.sp)),
              Container(margin: const EdgeInsets.only(bottom: 4), child: Text(S.of(context).appName, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
            ])
          ),
          Container(
              child: Column(children: [
            _outlineBtn(S.of(context).term_of_use, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                //return UseTermsPage();
                return PrivacyAgreementPage(S.of(context).term_of_use, 'privacyPolicy', isShowButton: false,);
              }));
            }),
            _outlineBtn(S.of(context).privacyPolicy, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PrivacyAgreementPage(S.of(context).privacyPolicy, 'serviceAndAgreement', isShowButton: false,);
              }));
            }),
            // _outlineBtn('分享二维码', () {
            //   // showModalBottomSheet(context: context, builder: (BuildContext context) => ShareModal());
            // }),
            // _outlineBtn(S.of(context).logoff, () {
            //   _showCupertinoDialog();
            // })
          ])),
          Container(child: Text('copyright version: ${packageInfo?.version}', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xff999999)))),
        ])));
  }

  Widget _outlineBtn(String text, VoidCallback onPress) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.sp),
      width: 420.sp,
      child: OutlinedButton(child: Text(text, style: Theme.of(context).textTheme.bodyMedium!, overflow: TextOverflow.ellipsis), style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff999999))), onPressed: onPress),
    );
  }
}

/**
    AboutPage 数据逻辑
 **/
mixin _AboutPageMixin<T extends StatefulWidget> on State<T> {
  void getSystemConfig() {}

  /**
   * 点击退出弹框
   */
  void _showCupertinoDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(title: Text(S.of(context).delete_user), content: Text(S.of(context).delete_user_confirm), actions: <Widget>[
            CupertinoDialogAction(
                child: Text(S.of(context).cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            CupertinoDialogAction(
                child: Text(S.of(context).yes),
                onPressed: () {
                  Navigator.of(context).pop();
                  SecurityController.logoffUser().then((value) {
                    _handleLogout();
                  });
                })
          ]);
        });
  }

  _handleLogout() async {
    _setRegistrationId();
    Provider.of<AuthService>(context, listen: false).logout();
    Provider.of<FarmService>(context, listen: false).clearFarms();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => false);
  }

  _setRegistrationId() {
    // JPush jpush = new JPush();
    // jpush.deleteAlias().then((map) {});
  }
}
