import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';
import 'package:provider/provider.dart';

import '../../../entity/device/domain/v5/TempState.dart';
import '../../../generated/l10n.dart';
import '../../../provider/SettingProvider.dart';
import '../../../ui/card/BasicCard.dart';
import 'RoomControlPage.dart';

class RoomEnvironmentCard extends StatelessWidget {
  final RoomProfile room;

  final bool enableTap;

  const RoomEnvironmentCard({super.key, required this.room, this.enableTap = true});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    TempState? tempState1 = room.sensorV5Data?.tempState1;
    TempState? tempState2 = room.sensorV5Data?.tempState2;
    return BasicCard(
      onTap: () {
        if (enableTap) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoomControlPage(room: room)));
        }
      },
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(75), //可以根据内部组件大小自适应宽度
          // 1: IntrinsicColumnWidth(),
          // 2: IntrinsicColumnWidth(),
          // 3: IntrinsicColumnWidth(),
          // 3: FixedColumnWidth(80.0),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            const TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Icon(Icons.swap_horiz))),
            TableCell(child: Center(child: Text(S.of(context).temperature, style: Theme.of(context).textTheme.labelSmall))),
            TableCell(child: Center(child: Text(S.of(context).humidity, style: Theme.of(context).textTheme.labelSmall))),
            TableCell(child: Center(child: Text("VPD", style: Theme.of(context).textTheme.labelSmall))),
          ]),
          TableRow(children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text(S.of(context).inside, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
            TableCell(
                child: _buildTableCell(
                    Text("${tempState1 != null && tempState1.enabled ? settingProvider.temperature1(tempState1.tempValue, room.sensorV5Data?.globalParam?.tempUnit ?? 0) : '--'}${settingProvider.temperatureUnit}",
                    style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("${tempState1 != null && tempState1.enabled ? tempState1.humidValue : '--'}%", style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("${tempState1 != null && tempState1.enabled ? tempState1.vpdValue : '--'}kPa", style: Theme.of(context).textTheme.bodyLarge))),
          ]),
          TableRow(children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text(S.of(context).outside, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
            TableCell(
                child: _buildTableCell(Text(
                    "${tempState2 != null && tempState2.enabled ? settingProvider.temperature1(tempState2.tempValue, room.sensorV5Data?.globalParam?.tempUnit ?? 0) : '--'}${settingProvider.temperatureUnit}",
                    style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("${tempState2 != null && tempState2.enabled ? tempState2.humidValue : '--'}%", style: Theme.of(context).textTheme.bodyLarge))),
            TableCell(child: _buildTableCell(Text("${tempState2 != null && tempState2.enabled ? tempState2.vpdValue : '--'}kPa", style: Theme.of(context).textTheme.bodyLarge))),
          ])
        ],
      ),
    );
  }

  Widget _buildTableCell(Widget child) {
    return Container(padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp), child: Center(child: child));
  }
}
