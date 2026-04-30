import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui/card/BasicCard.dart';

/**
* AnalysisPage 主类
**/
class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

/**
* AnalysisPage UI布局
**/
class _AnalysisPageState extends State<AnalysisPage> with _AnalysisPageMixin {
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
        appBar: AppBar(
          title: Text("Data"),
          actions: [
            // IconButton(icon: Icon(Icons.add), onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            BrnCommonCardTitle(
              title: 'Environment',
              onTap: () {
                // BrnToast.show('BrnCommonCardTitle is clicked', context);
              },
            ),
            buildEnvironmentCard(),
            // buildStat()
          ],
        )));
  }

  Widget buildEnvironmentCard() {
    return BasicCard(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            const TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Icon(Icons.swap_horiz))),
            TableCell(child: Center(child: Text("TEMP", style: Theme.of(context).textTheme.titleMedium))),
            TableCell(child: Center(child: Text("HUMID", style: Theme.of(context).textTheme.titleMedium))),
            TableCell(child: Center(child: Text("VPD", style: Theme.of(context).textTheme.titleMedium))),
          ]),
          TableRow(children: [
            const TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Text('Inside', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
            TableCell(child: _buildTableCell(Text("80F", style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("78%", style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("0.71kPa", style: Theme.of(context).textTheme.bodyLarge))),
          ]),
          TableRow(children: [
            const TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Text('Outside', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
            TableCell(child: _buildTableCell(Text("80F", style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("78%", style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("0.71kPa", style: Theme.of(context).textTheme.bodyLarge))),
          ])
        ],
      ),
    );
  }

  Widget buildStat() {
    return BasicCard(
        title: "08:22,Sep 12,2024",
        child: BrnRichInfoGrid(
          rowSpace: 16.sp,
          pairInfoList: <BrnRichGridInfo>[
            BrnRichGridInfo("Inside temp：", '75℃'),
            BrnRichGridInfo("Outside temp：", '75℃'),
            BrnRichGridInfo("Inside temp：", '75℃'),
            BrnRichGridInfo("Outside temp：", '75℃'),
            BrnRichGridInfo("Inside temp：", '75℃'),
            BrnRichGridInfo("Outside temp：", '75℃'),
            BrnRichGridInfo("Inside temp：", '75℃'),
            BrnRichGridInfo("Outside temp：", '75℃'),
            BrnRichGridInfo("Inside temp：", '75℃'),
            BrnRichGridInfo("Outside temp：", '75℃'),
          ],
        ));
  }

  Widget _buildTableCell(Widget child) {
    return Container(padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp), child: Center(child: child));
  }
}

/**
* AnalysisPage 数据逻辑
**/
mixin _AnalysisPageMixin<T extends StatefulWidget> on State<T> {}
