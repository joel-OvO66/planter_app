import 'package:flutter/material.dart';
import 'package:tornado/description/DescriptionItem.dart';

import '../../api/SecurityController.dart';
import '../../entity/security/entity/User.dart';
import '../../generated/l10n.dart';

/**
* AccountSettingPage 主类
**/
class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

/**
* AccountSettingPage UI布局
**/
class _AccountSettingPageState extends State<AccountSettingPage> {
  User? user;

  @override
  void initState() {
    super.initState();
    SecurityController.getLoginUserInfo().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).account_settings)),
        body: Column(
          children: [
            DescriptionItem(S.of(context).user_userName, user?.userName ?? ""),
            DescriptionItem(S.of(context).user_email, user?.email ?? ""),
            // DescriptionItem(S.of(context).user_mobile, user?.mobile ?? ""),
          ],
        ));
  }
}
