import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

// region 前端扩展导入包
import '../entity/farm/entity/Plant.dart';
import '../entity/farm/entity/PlantCategory.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:tornado/network/HttpService.dart';
// endregion

/**
   */
class PlantController {
  static const ADD_PLANT = 'plant/addPlant';
  /**
   */
  static Future<Plant> addPlant(Plant plant) {
    return HttpService.post<Plant>(ADD_PLANT, data: plant, fromJson: Plant.fromJson);
  }

  static const ADD_PLANT_CATEGORY = 'plant/addPlantCategory';
  /**
   */
  static Future<PlantCategory> addPlantCategory(PlantCategory plantCategory) {
    return HttpService.post<PlantCategory>(ADD_PLANT_CATEGORY, data: plantCategory, fromJson: PlantCategory.fromJson);
  }

  static const GET_ALL_PLANT_CATEGORIES = 'plant/getAllPlantCategories';
  /**
   */
  static Future<List<PlantCategory>?> getAllPlantCategories() {
    return HttpService.getList<PlantCategory>(GET_ALL_PLANT_CATEGORIES, fromJson: PlantCategory.fromJson);
  }

  static const GET_PLANT_CATEGORY_BY_ID = 'plant/getPlantCategoryById';
  /**
   */
  static Future<PlantCategory?> getPlantCategoryById(int categoryId) {
    return HttpService.get<PlantCategory>(GET_PLANT_CATEGORY_BY_ID, queryParameters: {"categoryId": categoryId}, fromJson: PlantCategory.fromJson);
  }

  static const GET_PLANTS_BY_CATEGORY_ID = 'plant/getPlantsByCategoryId';
  /**
   */
  static Future<List<Plant>?> getPlantsByCategoryId(int categoryId) {
    return HttpService.getList<Plant>(GET_PLANTS_BY_CATEGORY_ID, queryParameters: {"categoryId": categoryId}, fromJson: Plant.fromJson);
  }

  static const GET_PLANTS_BY_FARM_ID = 'plant/getPlantsByFarmId';
  /**
   * @return List<Plant>
   */
  static Future<List<Plant>?> getPlantsByFarmId() {
    return HttpService.getList<Plant>(GET_PLANTS_BY_FARM_ID, fromJson: Plant.fromJson);
  }

  static const PAGE_PLANT = 'plant/pagePlant';

  static const REMOVE_PLANT_BY_ID = 'plant/removePlantById';
  /**
   */
  static Future<int?> removePlantById(int plantId) {
    return HttpService.delete<int>(REMOVE_PLANT_BY_ID, queryParameters: {"plantId": plantId});
  }

  static const REMOVE_PLANT_CATEGORY_BY_ID = 'plant/removePlantCategoryById';
  /**
   */
  static Future<int?> removePlantCategoryById(int categoryId) {
    return HttpService.delete<int>(REMOVE_PLANT_CATEGORY_BY_ID, queryParameters: {"categoryId": categoryId});
  }

  static const UPDATE_PLANT = 'plant/updatePlant';
  /**
   */
  static Future<Plant> updatePlant(Plant plant) {
    return HttpService.post<Plant>(UPDATE_PLANT, data: plant, fromJson: Plant.fromJson);
  }

  static const UPDATE_PLANT_CATEGORY = 'plant/updatePlantCategory';
  /**
   */
  static Future<PlantCategory> updatePlantCategory(PlantCategory plantCategory) {
    return HttpService.post<PlantCategory>(UPDATE_PLANT_CATEGORY, data: plantCategory, fromJson: PlantCategory.fromJson);
  }

  static const UPLOAD_COVER = 'plant/uploadCover';
  /**
   */
  static Future<FileInfo> uploadCover(MultipartFile file, String directory, int plantId) {
    return HttpService.post<FileInfo>(UPLOAD_COVER, queryParameters: {"file": file, "directory": directory, "plantId": plantId}, fromJson: FileInfo.fromJson);
  }

  // region 前端扩展代码区
  // endregion
}
