import 'package:flutter/material.dart';
/**
* ModeSettingForm 主类
**/
class ModeSettingForm extends StatefulWidget {
  const ModeSettingForm({Key? key}) : super(key: key);

  @override
  _ModeSettingFormState createState() => _ModeSettingFormState();
}


/**
* ModeSettingForm UI布局
**/
class _ModeSettingFormState extends State<ModeSettingForm> with _ModeSettingFormMixin {

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
    return Scaffold(appBar: AppBar(title: Text("标题")), body: Text("内容"));
  }
}

/**
* ModeSettingForm 数据逻辑
**/
mixin _ModeSettingFormMixin<T extends StatefulWidget> on State<T> {

}
