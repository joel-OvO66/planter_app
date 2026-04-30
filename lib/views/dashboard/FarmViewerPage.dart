import 'package:flutter/material.dart';

import '../../ui/card/BasicCard.dart';

/**
 * FarmViewerPage 主类
 **/
class FarmViewerPage extends StatefulWidget {
  const FarmViewerPage({Key? key}) : super(key: key);

  @override
  _FarmViewerPageState createState() => _FarmViewerPageState();
}

/**
 * FarmViewerPage UI布局
 **/
class _FarmViewerPageState extends State<FarmViewerPage> with _FarmViewerPageMixin {
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
    return Scaffold(
        appBar: AppBar(title: Text("标题")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            BasicCard(
              title: 'Lath Room-1',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => RoomViewerPage()));
              },
            )
          ],
        )));
  }
}

/**
 * FarmViewerPage 数据逻辑
 **/
mixin _FarmViewerPageMixin<T extends StatefulWidget> on State<T> {}
