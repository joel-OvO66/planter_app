import 'package:flutter/material.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';
import 'package:planter_app/ui/card/BasicCard.dart';

import '../../../../generated/l10n.dart';
import '../RoomEnvironmentCard.dart';

/**
 * WaterControlTabView 主类
 **/
class WaterControlTabView extends StatefulWidget {
  final RoomProfile room;

  const WaterControlTabView({Key? key, required this.room}) : super(key: key);

  @override
  _WaterControlTabViewState createState() => _WaterControlTabViewState();
}

/**
 * WaterControlTabView UI布局
 **/
class _WaterControlTabViewState extends State<WaterControlTabView> with _WaterControlTabViewMixin {
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
    return Column(
      children: [RoomEnvironmentCard(room: widget.room, enableTap: false), _buildTempAlertConfig(), _buildHumidityAlertConfig()],
    );
  }

  Widget _buildTempAlertConfig() {
    return BasicCard(
      title: S.of(context).inside_temperature_alert,
      extra: Switch(
        value: true,
        onChanged: (bool value) {},
      ),
      child: Column(
        children: [],
      ),
    );
  }

  Widget _buildHumidityAlertConfig() {
    return BasicCard(
      title: S.of(context).inside_humidity_alert,
      extra: Switch(
        value: true,
        onChanged: (bool value) {},
      ),
      child: Column(
        children: [],
      ),
    );
  }
}

/**
 * WaterControlTabView 数据逻辑
 **/
mixin _WaterControlTabViewMixin<T extends StatefulWidget> on State<T> {}
