import 'dart:io';

import 'package:bruno/bruno.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:planter_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style/BrunoThemeConfig.dart';

class SettingProvider with ChangeNotifier {
  static const String TEMPERATURE_UNIT = "temperatureUnit";
  static const String LENGTH_UNIT = "lengthUnit";
  static const String FIRSTDAY = "firstday";
  static const String LANGUAGECODE = "languageCode";
  static const String COUNTRYCODE = "countryCode";
  static const String THEME_MODE = "themeMode";
  static const String SYNC_DEV_TIME ="autoSyncDevTime";
  static const String LAST_WIFI_SSID = "wifiLastSSID";
  static const String LAST_WIFI_PWD = "wifiLastWpd";
  late SharedPreferences preferences;

  ThemeMode _themeMode = ThemeMode.light;

  // 获取设备的时区
  String? _timeZone;

  String _temperatureUnit = "°C";

  String _lengthUnit = "centimeter";

  String _firstDay = "monday";

  String _languageCode = "zh";


  String? _countryCode;

  Locale get locale => Locale(_languageCode, _countryCode);

  ThemeMode get themeMode => _themeMode;

  bool _autoSyncDevTimes = true;

  String? _wifiSsid;
  String? _wifiPwd;

  SettingProvider() {}

  Future<void> initSetting() async {
    preferences = await SharedPreferences.getInstance();
    _temperatureUnit = preferences.getString(TEMPERATURE_UNIT) ?? "°C";
    _lengthUnit = preferences.getString(LENGTH_UNIT) ?? "centimeter";
    _firstDay = preferences.getString(FIRSTDAY) ?? "monday";
    _languageCode = preferences.getString(LANGUAGECODE) ?? "en";
    _countryCode = preferences.getString(COUNTRYCODE);
    _autoSyncDevTimes = preferences.getBool(SYNC_DEV_TIME) ?? true;
    _themeMode = ThemeMode.light;//preferences.getString(THEME_MODE) == "dark" ? ThemeMode.dark : ThemeMode.light;

    _wifiSsid = preferences.getString(LAST_WIFI_SSID);
    _wifiPwd = preferences.getString(LAST_WIFI_PWD);
    FlutterTimezone.getLocalTimezone().then((value) => _timeZone = value.identifier);
  }

  void setLocale(Locale locale) {
    _languageCode = locale.languageCode;
    _countryCode = locale.countryCode;
    preferences.setString(LANGUAGECODE, _languageCode);
    if (_countryCode != null) {
      preferences.setString(COUNTRYCODE, _countryCode!);
    } else {
      preferences.remove(COUNTRYCODE);
    }

    notifyListeners();
  }

  void setTemperatureUnit(temperatureUnit) {
    _temperatureUnit = temperatureUnit;
    preferences.setString(TEMPERATURE_UNIT, _temperatureUnit);
    notifyListeners();
  }

  void setLengthUnit(lengthUnit) {
    _lengthUnit = lengthUnit;
    preferences.setString(LENGTH_UNIT, _lengthUnit);
    notifyListeners();
  }

  void setFirstDay(firstDay) {
    _firstDay = firstDay;
    preferences.setString(FIRSTDAY, _firstDay);
    notifyListeners();
  }

  /// 切换风格
  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    preferences.setString(THEME_MODE, _themeMode.name);
    BrnInitializer.register(allThemeConfig: themeMode == ThemeMode.light ? BrunoThemeConfig.lightBrnTheme() : BrunoThemeConfig.darkBrnTheme());
    notifyListeners();
  }

  String toLocalLabel(Locale locale, BuildContext context) {
    switch (locale.languageCode) {
      case 'en':
        return S.of(context).lang_en;
      case 'zh':
        if (locale.countryCode == 'CN') {
          return S.of(context).lang_zh_CN;
        } else {
          return S.of(context).lang_zh_TW;
        }
    }
    return '未知';
  }

  DateTimePickerLocale toDateTimePickerLocale() {
    switch(locale.languageCode){
      case 'en':
        return DateTimePickerLocale.en_us;
      case 'zh':
        return DateTimePickerLocale.zh_cn;
    }
    return DateTimePickerLocale.en_us;
  }

  void setAutoSyncDevTime(bool enable) {
    _autoSyncDevTimes = enable;
    preferences.setBool(SYNC_DEV_TIME, _autoSyncDevTimes);
    notifyListeners();
  }

  void setWifiSsid(String? ssid) {
    _wifiSsid = ssid;
    preferences.setString(LAST_WIFI_SSID, _wifiSsid?? "");
    notifyListeners();
  }

  void setWifiPwd(String? pwd) {
    _wifiPwd = pwd;
    preferences.setString(LAST_WIFI_PWD, _wifiPwd?? "");
    notifyListeners();
  }

  String get timeZone {
    return _timeZone!;
  }

  String get temperatureUnit {
    return _temperatureUnit;
  }

  String get lengthUnit {
    return _lengthUnit;
  }

  String get firstDay {
    return _firstDay;
  }

  bool get autoSyncDevTime {
    return _autoSyncDevTimes;
  }

  String? get wifiSsid {
    return _wifiSsid;
  }

  String? get wifiPwd {
    return _wifiPwd;
  }

  /// 摄氏度转华氏度
  /// [celsius] 摄氏度温度值
  /// 返回转换后的华氏度温度值
  double celsiusToFahrenheit(double celsius) {
    return celsius * 9 / 5 + 32;
  }

  /// 华氏度转摄氏度
  /// [fahrenheit] 华氏度温度值
  /// 返回转换后的摄氏度温度值
  double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  // double temperature(double value, int tempUnit) {
  //   if (tempUnit == 0) {
  //     if (temperatureUnit == "°C") {
  //       return value;
  //     } else {
  //       return celsiusToFahrenheit(value);
  //     }
  //   } else {
  //     if (temperatureUnit == "°F") {
  //       return fahrenheitToCelsius(value);
  //     } else {
  //       return value;
  //     }
  //   }
  // }


  double temperature1(double value, int tempUnit) {
    if (temperatureUnit == "°C") {
      return value;
    } else {
      return celsiusToFahrenheit(value);
    }
    // if (tempUnit == 0) {
    //   if (temperatureUnit == "°C") {
    //     return value;
    //   } else {
    //     return celsiusToFahrenheit(value);
    //   }
    // } else {
    //   if (temperatureUnit == "°F") {
    //     return fahrenheitToCelsius(value);
    //   } else {
    //     return value;
    //   }
    // }
  }

  int temperatureDisplay(double value) {
    double tempTen = value / 100.0;

    if (temperatureUnit == "°C") {
      return tempTen.round();
    } else {
      return celsiusToFahrenheit(tempTen).round();
    }
    // if (temperatureUnit == "°C") {
    //   return value.toInt();
    // } else {
    //   return celsiusToFahrenheit(value).toInt();
    // }
  }

  int tempDisplayToLocal(double value) {
    if (temperatureUnit == "°C") {
      return (value*100).toInt();
    } else {
      return (fahrenheitToCelsius(value)*100).toInt();
    }
  }

  void main() async {
    // 获取设备的时区
    // String timeZone = await FlutterNativeTimezone.getLocalTimezone();

    // 获取当前时间
    DateTime now = DateTime.now();

    // 将当前时间转换为设备本地时区的时间
    var localTime = now.toUtc().add(Duration(hours: int.parse(timeZone.substring(4, 6))));

    // var formattedTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(localTime);

    // print("Local Time in Device Timezone ($timeZone): $formattedTime");
  }
}
