import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import '../../../../api/SceneController.dart';
import '../../../../entity/strategy/domain/SceneSetting.dart';
import '../../../../entity/strategy/entity/Scene.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../ui/DialogAlert.dart';
import 'FanSettingTabView.dart';
import 'LightingSettingTabView.dart';
import 'VentilatorSettingTabView.dart';

/**
 * SceneSettingPage 主类
 **/
class SceneSettingPage extends StatefulWidget {
  final int? tabIndex;

  final Scene scene;

  final SettingType settingType;

  const SceneSettingPage({Key? key, this.tabIndex = 0, required this.scene, required this.settingType}) : super(key: key);

  @override
  _SceneSettingPageState createState() => _SceneSettingPageState();
}

/**
 * SceneSettingPage UI布局
 **/
class _SceneSettingPageState extends State<SceneSettingPage> with _SceneSettingPageMixin, SingleTickerProviderStateMixin {
  late TabController tabController;
  late SceneSetting setting;

  @override
  void initState() {
    super.initState();
    setting = widget.settingType.sceneSetting(widget.scene) ?? SceneSetting();
    tabController = TabController(initialIndex: widget.tabIndex!, length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        print(tabController.index);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).sceneSetting_settingType_enum(widget.settingType)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Material(
              color: Colors.grey[200],
              child: TabBar(
            controller: tabController,
            tabs: [
              Tab(icon: Assets.images.dashboard.lighting3x.image(width: 36)),
              Tab(icon: Assets.images.dashboard.ductFan3x.image(width: 36)),
              Tab(icon: Assets.images.dashboard.circulationFan3x.image(width: 36)),
            ],
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.label,
          )),
        ),
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            LightingSettingTabView(setting: setting, settingType: widget.settingType),
            VentilatorSettingTabView(setting: setting, settingType: widget.settingType),
            FanSettingTabView(setting: setting, settingType: widget.settingType)
          ]
      ),
      bottomNavigationBar: buildBottom(),
    );
  }

  Widget buildBottom() {
    if (tabController.index == 0) {
      return BrnBottomButtonPanel(
          mainButtonName: S.of(context).next,
          mainButtonOnTap: () {
            setState(() {
              tabController.index = tabController.index + 1;
            });
          });
    } else if (tabController.index == 1) {
      return BrnBottomButtonPanel(
          mainButtonName: S.of(context).next,
          secondaryButtonName: S.of(context).previous,
          mainButtonOnTap: () {
            setState(() {
              tabController.index = tabController.index + 1;
            });
          },
          secondaryButtonOnTap: () {
            setState(() {
              tabController.index = tabController.index - 1;
            });
          });
    } else {
      return BrnBottomButtonPanel(
          mainButtonName: S.of(context).ok,
          mainButtonOnTap: () {
            DialogAlert.confirm(context, title: S.of(context).confirm_unsaved, okText: S.of(context).save, onOk: () {
              Scene scene = Scene()..sceneId = widget.scene.sceneId;
              scene.setSceneSetting(widget.settingType, setting);
              SceneController.updateSceneParam(scene).then((value) {
                switch (widget.settingType) {
                  case SettingType.SEEDING:
                    widget.scene.seedingParam = value.seedingParam;
                    break;
                  case SettingType.VEGETATIVE:
                    widget.scene.vegetativeParam = value.vegetativeParam;
                    break;
                  case SettingType.FLOWERING:
                    widget.scene.floweringParam = value.floweringParam;
                    break;
                }
                Navigator.of(context).pop(value);
              });
            });
          });
    }
  }
}

/**
 * SceneSettingPage 数据逻辑
 **/
mixin _SceneSettingPageMixin<T extends StatefulWidget> on State<T> {}
