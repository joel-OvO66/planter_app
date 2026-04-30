import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/strategy/entity/Scene.dart';
import 'package:planter_app/generated/l10n.dart';

import '../../../entity/strategy/domain/SceneSetting.dart';
import '../../../gen/assets.gen.dart';
import 'param/SceneSettingParam.dart';

/**
 * SceneDetailPage 主类
 **/
class SceneDetailPage extends StatefulWidget {
  final Scene scene;

  const SceneDetailPage({Key? key, required this.scene}) : super(key: key);

  @override
  _SceneDetailPageState createState() => _SceneDetailPageState();
}

/**
 * SceneDetailPage UI布局
 **/
class _SceneDetailPageState extends State<SceneDetailPage> {
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
    return DefaultTabController(
        length: 3,
        animationDuration: Duration.zero,
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.scene.sceneName!),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Material(
                    color: Colors.grey[200],
                    child: TabBar(
                  padding: EdgeInsets.zero,
                  // labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      icon: Assets.images.dashboard.seedling3x.image(width: 56.sp),
                      text: S.of(context).sceneSetting_settingType_enum(SettingType.SEEDING),
                      iconMargin: const EdgeInsets.only(bottom: 0),
                    ),
                    Tab(
                      icon: Assets.images.dashboard.vegetative3x.image(width: 56.sp),
                      text: S.of(context).sceneSetting_settingType_enum(SettingType.VEGETATIVE),
                      iconMargin: const EdgeInsets.only(bottom: 0),
                    ),
                    Tab(
                      icon: Assets.images.dashboard.flowering3x.image(width: 56.sp),
                      text: S.of(context).sceneSetting_settingType_enum(SettingType.FLOWERING),
                      iconMargin: const EdgeInsets.only(bottom: 0),
                    ),
                  ],
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.label,
                )),
              ),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                SceneSettingParam(scene: widget.scene, settingType: SettingType.SEEDING),
                SceneSettingParam(scene: widget.scene, settingType: SettingType.VEGETATIVE),
                SceneSettingParam(scene: widget.scene, settingType: SettingType.FLOWERING)
              ]
            )
        ));
  }
}
