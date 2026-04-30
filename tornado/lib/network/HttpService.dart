import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tornado/bean/FileInfo.dart';

import 'AuthInterceptor.dart';
import 'ErrorInterceptor.dart';
import 'HttpLog.dart';

class HttpService {
  static const String BASE_URL = "BASE_URL";

  // 工厂模式
  factory HttpService() => _getInstance();

  static HttpService get instance => _getInstance();
  static HttpService _instance = HttpService._internal();

  late Dio dio;

  late SharedPreferences preferences;

  String? baseUrl;

  HttpService._internal() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      baseUrl = value.getString(BASE_URL);
    });
  }

  static HttpService _getInstance() {
    if (_instance == null) {
      _instance = new HttpService._internal();
    }
    return _instance;
  }

  static void checkPath(String path) {
    if (path.trim() == '') {
      throw Exception('path not empty');
    }
  }

  Dio createDio(String baseUrl,
      {int connectTimeout = 15000, int receiveTimeout = 60 * 3, ResponseType? responseType = ResponseType.json, String contentType = Headers.jsonContentType}) {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: connectTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
        responseType: responseType,
        contentType: contentType);
    Dio dio = Dio(options);
    if (contentType != Headers.jsonContentType) {
      dio.options.headers["x-requested-with"] = "XMLHttpRequest";
    }
    //网络状态拦截
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(HttpLog());
    dio.interceptors.add(ErrorInterceptor());
    return dio;
  }

  void init(String defaultUrl,
      {String contextPath = "",
      int connectTimeout = 15000,
      int receiveTimeout = 60 * 3,
      ResponseType responseType = ResponseType.json,
      String contentType = Headers.jsonContentType}) {
    String baseUrl = getBaseUrl(defaultUrl);
    dio = createDio(baseUrl + contextPath, connectTimeout: connectTimeout, receiveTimeout: receiveTimeout, responseType: responseType, contentType: contentType);
  }

  void setBaseUrl(String baseUrl) {
    this.baseUrl = baseUrl;
    preferences.setString(BASE_URL, baseUrl);
  }

  String getBaseUrl(String defaultUrl) {
    if (this.baseUrl != null) {
      return baseUrl!;
    } else {
      return defaultUrl;
    }
  }

  /// ```dart
  ///   1.
  ///   HttpService.getList<Notice>('rest/notice/getListNoticeByTopNumber?topNumber=$num', (e) => Notice.fromJson(e)).then((value) {
  ///     this.noticeList = value;
  ///   });
  ///   2.
  ///   List<Notice> notices = await HttpService.getList<Notice>('rest/notice/getListNoticeByTopNumber?topNumber=5', fromJson: (e) => Notice.fromJson(e));
  ///   3.
  ///   List<Notice> notices = await HttpService.getList<Notice>('rest/notice/getListNoticeByTopNumber', queryParameters: {'topNumber': 5}, fromJson: (e) => Notice.fromJson(e));
  ///  ```
  static Future<List<T>> getList<T>(String path, {Function? fromJson, queryParameters, options, cancelToken, onReceiveProgress}) {
    checkPath(path);
    return HttpService.instance.dio
        .get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress)
        .then((Response response) {
      if (fromJson == null) {
        return response.data;
      } else {
        List<T> list = (response.data as List<dynamic>).map((e) => fromJson((e)) as T).toList();
        return list;
      }
    });
  }

  /// ```dart
  ///   1.
  ///   HttpService.get<Notice>('rest/notice/getListNoticeByTopNumber?topNumber=$num', fromJson: (e) => Notice.fromJson(e).then((value) {
  ///     this.notice = value;
  ///   });
  ///   2.
  ///   Notice notice = await HttpService.get<Notice>('rest/notice/getListNoticeByTopNumber?topNumber=5', fromJson: (e) => Notice.fromJson(e));
  ///   3.
  ///   Notice notice = await HttpService.get<Notice>('rest/notice/getListNoticeByTopNumber', queryParameters: {'topNumber': 5}, fromJson: (e) => Notice.fromJson(e));
  ///  ```
  static Future<T?> get<T>(path, {Function? fromJson, queryParameters, options, cancelToken, onReceiveProgress}) {
    checkPath(path);
    return HttpService.instance.dio
        .get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress)
        .then((Response response) {
      if (fromJson == null) {
        return response.data as T;
      } else {
        if (response.data.toString().isEmpty) {
          return null;
        }
        return fromJson(response.data as Map<String, dynamic>) as T;
      }
    });
  }

  /// ```dart
  ///   1.
  ///   PowerSupplyBureau psb = PowerSupplyBureau();
  ///   psb.bureauName = "Flutter供电局";
  ///   psb.province = '410000';
  ///   psb.city = '411500';
  ///   psb.district = '411524';
  ///   int pid = await HttpService.post<int>('rest/bureau/addPowerSupplyBureau', data: psb);
  ///   2.
  ///   List<PowerSupplyBureau> psbs = await HttpService.postList<PowerSupplyBureau>('rest/notice/updatePowerSupplyBureau', fromJson: (e) => PowerSupplyBureau.fromJson(e));
  ///  ```
  static Future<List<T>> postList<T>(String path, {Function? fromJson, data, queryParameters, options, cancelToken, onReceiveProgress}) {
    checkPath(path);
    return HttpService.instance.dio
        .post(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress)
        .then((Response response) {
      if (fromJson == null) {
        return response.data;
      } else {
        List<T> list = (response.data as List<dynamic>).map((e) => fromJson((e)) as T).toList();
        return list;
      }
    });
  }

  /// ```dart
  ///   1.
  ///   PowerSupplyBureau powerSupplyBureau = PowerSupplyBureau();
  ///   powerSupplyBureau.bureauName = "Flutter供电局";
  ///   powerSupplyBureau.province = '410000';
  ///   powerSupplyBureau.city = '411500';
  ///   powerSupplyBureau.district = '411524';
  ///   int pid = await HttpService.post<int>('rest/bureau/addPowerSupplyBureau', data: powerSupplyBureau);
  ///   2.
  ///   PowerSupplyBureau psb = await HttpService.post<PowerSupplyBureau>('rest/notice/updatePowerSupplyBureau', fromJson: (e) => PowerSupplyBureau.fromJson(e));
  ///  ```
  static Future<T> post<T>(String path, {Function? fromJson, data, queryParameters, options, cancelToken, onReceiveProgress}) {
    checkPath(path);
    return HttpService.instance.dio
        .post(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress)
        .then((Response response) {
      return fromJson == null ? response.data : fromJson((response.data as Map<String, dynamic>)) as T;
    });
  }

  /// ```dart
  ///   1.
  ///   PowerSupplyBureau p = PowerSupplyBureau();
  ///   p.bureauId = 57;
  ///   HttpService.delete<int>('rest/bureau/removePowerSupplyBureau' data: p);
  ///  ```
  static Future<T?> delete<T>(String path, {Function? fromJson, data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) {
    checkPath(path);
    return HttpService.instance.dio.delete<T>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken).then((Response response) {
      if (fromJson == null) {
        return response.data;
      } else {
        return response.data.toString().isEmpty ? null : fromJson((response.data as Map<String, dynamic>)) as T;
      }
    });
  }

  /// ```dart
  ///   1.
  ///   var formData = FormData.fromMap({'file': await MultipartFile.fromFile(image!.path, filename: image.name), 'directory': 'ok'});
  ///   FileBean fileBean = await HttpService.uploadImage('/rest/upload/uploadImage/', formData);
  ///  ```
  static Future<FileInfo> uploadFile(String path, data, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) {
    checkPath(path);
    return post<FileInfo>(path,
        fromJson: (v) => FileInfo.fromJson(v), data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
  }

  /// ```dart
  ///   1.
  ///   var formData = FormData.fromMap({'file': await MultipartFile.fromFile(image!.path, filename: image.name), 'directory': 'ok'});
  ///   FileBean fileBean = await HttpService.deleteFile('/rest/upload/uploadImage/', formData);
  ///  ```
  static Future<dynamic> deleteFile(String path, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) {
    checkPath(path);
    return delete<FileInfo>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
  }
}

extension FutureExtension<T> on Future<T?> {
  Future<T?> ifNotNull(void Function(T value) onValue) {
    return this.then((value) {
      if (value != null) {
        onValue(value);
      }
      return value;
    });
  }

  /// 当 Future 结果为 null 时执行
  Future<T?> ifNull(void Function() onNull) {
    return this.then((value) {
      if (value == null) {
        onNull();
      }
      return value;
    });
  }
}
