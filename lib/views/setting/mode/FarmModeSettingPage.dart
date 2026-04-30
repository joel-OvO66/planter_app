import 'package:flutter/material.dart';
import 'package:planter_app/entity/farm/entity/Farm.dart';

/**
 * FarmModeSettingPage 主类
 **/
class FarmModeSettingPage extends StatefulWidget {
  final Farm farm;

  const FarmModeSettingPage({Key? key, required this.farm}) : super(key: key);

  @override
  _FarmModeSettingPageState createState() => _FarmModeSettingPageState();
}

/**
 * FarmModeSettingPage UI布局
 **/
class _FarmModeSettingPageState extends State<FarmModeSettingPage> with _FarmModeSettingPageMixin {
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
    return Scaffold(appBar: AppBar(title: Text(widget.farm.tenantName!)), body: Text("内容"));
  }
}

/**
 * FarmModeSettingPage 数据逻辑
 **/
mixin _FarmModeSettingPageMixin<T extends StatefulWidget> on State<T> {}
