import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../generated/l10n.dart';
import '../../provider/SettingProvider.dart';

/**
 * SettingPage 主类
 **/
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

/**
 * SettingPage UI布局
 **/
class _SettingPageState extends State<SettingPage> with _SettingPageMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);

    // 获取当前的主题模式
    final Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).setting)),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          SettingsSection(
            //title: Text(S.of(context).common),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: Text(S.of(context).setting_language),
                value: Text(settingProvider.toLocalLabel(settingProvider.locale, context)),
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: S.delegate.supportedLocales
                            .map((locale) => ListTile(
                                  title: Text(settingProvider.toLocalLabel(locale, context), style: Theme.of(context).textTheme.labelMedium),
                                  trailing: Radio<Locale>(
                                    value: locale,
                                    groupValue: settingProvider.locale,
                                    onChanged: (Locale? value) {
                                      if (value != null) {
                                        settingProvider.setLocale(value);
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  );
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.ac_unit_outlined),
                title: Text(S.of(context).setting_temperatureUnit),
                value: Text(settingProvider.temperatureUnit),
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("°C", style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<String>(
                              value: "°C",
                              groupValue: settingProvider.temperatureUnit,
                              onChanged: (String? value) {
                                if (value != null) {
                                  settingProvider.setTemperatureUnit(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("°F", style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<String>(
                              value: "°F",
                              groupValue: settingProvider.temperatureUnit,
                              onChanged: (String? value) {
                                if (value != null) {
                                  settingProvider.setTemperatureUnit(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 25.sp, bottom: 25.sp),
                            child: Text(S.of(context).tip_temp_uint),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.label_important_outline_sharp),
                title: Text(S.of(context).setting_lengthUnit),
                value: Text(settingProvider.lengthUnit == "centimeter" ? S.of(context).centimeter : S.of(context).inch),
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(S.of(context).centimeter, style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<String>(
                              value: "centimeter",
                              groupValue: settingProvider.lengthUnit,
                              onChanged: (String? value) {
                                if (value != null) {
                                  settingProvider.setLengthUnit(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(S.of(context).inch, style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<String>(
                              value: "inch",
                              groupValue: settingProvider.lengthUnit,
                              onChanged: (String? value) {
                                if (value != null) {
                                  settingProvider.setLengthUnit(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.calendar_view_week_outlined),
                title: Text(S.of(context).setting_week_first_day),
                value: Text(settingProvider.firstDay == "sunday" ? S.of(context).sunday : S.of(context).monday),
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(S.of(context).sunday, style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<String>(
                              value: "sunday",
                              groupValue: settingProvider.firstDay,
                              onChanged: (String? value) {
                                if (value != null) {
                                  settingProvider.setFirstDay(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(S.of(context).monday, style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<String>(
                              value: "monday",
                              groupValue: settingProvider.firstDay,
                              onChanged: (String? value) {
                                if (value != null) {
                                  settingProvider.setFirstDay(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),

              SettingsTile.navigation(
                leading: const Icon(Icons.sync),
                title: Text(S.of(context).auto_sync_dev_time),
                value: Text(settingProvider.autoSyncDevTime == true ? S.of(context).on : S.of(context).off),
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(S.of(context).on, style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<bool>(
                              value: true,
                              groupValue: settingProvider.autoSyncDevTime,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  settingProvider.setAutoSyncDevTime(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(S.of(context).off, style: Theme.of(context).textTheme.labelMedium),
                            trailing: Radio<bool>(
                              value: false,
                              groupValue: settingProvider.autoSyncDevTime,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  settingProvider.setAutoSyncDevTime(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsGeometry.only(top: 25.sp, bottom: 25.sp),
                            child: Text(S.of(context).tip_sync_time),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              // SettingsTile.navigation(leading: const Icon(Icons.language), title: Text('First day of the week'), value: Text('')),
              // SettingsTile.navigation(leading: const Icon(Icons.timer_outlined), title: Text(S.of(context).setting_timeZone), value: Text(settingProvider.timeZone!)),

              // SettingsTile.navigation(
              //     leading: settingProvider.themeMode == ThemeMode.dark
              //         ? Icon(Icons.wb_sunny, color: settingProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black)
              //         : Icon(Icons.wb_sunny_outlined, color: settingProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
              //     title: Text(S.of(context).setting_theme),
              //     value: Text(settingProvider.themeMode == ThemeMode.dark ? S.of(context).setting_theme_dark : S.of(context).setting_theme_light),
              //     onPressed: (context) {
              //       showModalBottomSheet(
              //         context: context,
              //         isScrollControlled: true, // 允许高度控制
              //         builder: (BuildContext context) {
              //           return SizedBox(
              //             height: 200,
              //             child: Column(
              //               children: [
              //                 ListTile(
              //                   leading: Icon(Icons.wb_sunny_outlined, color: settingProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
              //                   title: Text(S.of(context).setting_theme_light, style: TextStyle(color: settingProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black)),
              //                   onTap: () {
              //                     settingProvider.setThemeMode(ThemeMode.light);
              //                     Navigator.of(context).pop();
              //                   },
              //                 ),
              //                 ListTile(
              //                   leading: Icon(Icons.wb_sunny, color: settingProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
              //                   title: Text(S.of(context).setting_theme_dark, style: TextStyle(color: settingProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black)),
              //                   onTap: () {
              //                     settingProvider.setThemeMode(ThemeMode.dark);
              //                     Navigator.of(context).pop();
              //                   },
              //                 )
              //               ],
              //             ),
              //           );
              //         },
              //       );
              //     }),

              // SettingsTile.switchTile(onToggle: (value) {}, initialValue: true, leading: Icon(Icons.format_paint), title: Text('Enable custom theme')),
            ],
          ),
          // SettingsSection(
          //   title: Text(S.of(context).system),
          //   tiles: <SettingsTile>[
          //     SettingsTile.navigation(leading: Icon(Icons.language), title: Text(S.of(context).clear_cache), value: Text('')),
          //   ],
          // ),
        ],
      ),
    );
  }
}

/**
 * SettingPage 数据逻辑
 **/
mixin _SettingPageMixin<T extends StatefulWidget> on State<T> {}
