import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/views/LoginPage.dart';

import '../../api/SecurityController.dart';
import '../../entity/security/entity/User.dart';
import '../../generated/l10n.dart';

class UpdatePassword extends StatefulWidget {
  final String email;

  final String validationCode;

  const UpdatePassword({super.key, required this.email, required this.validationCode});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _formKey = GlobalKey<FormState>();

  String? _validationCode = "";

  String? _password = "";

  bool _showPassword = false;

  bool _showConfirmPassword = false;

  String? _confirmPassword;

  /// 登录并同意协议默认不勾选，图标
  bool _isChecked = true;

  // 密码验证规则
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).inputPassword;
    }
    if (value.length < 8) {
      return S.of(context).inputPasswordSize;
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$').hasMatch(value)) {
      return S.of(context).inputPasswordNumber;
    }
    return null; // 验证通过
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login-bg@3x.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Form(
            key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 80.sp),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(S.of(context).recover_password, style: TextStyle(color: Colors.black87, fontSize: 56.sp, fontWeight: FontWeight.w600)),
                    Text(S.of(context).reset_password_title, style: TextStyle(color: Colors.black87, fontSize: 36.sp, height: 2.1)),
                  ])),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: S.of(context).validate_code, hintText: "${S.of(context).input} ${S.of(context).validate_code}", icon: const Icon(Icons.security)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '${S.of(context).input} ${S.of(context).validate_code}';
                  }
                  return null; // 验证通过
                },
                onSaved: (value) {
                  _validationCode = value; // 保存输入的值
                },
              ),

              SizedBox(height: 16.sp),
              TextFormField(
                decoration: InputDecoration(
                    labelText: S.of(context).yourPassword,
                    hintText: S.of(context).inputPassword,
                    icon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                        child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off, color: Colors.black26),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        })),
                validator: _validatePassword,
                obscureText: !_showPassword,
                onChanged: (value) {
                  _password = value; // 保存输入的值
                },
                onSaved: (value) {
                  _password = value; // 保存输入的值
                },
              ),
              SizedBox(height: 16.sp),
              TextFormField(
                decoration: InputDecoration(
                    labelText: S.of(context).confirmPassword,
                    hintText: S.of(context).confirmPassword,
                    icon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                        child: Icon(_showConfirmPassword ? Icons.visibility : Icons.visibility_off, color: Colors.black26),
                        onTap: () {
                          setState(() {
                            _showConfirmPassword = !_showConfirmPassword;
                          });
                        })),
                validator: (value) {
                  if (value != _password) {
                    return S.of(context).password_validate;
                  }
                  return null; // 验证通过
                },
                obscureText: !_showConfirmPassword,
                onSaved: (value) {
                  _confirmPassword = value;
                },
              ),
              //登录按钮
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: BrnBigMainButton(
                      title: S.of(context).register,
                      bgColor: Theme.of(context).primaryColorLight,
                      onTap: () {
                        if (!_isChecked) {
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
                                        // 验证表单
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save(); // 保存输入的值
                                          handleRegister();
                                        }
                                      })
                                ]);
                              });
                        } else {
                          handleRegister();
                        }
                      })),
            ]),
          ),
        ));
  }

  void handleRegister() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // 保存输入的值
      if (_validationCode != widget.validationCode) {
        Fluttertoast.showToast(msg: "邮箱验证码不正确，请检查邮件");
        return;
      }
      User user = User(password: _password, email: widget.email);
      EasyLoading.show();
      SecurityController.resetUserPassword(user).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => route == null);
      }).whenComplete(() {
        EasyLoading.dismiss();
      });
    }
  }
}
