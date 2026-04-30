import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/entity/security/entity/User.dart';
import 'package:provider/provider.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/security/Authenticity.dart';

import '../../Constants.dart';
import '../../common/AuthService.dart';
import '../../generated/l10n.dart';
import '../MainPage.dart';
import 'PrivacyAgreement.dart';

/**
 * RegisterPage 主类
 **/
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

/**
 * RegisterPage UI布局
 **/
class _RegisterPageState extends State<RegisterPage> with _RegisterPageMixin {
  final _formKey = GlobalKey<FormState>();

  String? _email = "";

  String? _password = "";

  bool _showPassword = false;

  bool _validCodeSend = false;

  bool _validEmail = false;

  bool _showConfirmPassword = false;

  String? _confirmPassword;

  String validCode = "=.*[A-Za-z])(?=.*\d)";

  /// 登录并同意协议默认不勾选，图标
  bool _isChecked = false;
  bool _isCheckedBottom = false;

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Assets.images.loginBg.image()
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login-bg@3x.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(iconTheme: const IconThemeData(color: Colors.black), backgroundColor: Colors.transparent, elevation: 0),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 100.sp),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('${S.of(context).welcome_create_account}', style: TextStyle(color: Colors.black87, fontSize: 36.sp, height: 2.1)),
                    ])),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: S.of(context).user_email,
                      hintText: "${S.of(context).input} ${S.of(context).user_email}",
                      icon: const Icon(Icons.email),
                      suffix: Visibility(
                        visible: (!_validCodeSend) && _validEmail,
                        child: TextButton(
                            onPressed: () {
                              if (_validCodeSend) {
                                Fluttertoast.showToast(msg: S.of(context).send_valid_code);
                              } else {
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_email!)) {
                                  Fluttertoast.showToast(msg: '${S.of(context).input} ${S.of(context).user_email}');
                                  return;
                                }
                                String baseUrl = HttpService.instance.getBaseUrl(Constants.BASE_URL);
                                Dio dio = HttpService.instance.createDio(baseUrl, contentType: Headers.jsonContentType);
                                dio.get("/sendRegisterCode", queryParameters: {"email": _email}).then((value) {
                                  validCode = value.data;
                                  setState(() {
                                    _validCodeSend = true;
                                  });
                                  Fluttertoast.showToast(msg: S.of(context).send_valid_code);
                                });
                              }
                            },
                            child: const Text("Get Code"),
                            //child: TextButton(onPressed: (){}, child: Text("Get Code")),//Icon(_validCodeSend ? Icons.send_rounded : Icons.send_sharp, color: Colors.black26),
                          ),
                      ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '${S.of(context).input} ${S.of(context).user_email}';
                    }
                    // 使用简单的正则表达式验证电子邮件格式
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return '${S.of(context).input} ${S.of(context).user_email}';
                    }
                    return null; // 验证通过
                  },
                  onChanged: (value) {
                    _email = value; // 保存输入的值
                    _validCodeSend = false;
                    setState(() {
                      _validEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
                    });
                  },
                  onSaved: (value) {
                    _email = value; // 保存输入的值
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
                TextFormField(
                  maxLength: 6,
                  decoration: InputDecoration(
                      labelText: S.of(context).validate_code,
                      hintText: S.of(context).validate_code,
                      icon: const Icon(Icons.security),
                      suffixIcon: Icon(Icons.verified_user_sharp, color: Colors.black26)),
                  validator: (value) {
                    if (value != validCode) {
                      return S.of(context).valid_code_invalid;
                    }
                    return null; // 验证通过
                  },
                  onSaved: (value) {},
                ),
                //登录按钮
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: BrnBigMainButton(
                        title: S.of(context).create_account,
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
          ),
          bottomNavigationBar: PrivacyAgreement(
            label: S.of(context).loginAgree,
            agree: _isChecked,
            agreeBottom: _isCheckedBottom,
            onPressed: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            onPressedBottom: (){
              setState(() {
                _isCheckedBottom = !_isCheckedBottom;
              });
            },
          ),
        )
    );
  }

  handleRegister() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // 保存输入的值
      User user = User(password: _password, email: _email);
      EasyLoading.show();
      context.read<AuthService>().handleRegister(user).then((response) {
        try {
          Authenticity authenticity = Authenticity.fromJson(jsonDecode(jsonEncode(response.data)));
          context.read<AuthService>().resetAuthenticity(authenticity);
          context.read<AuthService>().completeLogin(authenticity, _password!);
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
    }
  }
}

/**
 * RegisterPage 数据逻辑
 **/
mixin _RegisterPageMixin<T extends StatefulWidget> on State<T> {}
