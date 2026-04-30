# planter_app

A new Flutter project.

## Getting Started

https://modao.cc/proto/n5yvrEf3scqrcm39KP13d/sharing?view_mode=read_only #远程报警App-分享

##生成assets
dart run build_runner build

# 生成 ssh key

ssh-keygen -t rsa -C "这里换上你的邮箱"
ssh-keygen -t rsa -C "gonglei@microlinktech.net"
https://blog.csdn.net/lqlqlq007/article/details/78983879

## 生成json实体

flutter packages pub run build_runner build

## 生成json实体 删除冲突

dart run build_runner build --delete-conflicting-outputs

##生成 app 图标
dart run flutter_launcher_icons:main

##生成arb文件
flutter pub pub run intl_translation:extract_to_arb --output-dir=l10n-arb \ lib/l10n/localization_intl.dart

##生成assets
dart run build_runner build

##国际化插件
Flutter Intl

## 打包APP

flutter --no-color pub global run intl_utils:generate
flutter pub global activate 'intl_utils'
flutter pub get

## 安卓

flutter build apk --release

## IOS

flutter build ios --release

/Volumes/disk/develop/flutter_3.29.0/bin/flutter

## 添加环境

--dart-define=ENV=dev

## 本地启动，可创建多个启动类，不同配置

在Additional run args添加
--no-sound-null-safety --dart-define=ENV=prod或者dev或者local

## dart 文件缩进改4个字符

在工程.idea/codeStyles/Project.xml 文件中加入以下配置

```xml

<codeStyleSettings language="Dart">
    <option name="RIGHT_MARGIN" value="180" />
    <option name="FORCE_REARRANGE_MODE" value="1" />
    <indentOptions>
        <option name="INDENT_SIZE" value="4" />
        <option name="TAB_SIZE" value="4" />
    </indentOptions>
</codeStyleSettings>
```

## Flutter 布局用法总结

https://www.jianshu.com/p/23dd32baa3fc

## flutter charts 库说明

https://google.github.io/charts/flutter/gallery.html

## 插件源代码修改

### file_picker-10.2.0

android/build.gradle文件下
implementation 'androidx.core:core-ktx:1.15.0'改为
implementation 'androidx.core:core-ktx:1.12.0'
implementation 'androidx.core:core:1.15.0'改为
implementation 'androidx.core:core:1.12.0'

### blufi_plugin-1.0.4

android/build.gradle文件下加上命名空间
android {
namespace = "vn.vconnex.blufi_plugin"
....
}
BlufiClientImpl文件下
private static final boolean DEBUG = true;

## 蓝湖地址

https://lanhuapp.com/url/A4Mqe
分享人: bingb511
蓝湖团队: 微联创智
相关项目: 智慧工地/智慧工程/档案/南方电网/国银/知行合一
密码: JeAo

https://mastergo.com/goto/DAYeqK7G?page_id=M&file=139011607418095
邀请您进入《植物控制App》，点击链接开始协作
--dart-define=ENV=dev

https://mastergo.com/goto/LinJoPVd?page_id=28:0439&file=139011607418095 邀请您进入《植物控制App》，点击链接开始协作


### 创建启动屏
dart run flutter_native_splash:create

 