import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/strategy/entity/Mode.dart';
// endregion

   /**
   * 模式(Mode)表控制层
   * @author 
   * @since 2024-05-15 17:07:47
   */
class ModeController{

    static const ADD_MODE = 'mode/addMode';
   /**
   */
    static Future<Mode> addMode(Mode mode) {
        return HttpService.post<Mode>(ADD_MODE, data: mode, fromJson: Mode.fromJson);
    }

    static const GET_MODE_BY_ID = 'mode/getModeById';
   /**
   */
    static Future<Mode?> getModeById(int modeId) {
        return HttpService.get<Mode>(GET_MODE_BY_ID, queryParameters: {"modeId": modeId}, fromJson: Mode.fromJson);
    }

    static const REMOVE_MODE_BY_ID = 'mode/removeModeById';
   /**
   */
    static Future<int?> removeModeById(int modeId) {
        return HttpService.delete<int>(REMOVE_MODE_BY_ID, queryParameters: {"modeId": modeId});
    }

    static const UPDATE_MODE = 'mode/updateMode';
   /**
   */
    static Future<Mode> updateMode(Mode mode) {
        return HttpService.post<Mode>(UPDATE_MODE, data: mode, fromJson: Mode.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
