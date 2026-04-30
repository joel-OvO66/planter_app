import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/domain/ResponseResult.dart';
// endregion

/**
   */
class IotController {
  // static const DEVICE/COUNT = 'iot/data/device/count';
  // /**
  // */
  //  static Future<DeviceCount?> deviceCount() {
  //      return HttpService.get<DeviceCount>(DEVICE/COUNT, fromJson: DeviceCount.fromJson);
  //  }
  //
  //  static const LIST_HISTORY_BY_GATEWAY = 'iot/data/listHistoryByGateway';
  // /**
  // */
  //  static Future<List<DeviceMeasurement>> getPropertyListByGateWay(String deviceId, String property, DateTime startTime, DateTime endTime) {
  //      String? startTimeStr = startTime != null?DateFormat('yyyy-MM-dd mm:HH:ss').format(startTime):null ;
  //      String? endTimeStr = endTime != null?DateFormat('yyyy-MM-dd mm:HH:ss').format(endTime):null ;
  //
  //      return HttpService.postList<DeviceMeasurement>(LIST_HISTORY_BY_GATEWAY, queryParameters: {"deviceId": deviceId,"property": property,"startTime": startTimeStr,"endTime": endTimeStr}, fromJson: DeviceMeasurement.fromJson);
  //  }
  //
  //  static const GET_VALUES_BY_GATEWAY = 'iot/data/getValuesByGateway';
  // /**
  // */
  //  static Future<List<Measurement>> getValuesByGateway(DataRequest requests) {
  //      return HttpService.postList<Measurement>(GET_VALUES_BY_GATEWAY, data: requests, fromJson: Measurement.fromJson);
  //  }

  static const SET_PROPERTIES = 'iot/data/setProperties';
  /**
   */
  static Future<ResponseResult> setProperties(String deviceId, Map properties) {
    return HttpService.post<ResponseResult>(SET_PROPERTIES, data: properties, queryParameters: {"deviceId": deviceId}, fromJson: ResponseResult.fromJson);
  }

  // region 前端扩展代码区
  // endregion
}
