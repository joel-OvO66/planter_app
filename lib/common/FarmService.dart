import 'package:flutter/material.dart';
import 'package:planter_app/entity/farm/entity/Farm.dart';

import '../api/FarmController.dart';
import '../api/PlantController.dart';

class FarmService with ChangeNotifier {
  List<Farm> farms = [];

  Farm? currentFarm;

  FarmService() {}

  Future<void> reloadFarms() async {
    await FarmController.getFarmsByLogin().then((value) {
      if (value != null) {
        farms = value;
        if (currentFarm == null && farms.isNotEmpty) {
          currentFarm = farms.first;
        }
        notifyListeners();
      }
    });
  }

  void clearFarms() {
    farms = [];
    currentFarm = null;
  }

  void removeFarm(int tenantId) {
    farms.removeWhere((element) => element.tenantId == tenantId);
    if (currentFarm != null && currentFarm!.tenantId == tenantId) {
      if (farms.isNotEmpty) {
        currentFarm = farms[0];
      } else {
        currentFarm = null;
      }
    }
    notifyListeners();
  }

  void setCurrentFarm(int tenantId) {
    currentFarm = farms.firstWhere((element) => element.tenantId == tenantId);
    notifyListeners();
  }
}
