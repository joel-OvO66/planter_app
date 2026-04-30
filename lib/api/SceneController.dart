import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/domain/ResponseResult.dart';
import '../entity/strategy/domain/SceneSetting.dart';
import '../entity/strategy/entity/Scene.dart';
// endregion

   /**
   */
class SceneController{

    static const ADD_SCENE = 'scene/addScene';
   /**
   */
    static Future<Scene> addScene(Scene scene) {
        return HttpService.post<Scene>(ADD_SCENE, data: scene, fromJson: Scene.fromJson);
    }

    static const APPLY_SCENE_PARAM = 'scene/applySceneParam';
   /**
   */
    static Future<ResponseResult?> applySceneParam(int sceneId, SettingType settingType, String schStartDate, String schEndDate, int modeEnable) {
        return HttpService.get<ResponseResult>(APPLY_SCENE_PARAM, queryParameters: {"sceneId": sceneId,"settingType": settingType?.name,"schStartDate": schStartDate,"schEndDate": schEndDate,"modeEnable": modeEnable}, fromJson: ResponseResult.fromJson);
    }

    static const GET_SCENES_BY_ROOM_ID = 'scene/getScenesByRoomId';
   /**
   */
    static Future<List<Scene>?> getScenesByRoomId(int roomId) {
        return HttpService.getList<Scene>(GET_SCENES_BY_ROOM_ID, queryParameters: {"roomId": roomId}, fromJson: Scene.fromJson);
    }

    static const READ_SCENES_BY_ROOM_ID = 'scene/readScenesByRoomId';
   /**
   * 读取所有场景
   * @param roomId
   * @return List<Scene>
   */
    static Future<List<Scene>?> readScenesByRoomId(int roomId) {
        return HttpService.getList<Scene>(READ_SCENES_BY_ROOM_ID, queryParameters: {"roomId": roomId}, fromJson: Scene.fromJson);
    }

    static const REMOVE_SCENE_BY_ID = 'scene/removeSceneById';
   /**
   */
    static Future<int?> removeSceneById(int sceneId) {
        return HttpService.delete<int>(REMOVE_SCENE_BY_ID, queryParameters: {"sceneId": sceneId});
    }

    static const UPDATE_SCENE = 'scene/updateScene';
   /**
   */
    static Future<Scene> updateScene(Scene scene) {
        return HttpService.post<Scene>(UPDATE_SCENE, data: scene, fromJson: Scene.fromJson);
    }

    static const UPDATE_SCENE_PARAM = 'scene/updateSceneParam';
   /**
   */
    static Future<Scene> updateSceneParam(Scene scene) {
        return HttpService.post<Scene>(UPDATE_SCENE_PARAM, data: scene, fromJson: Scene.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
