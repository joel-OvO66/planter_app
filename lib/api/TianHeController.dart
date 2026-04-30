import 'package:dio/dio.dart';
import 'package:tornado/network/ErrorInterceptor.dart';
import 'package:tornado/network/HttpLog.dart';
// endregion

class TianHeController {

  // 工厂模式
  factory TianHeController() => _getInstance();

  static TianHeController get instance => _getInstance();
  static TianHeController _instance = TianHeController._internal();

  late Dio dio;
  BaseOptions? options;

  static TianHeController _getInstance() {
    if (_instance == null) {
      _instance = new TianHeController._internal();
    }
    return _instance;
  }

  TianHeController._internal() {}

  final String key = "87981a85c20a4d529da4bd087247ce74";

  void init(
      {int connectTimeout = 10000, int receiveTimeout = 60 * 3, ResponseType? responseType = ResponseType.json, String? contentType = Headers.jsonContentType}) {
    options = BaseOptions(
        baseUrl: "https://devapi.qweather.com/v7/",
        connectTimeout: Duration(milliseconds: connectTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
        responseType: responseType,
        contentType: contentType);
    dio = Dio(options);

    //网络状态拦截
    dio.interceptors.add(HttpLog());
    dio.interceptors.add(ErrorInterceptor());
  }

  Future getRealTimeWeather(double latitude, double longitude) {
    return get("grid-weather/now", queryParameters: {"location": "${longitude.toStringAsFixed(2)},${latitude.toStringAsFixed(2)}", "key": key, "lang": 'en'});
  }

  Future getCityName(double latitude, double longitude) {
    Uri uri = Uri.https('geoapi.qweather.com', '/v2/city/lookup', {'location': "${longitude.toStringAsFixed(2)},${latitude.toStringAsFixed(2)}", "key": key, "lang": 'en'});
    return TianHeController.instance.dio.getUri(uri).then((value) {
      return Future.value(value.data);
    });
  }

  static Future<T> get<T>(
      path, {
        Function? fromJson,
        queryParameters,
        options,
        cancelToken,
        onReceiveProgress,
      }) async {
    Response response =
    await TianHeController.instance.dio.get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
    if (fromJson == null) {
      return response.data;
    } else {
      return response.data.toString().isEmpty ? Future.value(null) : Future.value(fromJson((response.data as Map<String, dynamic>)) as T);
    }
  }
}
