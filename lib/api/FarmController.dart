import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/farm/entity/Farm.dart';
import '../entity/farm/entity/Room.dart';
// endregion

   /**
   * 厂区(Farm)表控制层
   * @author gonglei
   * @since 2021-12-13 15:49:50
   */
class FarmController{

    static const ADD_FARM = 'farm/addFarm';
   /**
   * 新增厂区
   * @param farm
   * @return Farm
   * @throws FieldException
   */
    static Future<Farm> addFarm(Farm farm) {
        return HttpService.post<Farm>(ADD_FARM, data: farm, fromJson: Farm.fromJson);
    }

    static const DELETE_FARM_BY_ID = 'farm/deleteFarmById';
   /**
   * 假删除农场
   * @param farmId
   * @return int
   */
    static Future<int?> deleteFarmById(int farmId) {
        return HttpService.delete<int>(DELETE_FARM_BY_ID, queryParameters: {"farmId": farmId});
    }

    static const FIND_ONE_FETCH_MEMBER_BY_FARM_ID = 'farm/findOneFetchMemberByFarmId';
   /**
   * 查看厂区
   */
    static Future<Farm?> findOneFetchMemberByFarmId(int farmId) {
        return HttpService.get<Farm>(FIND_ONE_FETCH_MEMBER_BY_FARM_ID, queryParameters: {"farmId": farmId}, fromJson: Farm.fromJson);
    }

    static const GET_FARM_BY_ID = 'farm/getFarmById';
   /**
   * 查看厂区
   * @param farmId
   * @return Farm
   */
    static Future<Farm?> getFarmById(int farmId) {
        return HttpService.get<Farm>(GET_FARM_BY_ID, queryParameters: {"farmId": farmId}, fromJson: Farm.fromJson);
    }

    static const GET_FARMS_BY_LOGIN = 'farm/getFarmsByLogin';
   /**
   * 登录用户所有的农场
   * @param authentication
   * @return List<Farm>
   */
    static Future<List<Farm>?> getFarmsByLogin() {
        return HttpService.getList<Farm>(GET_FARMS_BY_LOGIN, fromJson: Farm.fromJson);
    }

    static const REMOVE_FARM_BY_ID = 'farm/removeFarmById';
   /**
   * 删除厂区
   * @param farmId
   * @return int
   */
    static Future<int?> removeFarmById(int farmId) {
        return HttpService.delete<int>(REMOVE_FARM_BY_ID, queryParameters: {"farmId": farmId});
    }

    static const UPDATE_FARM = 'farm/updateFarm';
   /**
   * 编辑厂区
   * @param farm
   * @return Farm
   * @throws FieldException
   */
    static Future<Farm> updateFarm(Farm farm) {
        return HttpService.post<Farm>(UPDATE_FARM, data: farm, fromJson: Farm.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
