import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tornado.dart';


class AuthInterceptor extends Interceptor {
  String? accessToken="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbmlzdHJhdG9yIiwicmVhbE5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJidXJlYXVJZCI6MSwiaXNzIjoieXh0d2ViIiwic3VwZXJBdXRob3JpdHkiOnRydWUsImV4cCI6MTYzMjM0NjU0OSwiaWF0IjoxNjMyMjc0NTQ5LCJqdGkiOiIxIiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9TVVBFUiJdfQ.ou9eZRpSV6qJMAR8tKMS5Y2kMPAbUX-aoLDftexz6hA";

  SharedPreferences? _preferences;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if(_preferences==null){
      _preferences= await SharedPreferences.getInstance();
    }
    String? accessToken = _preferences!.getString(BaseConstants.ACCESS_TOKEN);
    if (accessToken != null && accessToken != '') {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      String? resToken = response.headers.value('Authorization');
      if (resToken != null) {
        this.accessToken = resToken;
        _preferences!.setString(BaseConstants.ACCESS_TOKEN, resToken);
      }
    }
    super.onResponse(response, handler);
  }
}
