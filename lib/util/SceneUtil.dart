
import 'package:flutter/material.dart';
import 'package:planter_app/entity/strategy/domain/SceneSetting.dart';
import 'package:planter_app/generated/l10n.dart';
import 'package:planter_app/provider/SettingProvider.dart';

class SceneUtils {

  static String? getPropertiesKey(SettingType settingType) {
    switch(settingType) {
      case SettingType.SEEDING:
        return "seedingParam";
      case SettingType.VEGETATIVE:
        return "vegetativeParam";
      case SettingType.FLOWERING:
        return "floweringParam";
    }
    return null;
  }

  static String? getFanTempRange(BuildContext context, int index, SceneSetting? setting, SettingProvider provider) {
    if(setting == null) return null;

    String? text;
    switch(index) {
      case 1:
        var lowTemp = provider.temperatureDisplay(setting.fanSch1?.lowTemp.toDouble() ?? 0);
        var highTemp = provider.temperatureDisplay(setting.fanSch1?.highTemp.toDouble() ?? 0);
        text = "[$lowTemp${provider.temperatureUnit} ~ $highTemp${provider.temperatureUnit}] ${S.of(context).workHour} ${setting.fanSch1?.workTime} ${S.of(context).hour}";
        break;
      case 2:
        var lowTemp = provider.temperatureDisplay(setting.fanSch2?.lowTemp.toDouble() ?? 0);
        var highTemp = provider.temperatureDisplay(setting.fanSch2?.highTemp.toDouble() ?? 0);
        text = "[$lowTemp${provider.temperatureUnit} ~ $highTemp${provider.temperatureUnit}] ${S.of(context).workHour} ${setting.fanSch2?.workTime} ${S.of(context).hour}";
        break;
      case 3:
        var lowTemp = provider.temperatureDisplay(setting.fanSch3?.lowTemp.toDouble() ?? 0);
        var highTemp = provider.temperatureDisplay(setting.fanSch3?.highTemp.toDouble() ?? 0);
        text = "[$lowTemp${provider.temperatureUnit} ~ $highTemp${provider.temperatureUnit}] ${S.of(context).workHour} ${setting.fanSch3?.workTime} ${S.of(context).hour}";
        break;
    }
    return text;
  }

  static String? getVentTempRange(BuildContext context, int index, SceneSetting? setting, SettingProvider provider) {
    if(setting == null) return null;

    String? text;
    switch(index) {
      case 1:
        var lowTemp = provider.temperatureDisplay(setting.ventSch1?.lowTemp.toDouble() ?? 0);
        var highTemp = provider.temperatureDisplay(setting.ventSch1?.highTemp.toDouble() ?? 0);
        text = "[$lowTemp${provider.temperatureUnit} ~ $highTemp${provider.temperatureUnit}] ${S.of(context).workHour} ${setting.ventSch1?.workTime} ${S.of(context).hour}";
        break;
      case 2:
        var lowTemp = provider.temperatureDisplay(setting.ventSch2?.lowTemp.toDouble() ?? 0);
        var highTemp = provider.temperatureDisplay(setting.ventSch2?.highTemp.toDouble() ?? 0);
        text = "[$lowTemp${provider.temperatureUnit} ~ $highTemp${provider.temperatureUnit}] ${S.of(context).workHour} ${setting.ventSch2?.workTime} ${S.of(context).hour}";
        break;
      case 3:
        var lowTemp = provider.temperatureDisplay(setting.ventSch3?.lowTemp.toDouble() ?? 0);
        var highTemp = provider.temperatureDisplay(setting.ventSch3?.highTemp.toDouble() ?? 0);
        text = "[$lowTemp${provider.temperatureUnit} ~ $highTemp${provider.temperatureUnit}] ${S.of(context).workHour} ${setting.ventSch3?.workTime} ${S.of(context).hour}";
        break;
    }
    return text;
  }
}


