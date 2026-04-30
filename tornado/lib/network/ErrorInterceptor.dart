import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tornado.dart';
import 'ErrorResponse.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print(error);
    print('======>statusCode ${error.response?.statusCode},请求错误的url：${error.response?.data}');
    //判读异常状态  401未登录过期或者未登录状态的异常
    if (error.response != null) {
      Response response = error.response!;
      String msg = response.statusMessage ?? "";
      String type = "error";
      dynamic responseData = error.response!.data;
      switch (response.statusCode) {
        case 400:
          msg = 'request error(400)';
          if (responseData!=null) {
            if (responseData is String) {
              msg = responseData;
            } else if (responseData is Map<String,dynamic>) {
              ErrorResponse errorResponse=ErrorResponse.fromJson(responseData );
              msg = errorResponse.message ?? "";
            }
          }
          break;
        case 401:
          type = 'warning';
          msg = 'unauthorized，please ReLogin(401)';
          error.response?.statusCode == 401;
          //获取本地存储的Token
          SharedPreferences.getInstance().then((value) {
            String? token = value.getString(BaseConstants.ACCESS_TOKEN);
            if (token != null && token.trim() != '') {
              //Token存在则说明Token过期需要刷新，否则是未登录状态不做处理
              // Dio dio = HttpService.instance.dio!; //获取应用的Dio对象进行锁定  防止后面请求还是未登录状态下请求
              // dio.lock();
              // String accessToken = await getToken(); //重新获取Token
              // dio.unlock();
              // if (accessToken != '') {
              //   Dio tokenDio2 = new Dio(HttpService.instance!.dio!.options); //创建新的Dio实例
              //   var request = error.requestOptions;
              //   request.headers['Authorization'] = 'JWT $accessToken';
              //   // var response = await tokenDio2.request(request.path,
              //   //     data: request.data, queryParameters: request.queryParameters, cancelToken: request.cancelToken, options: request, onReceiveProgress: request.onReceiveProgress);
              // }
            }
          });
          break;
        case 403:
          msg = 'server access denied(403)';
          break;
        case 404:
          msg = 'access source not found(404)';
          break;
        case 408:
          msg = 'request timeout(408)';
          break;
        case 500:
          msg = "server inner error";
          break;
        case 501:
          msg = 'server not found(501)';
          break;
        case 502:
          msg = 'network error(502)';
          break;
        case 503:
          msg = 'server unavailable(503)';
          break;
        case 504:
          msg = 'network timeout(504)';
          break;
        case 505:
          msg = 'HTTP version is not supported(505)';
          break;
        case 0:
          msg = 'network not connect server';
          break;
        default:
          msg = "connect error !";
      }
      if (msg != "") {
        if (msg == "设备离线") {
          msg = "Device offline";
        }
        if (msg == "用户名或密码错误") {
          msg = "Email or password incorrect";
          //error.response?.data = msg;
        }
        Fluttertoast.showToast(msg: msg);
      }
    }
    if (error.response?.data == "用户名或密码错误") {
      error.response?.data = "Email or password incorrect";
    }
    super.onError(error, handler);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取当前的refreshToken，一般后台会在登录后附带一个刷新Token用的reToken
    // String? refreshToken =   prefs.getString(Constants.REFRESH_TOKEN);
    //因为App单例的Dio对象已被锁定，所以需要创建新的Dio实例
    // Dio tokenDio = new Dio(HttpService.instance!.dio!.options);
    // Map<String, String> map = {
    //   "rft": refreshToken,
    // }; //设置当前的refreshToken
    try {
      //发起请求，获取Token
      // var response = await tokenDio.post("/api/v1/user/refresh_token", data: map);
      // if (response.statusCode == 201) {
      // LoginBean loginbean = LoginBean.fromJson(response.data);
      // SharedPreferencesUtil.putData(Constants.ACCESS_TOKEN, loginbean.data.token);
      // if (loginbean.data.rft != null && loginbean.data.rft.trim() != '') {
      //   SharedPreferencesUtil.putData(Constants.REFRESH_TOKEN, loginbean.data.rft);
      // }
      // return loginbean.data.token;
      // }
      return '';
    } on DioError catch (e) {
      print("Token refresh failed:$e");
      prefs.setString(BaseConstants.ACCESS_TOKEN, '');
      // SharedPreferencesUtil.putData(Constants.REFRESH_TOKEN, '');
      return '';
    }
  }
}
