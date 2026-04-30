import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tornado/network/HttpService.dart';

import '../../Constants.dart';
import '../../api/SecurityController.dart';
import '../../generated/l10n.dart';
import 'UpdatePassword.dart';

/**
* ForgetPassword 主类
**/
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

/**
* ForgetPassword UI布局
**/
class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController()..text = "";
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
                    Text(S.of(context).recover_password_title, style: TextStyle(color: Colors.black87, fontSize: 36.sp, height: 2.1)),
                  ])),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: S.of(context).user_email, hintText: "${S.of(context).input} ${S.of(context).user_email}", icon: const Icon(Icons.email)),
                controller: _emailCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '${S.of(context).input} ${S.of(context).user_email}';
                  }
                  // 使用简单的正则表达式验证电子邮件格式

                  return null; // 验证通过
                },
              ),
              SizedBox(height: 16.sp),
              BrnBigMainButton(
                title: S.of(context).send_recover_email,
                onTap: () {
                  if (_emailCtrl.text.isNotEmpty) {
                    String email = _emailCtrl.text;
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                      Fluttertoast.showToast(msg: '${S.of(context).input} ${S.of(context).user_email}');
                      return;
                    }
                    String baseUrl = HttpService.instance.getBaseUrl(Constants.BASE_URL);
                    Dio dio = HttpService.instance.createDio(baseUrl, contentType: Headers.jsonContentType);
                    dio.get("/sendEmailValidationCode", queryParameters: {"email": email}).then((value) {
                      Fluttertoast.showToast(msg: S.of(context).send_recover_email_success);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword(email: email, validationCode: value.data)));
                    });
                  }
                },
              ),
            ]),
          ),
        ));
  }
}
