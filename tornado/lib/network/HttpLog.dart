import 'package:dio/dio.dart';

import '../tornado.dart';

class HttpLog extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (BaseConstants.DEBUG) {
      print("\n ---------Start Http Request---------");
      print("Request_BaseUrl:${options.baseUrl}");
      print("Request_Path:${options.path}");
      print("Request_Method:${options.method}");
      print("Request_Headers:${options.headers}");
      print("Request_Data:${options.data}");
      print("Request_QueryParameters:${options.queryParameters}");
      print("---------End Http Request---------");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (BaseConstants.DEBUG) {
      print("---------Start Http Response---------");
      print("Response_StatusCode:${response.statusCode}");
      print("Response_StatusMessage:${response.statusMessage}");
      print("Response_Headers:${response.headers.toString()}");
      print("Response_Data:${response.data.toString()}");
      print("---------End Http Response---------");
    }
    super.onResponse(response, handler);
  }
}
