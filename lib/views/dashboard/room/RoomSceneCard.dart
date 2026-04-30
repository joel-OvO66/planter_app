import 'package:flutter/material.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';

/**
 * RoomSceneCard 主类
 **/
class RoomSceneCard extends StatefulWidget {
  final RoomProfile room;

  const RoomSceneCard({Key? key, required this.room}) : super(key: key);

  @override
  _RoomSceneCardState createState() => _RoomSceneCardState();
}

/**
 * RoomSceneCard UI布局
 **/
class _RoomSceneCardState extends State<RoomSceneCard> with _RoomSceneCardMixin {
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
    return Container();
  }

  Widget buildBox(Widget widget) {
    GridView.count(
      crossAxisSpacing: 3, //widget 左右间的距离
      mainAxisSpacing: 2, //widget 上下间的距离
      crossAxisCount: 3, //每行列数
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        buildBox(Icon(Icons.home)),
        buildBox(Icon(Icons.ac_unit)),
        buildBox(Icon(Icons.search)),
        buildBox(Icon(Icons.settings)),
        buildBox(Icon(Icons.airport_shuttle)),
        buildBox(Icon(Icons.all_inclusive)),
        buildBox(Icon(Icons.beach_access)),
        buildBox(Icon(Icons.cake)),
        buildBox(Icon(Icons.circle)),
      ],
    );
    return SizedBox(height: 200, child: widget);
  }
}

/**
 * RoomSceneCard 数据逻辑
 **/
mixin _RoomSceneCardMixin<T extends StatefulWidget> on State<T> {}
