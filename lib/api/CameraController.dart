import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/device/domain/Camera.dart';
import '../entity/domain/ResponseResult.dart';
// endregion

/**
   */
class CameraController {
  static const CONTROL_CAMERA = 'camera/controlCamera';
  /**
   */
  static Future<ResponseResult> controlCamera(String deviceIds, String channelNo, int direction) {
    return HttpService.post<ResponseResult>(CONTROL_CAMERA,
        queryParameters: {"deviceIds": deviceIds, "channelNo": channelNo, "direction": direction}, fromJson: ResponseResult.fromJson);
  }

  static const GET_CAMERAS_BY_ROOM_ID = 'camera/getCamerasByRoomId';
  /**
   * 查看摄像头
   * @param roomId
   * @return List<Camera>
   */
  static Future<List<Camera>?> getCamerasByRoomId(int roomId) {
    return HttpService.getList<Camera>(GET_CAMERAS_BY_ROOM_ID, queryParameters: {"roomId": roomId}, fromJson: Camera.fromJson);
  }

  // region 前端扩展代码区
  // endregion
}
