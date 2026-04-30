import 'package:flutter/material.dart';
import 'package:planter_app/entity/farm/entity/Plant.dart';

/**
 * PlantViewerPage 主类
 **/
class PlantViewerPage extends StatefulWidget {
  final Plant plant;

  const PlantViewerPage({Key? key, required this.plant}) : super(key: key);

  @override
  _PlantViewerPageState createState() => _PlantViewerPageState();
}

/**
 * PlantViewerPage UI布局
 **/
class _PlantViewerPageState extends State<PlantViewerPage> with _PlantViewerPageMixin {
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
    return Scaffold(appBar: AppBar(title: Text(widget.plant.plantName!)), body: SingleChildScrollView(child: Column(children:
        // widget.plant.rooms
        //         ?.map((room) => BasicCard(
        //             title: room.roomName!,
        //             onTap: () {
        //               Navigator.push(context, MaterialPageRoute(builder: (context) => RoomViewerPage(room: room)));
        //             },
        //             child: Container(
        //               margin: EdgeInsets.only(top: 10.0), // 根据需要调整边距大小
        //               child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(10.0), // 圆角半径
        //                 child: Assets.images.demo.image(),
        //               ),
        //             )))
        //         .toList() ??
        [])));
  }
}

/**
 * PlantViewerPage 数据逻辑
 **/
mixin _PlantViewerPageMixin<T extends StatefulWidget> on State<T> {}
