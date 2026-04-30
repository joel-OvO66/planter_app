import 'package:flutter/material.dart';
import 'package:planter_app/entity/farm/entity/Room.dart';

/**
 * RoomModeSettingPage 主类
 **/
class RoomModeSettingPage extends StatefulWidget {
  final Room room;

  const RoomModeSettingPage({Key? key, required this.room}) : super(key: key);

  @override
  _RoomModeSettingPageState createState() => _RoomModeSettingPageState();
}

/**
 * RoomModeSettingPage UI布局
 **/
class _RoomModeSettingPageState extends State<RoomModeSettingPage> with _RoomModeSettingPageMixin {
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
    return Scaffold(appBar: AppBar(title: Text(widget.room.roomName!)), body: Text("内容"));
  }
}

/**
 * RoomModeSettingPage 数据逻辑
 **/
mixin _RoomModeSettingPageMixin<T extends StatefulWidget> on State<T> {}
