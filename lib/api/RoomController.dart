import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/farm/domain/RoomProfile.dart';
import '../entity/farm/entity/Room.dart';
// endregion

/**
   */
class RoomController {
  static const ADD_ROOM = 'room/addRoom';
  /**
   * 新增设备
   * @param room
   * @return room
   */
  static Future<Room> addRoom(Room room) {
    return HttpService.post<Room>(ADD_ROOM, data: room, fromJson: Room.fromJson);
  }

  static const GET_ALL_ROOM_PROFILES = 'room/getAllRoomProfiles';
  /**
   */
  static Future<List<RoomProfile>?> getAllRoomProfiles() {
    return HttpService.getList<RoomProfile>(GET_ALL_ROOM_PROFILES, fromJson: RoomProfile.fromJson);
  }

  static const GET_ALL_ROOMS = 'room/getAllRooms';
  /**
   */
  static Future<List<Room>?> getAllRooms() {
    return HttpService.getList<Room>(GET_ALL_ROOMS, fromJson: Room.fromJson);
  }

  static const GET_HISTORY_SENSOR_DATA_BY_ROOM_ID = 'room/getHistorySensorDataByRoomId';
  /**
   */
  // static Future<List<DeviceMeasurement>?> getHistorySensorDataByRoomId(int roomId, String property, DateTime startTime, DateTime endTime) {
  //     String? startTimeStr = startTime != null?DateFormat('yyyy-MM-dd mm:HH:ss').format(startTime):null ;
  //     String? endTimeStr = endTime != null?DateFormat('yyyy-MM-dd mm:HH:ss').format(endTime):null ;
  //
  //     return HttpService.getList<DeviceMeasurement>(GET_HISTORY_SENSOR_DATA_BY_ROOM_ID, queryParameters: {"roomId": roomId,"property": property,"startTime": startTimeStr,"endTime": endTimeStr}, fromJson: DeviceMeasurement.fromJson);
  // }

  static const GET_ROOM_BY_ID = 'room/getRoomById';
  /**
   */
  static Future<Room?> getRoomById(int roomId) {
    return HttpService.get<Room>(GET_ROOM_BY_ID, queryParameters: {"roomId": roomId}, fromJson: Room.fromJson);
  }

  static const GET_ROOM_PROFILE_BY_ID = 'room/getRoomProfileById';
  /**
   */
  static Future<RoomProfile?> getRoomProfileById(int roomId) {
    return HttpService.get<RoomProfile>(GET_ROOM_PROFILE_BY_ID, queryParameters: {"roomId": roomId}, fromJson: RoomProfile.fromJson);
  }

  static const REMOVE_ROOM_BY_ID = 'room/removeRoomById';
  /**
   */
  static Future<int?> removeRoomById(int roomId) {
    return HttpService.delete<int>(REMOVE_ROOM_BY_ID, queryParameters: {"roomId": roomId});
  }

  static const UPDATE_ROOM = 'room/updateRoom';
  /**
   */
  static Future<Room> updateRoom(Room room) {
    return HttpService.post<Room>(UPDATE_ROOM, data: room, fromJson: Room.fromJson);
  }

  // region 前端扩展代码区
  // endregion
}
