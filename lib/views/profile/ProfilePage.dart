import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planter_app/api/SecurityController.dart';
import 'package:planter_app/common/AuthService.dart';
import 'package:planter_app/common/FarmService.dart';
import 'package:planter_app/ui/DialogAlert.dart';
import 'package:planter_app/views/LoginPage.dart';
import 'package:planter_app/views/profile/FeedbackPage.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/security/Authenticity.dart';

import '../../entity/security/entity/User.dart';
import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../account/AccountSettingPage.dart';
import 'AboutPage.dart';
import 'SettingPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<ProfilePage> {
  List<User> members = [];

  @override
  void initState() {
    super.initState();
    SecurityController.getUsersByFarmId().ifNotNull((value) {
      setState(() {
        members = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Authenticity? authenticity = context.read<AuthService>().authenticity;
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).appName),
          actions: [],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20.sp),
            leading: Assets.images.my.defaultAvatar.image(width: 100.sp),
            title: Text(authenticity!.name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp)),
            subtitle: Text(authenticity.fullName ?? "", style: TextStyle(fontSize: 28.sp)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettingPage()));
            },
          ),
          SizedBox(height: 16.sp),
          // BasicCard(
          //     title: "My team members:",
          //     child: Container(
          //         width: 630.w,
          //         height: 170.h,
          //         padding: EdgeInsets.only(top: 16.sp, bottom: 0),
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Row(
          //             mainAxisSize: MainAxisSize.max,
          //             children: <Widget>[
          //               ...members.map((e) {
          //                 return Container(
          //                     margin: const EdgeInsets.only(right: 10, left: 10),
          //                     width: 80.sp,
          //                     child: Column(children: [
          //                       Assets.images.my.defaultAvatar.image(width: 48),
          //                       const SizedBox(height: 4),
          //                       Text(
          //                         e.userName ?? "",
          //                         style: TextStyle(fontSize: 18.sp, overflow: TextOverflow.fade),
          //                         maxLines: null, // 根据需要设置最大行数，如果设置为null，则不限制行数
          //                         textAlign: TextAlign.center, // Enable text wrapping
          //                       )
          //                     ]));
          //               }).toList(),
          //               Container(
          //                   margin: const EdgeInsets.only(right: 10, left: 10),
          //                   width: 80.sp,
          //                   child: Column(children: [
          //                     Icon(Icons.add),
          //                     const SizedBox(height: 4),
          //                     Text(
          //                       "邀请",
          //                       style: TextStyle(fontSize: 18.sp, overflow: TextOverflow.fade),
          //                       maxLines: null, // 根据需要设置最大行数，如果设置为null，则不限制行数
          //                       textAlign: TextAlign.center, // Enable text wrapping
          //                     )
          //                   ]))
          //             ],
          //           ),
          //         ))),
          Expanded(
              child: SettingsList(
            platform: DevicePlatform.iOS,
            sections: [
              SettingsSection(
                //title: Text(S.of(context).common),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: Text(S.of(context).setting_account),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onPressed: (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettingPage()));
                    },
                  ),
                  SettingsTile.navigation(
                      leading: const Icon(Icons.settings),
                      title: Text(S.of(context).setting),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onPressed: (context) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return const SettingPage();
                        }));
                      }),
                ],
              ),
              SettingsSection(
                title: Text(S.of(context).more),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.feedback_outlined),
                    title: Text(S.of(context).setting_feedback),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onPressed: (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackPage()));
                    },
                  ),
                  // SettingsTile.navigation(
                  //   leading: const Icon(Icons.question_answer_outlined),
                  //   title: Text('FAQ'),
                  //   trailing: const Icon(Icons.arrow_forward_ios),
                  // ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.copyright),
                    title: Text(S.of(context).setting_aboutUs),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onPressed: (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
                    },
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.logout),
                    title: Text(S.of(context).logout),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onPressed: (context) {
                      DialogAlert.confirm(context, onOk: () {
                        Provider.of<AuthService>(context, listen: false).logout();
                        Provider.of<FarmService>(context, listen: false).clearFarms();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => false);
                      }, title: S.of(context).logout, desc: S.of(context).confirm_logout, okText: S.of(context).yes);
                    },
                  ),
                ],
              ),
            ],
          ))
        ]));
  }
}
