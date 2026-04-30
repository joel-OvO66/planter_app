import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:planter_app/entity/security/entity/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/security/Authenticity.dart';
import 'package:tornado/tornado.dart';

import '../Constants.dart';

class AuthService with ChangeNotifier {
  static const USER_NAME = "USER_NAME";
  static const PASSWORD = "PASSWORD";
  static const FIRST_LOGIN = "FIRST_LOGIN";
  SharedPreferences? preferences;
  Authenticity? authenticity;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    String? token = preferences!.getString(BaseConstants.ACCESS_TOKEN);
    String? auth = preferences!.getString(BaseConstants.AUTHORIZATION);
    if (auth != null && token != null) {
      try {
        resetAuthenticity(Authenticity.fromJson(json.decode(auth)));
      } on Exception catch (error) {
        print(error);
      }
    }
  }

  setToken(String token) async {
    authenticity!.token = token;
    preferences!.setString(BaseConstants.ACCESS_TOKEN, authenticity!.token);
    notifyListeners();
  }

  Future<Response> handleLogin(String userName, String password) async {
    Map<String, dynamic> params = {"username": userName, "password": password};
    FormData formData = FormData.fromMap(params);
    String baseUrl = HttpService.instance.getBaseUrl(Constants.BASE_URL);
    Dio dio = HttpService.instance.createDio(baseUrl, contentType: Headers.formUrlEncodedContentType);
    return dio.post("/userLogin", data: formData);
  }

  /// 完成登录
  void completeLogin(Authenticity authenticity, String password) {
    preferences!.setString(BaseConstants.ACCESS_TOKEN, authenticity.token);
    preferences!.setString(BaseConstants.AUTHORIZATION, json.encode(authenticity));
    preferences!.setString(USER_NAME, authenticity.name!);
    preferences!.setString(PASSWORD, password);
    notifyListeners();
  }

  Future<Response> handleRegister(User user) async {
    String baseUrl = HttpService.instance.getBaseUrl(Constants.BASE_URL);
    Dio dio = HttpService.instance.createDio(baseUrl, contentType: Headers.jsonContentType);
    return dio.post("/register", data: user);
  }

  void resetAuthenticity(Authenticity? authCustomer) {
    if (authCustomer != null) {
      authenticity = authCustomer;
      notifyListeners();
    }
  }

  bool isLoggedIn() {
    return authenticity != null;
  }

  /// 退出
  void logout() {
    preferences!.remove(BaseConstants.ACCESS_TOKEN);
    preferences!.remove(BaseConstants.AUTHORIZATION);
    preferences!.remove(USER_NAME);
    preferences!.remove(PASSWORD);
    authenticity != null;
  }

  bool firstLogin() {
    return preferences!.getBool(FIRST_LOGIN) ?? true;
  }

  void setFirstLogin(bool isFirst) {
    preferences!.setBool(FIRST_LOGIN, isFirst);
  }

  // get user{
  //   return User(userId: authenticity!.id!,userName: authenticity!.name,realName: authenticity!.fullName);
  // }
}
