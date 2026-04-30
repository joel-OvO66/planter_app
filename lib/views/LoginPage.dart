import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:tornado/security/Authenticity.dart';

import '../common/AuthService.dart';
import 'MainPage.dart';
import 'account/ForgetPassword.dart';
import 'account/PrivacyAgreement.dart';
import 'account/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  bool showPassword = false;

  /// 登录并同意协议默认不勾选，图标
  bool _isChecked = false;
  bool _isCheckedBottom = false;

  /// 登录按钮一开始置灰, 输入框_controller
  final TextEditingController _userNameCtrl = TextEditingController()..text = "";
  final TextEditingController _passwordCtrl = TextEditingController()..text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login-bg@3x.png'), fit: BoxFit.cover),
        ),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppTheme.colorBlueBg, Colors.white], stops: [0.5, 1])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(iconTheme: const IconThemeData(color: Colors.black), backgroundColor: Colors.transparent, elevation: 0),
            body: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(left: 10, right: 2, top: 36.sp),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       IconButton(
              //           icon: Icon(Icons.settings),
              //           onPressed: () {
              //             // Navigator.of(context).push(new MaterialPageRoute(builder: (context) => SettingsPage())).then((value) {});
              //           })
              //     ],
              //   ),
              // ),
              //头部项目名称介绍
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 210.sp),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(S.of(context).hello, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 56.sp, fontWeight: FontWeight.w600)),
                    Text('${S.of(context).welcome} ${S.of(context).appName}', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 36.sp, height: 2.1)),
                  ])),
              SizedBox(height: 56.sp),
              TextFormField(
                controller: _userNameCtrl,
                decoration: InputDecoration(labelText: S.of(context).yourEmail, hintText: S.of(context).inputEmail, icon: const Icon(Icons.email)),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 56.sp),
              TextField(
                controller: _passwordCtrl,
                decoration: InputDecoration(
                    labelText: S.of(context).yourPassword,
                    hintText: S.of(context).inputPassword,
                    icon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                        child: Icon(showPassword ? Icons.visibility : Icons.visibility_off, color: Colors.black26),
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        })),
                obscureText: !showPassword,
              ),
              //登录按钮
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  // decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.colorLinear1, AppTheme.colorLinear2]), borderRadius: BorderRadius.circular(8)),
                  child: BrnBigMainButton(
                      title: S.of(context).login,
                      bgColor: Theme.of(context).primaryColorLight,
                      onTap: () {
                        if (!_isChecked || !_isCheckedBottom) {
                          showCupertinoDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return CupertinoAlertDialog(title: Text(S.of(context).tip), content: Text(S.of(context).privacyAgreement), actions: <Widget>[
                                  CupertinoDialogAction(
                                      child: Text(S.of(context).cancel),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                  CupertinoDialogAction(
                                      child: Text(S.of(context).agree),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          _isChecked = true;
                                          _isCheckedBottom = true;
                                        });
                                        handleLogin();
                                      })
                                ]);
                              });
                        } else {
                          handleLogin();
                        }
                      })
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(S.of(context).noAccount, style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const RegisterPage();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 18.sp, right: 9),
                              child: Text(S.of(context).register,
                                  style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 24.sp, overflow: TextOverflow.ellipsis)
                              ),
                            ),
                        ),
                        //Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const ForgetPassword();
                              }));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 9, right: 0),
                              child: Text(S.of(context).forgetPassword,
                                  style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 24.sp, overflow: TextOverflow.ellipsis)
                              ),
                            ),
                        ),
                    ]
                  )
              ),
            ])
            ),
            bottomNavigationBar: PrivacyAgreement(
                label: "${S.of(context).loginAgree}",
                agree: _isChecked,
                agreeBottom: _isCheckedBottom,
                onPressed: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
              onPressedBottom: () {
                setState(() {
                  _isCheckedBottom = !_isCheckedBottom;
                });
              },
            ),
        ),
    );
  }

  void handleLogin() {
    if (_userNameCtrl.text.isNotEmpty && _passwordCtrl.text.isNotEmpty) {
      // 使用简单的正则表达式验证电子邮件格式
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_userNameCtrl.text)) {
        Fluttertoast.showToast(msg: '${S.of(context).input} ${S.of(context).user_email}');
        return;
      }
      EasyLoading.show();
      context.read<AuthService>().handleLogin(_userNameCtrl.text, _passwordCtrl.text).then((response) {
        try {
          Authenticity authenticity = Authenticity.fromJson(jsonDecode(jsonEncode(response.data)));
          context.read<AuthService>().resetAuthenticity(authenticity);
          context.read<AuthService>().completeLogin(authenticity, _passwordCtrl.text);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const MainPage()), (route) => route == null);
        } on Exception catch (error) {
          Fluttertoast.showToast(msg: S.of(context).network_connect_error);
        } catch (e) {
          Fluttertoast.showToast(msg: S.of(context).network_unknown_error);
        }
      }).onError((error, stackTrace) {
        Response? res = (error as DioException).response;
        if (res == null) {
          Fluttertoast.showToast(msg: S.of(context).network_connect_error);
        } else {
          Fluttertoast.showToast(msg: res.data);
        }
      }).whenComplete(() {
        EasyLoading.dismiss();
      });
    } else {
      Fluttertoast.showToast(msg: S.of(context).inputUsernamePassword);
    }
  }
}
