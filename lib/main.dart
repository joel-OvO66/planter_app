import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/common/RoomService.dart';

import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/routers.dart';
import 'package:planter_app/style/AppTheme.dart';
import 'package:planter_app/style/BrunoThemeConfig.dart';
import 'package:planter_app/views/LoginPage.dart';
import 'package:planter_app/views/MainPage.dart';
import 'package:planter_app/views/WelcomePage.dart';
import 'package:provider/provider.dart';

import 'common/AuthService.dart';
import 'common/FarmService.dart';
import 'generated/l10n.dart';
import 'views/WelcomePage2.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  SettingProvider settingProvider = SettingProvider();
  await settingProvider.initSetting();
  AuthService authService = AuthService();
  await authService.init();
  runApp(MyApp(settingProvider: settingProvider, authService: authService));
}

class MyApp extends StatelessWidget {
  final SettingProvider settingProvider;
  final AuthService authService;

  const MyApp({super.key, required this.settingProvider, required this.authService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FarmService()),
          ChangeNotifierProvider(create: (_) => authService),
          ChangeNotifierProvider(create: (_) => settingProvider),
          ChangeNotifierProvider(create: (_) => RoomService()),
        ],
        builder: (context, _) {
          final settingProvider = Provider.of<SettingProvider>(context);
          return ScreenUtilInit(
              designSize: const Size(750, 1334),
              builder: (_, child) {
                return MaterialApp(
                    title: 'plant',
                    // 去掉右上角的 debug
                    debugShowCheckedModeBanner: false,
                    // 全局主题相关参数
                    theme: AppTheme.lightTheme(),
                    darkTheme: AppTheme.darkTheme(),
                    themeMode: settingProvider.themeMode,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      BrnLocalizationDelegate.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: settingProvider.locale,
                    // localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
                    //   // 重置语言选项
                    //   // Provider.of<SettingProvider>(context, listen: false).setLocale(Locale(locale!.languageCode));
                    //   // 这里必须返回null,CIA
                    //   return null;
                    // },
                    //home: authService.isLoggedIn() ? const MainPage() : (authService.firstLogin() ? WelcomePage() : LoginPage()),
                    home: authService.isLoggedIn() ? const MainPage() : WelcomePage2(),
                    builder: EasyLoading.init(),
                    routes: routers);
              });
        });
  }
}
