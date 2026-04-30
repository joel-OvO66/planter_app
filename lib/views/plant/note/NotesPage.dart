import 'package:flutter/material.dart';

/**
* NotesPage 主类
**/
class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

/**
* NotesPage UI布局
**/
class _NotesPageState extends State<NotesPage> with _NotesPageMixin {
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
* NotesPage 数据逻辑
**/
mixin _NotesPageMixin<T extends StatefulWidget> on State<T> {}
