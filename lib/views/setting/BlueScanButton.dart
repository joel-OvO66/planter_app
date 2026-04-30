import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/l10n.dart';
import '../../style/AppTheme.dart';

class BlueScanButton extends StatelessWidget {
  /// rfid设备是否初始化
  final bool inited;

  final bool scanning;

  const BlueScanButton({Key? key, required this.scanning, required this.inited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 36.sp, bottom: 24.sp),
        width: 130,
        height: 130,
        alignment: Alignment.center,
        decoration: !this.scanning || !inited
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(70)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Theme.of(context).primaryColorLight, AppTheme.primary],
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x334699FA),
                      offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                      blurRadius: 15.0, //阴影模糊程度
                      spreadRadius: 1.0 //阴影扩散程度
                      )
                ],
              )
            : BoxDecoration(),
        child: this.scanning
            ? Stack(children: [
                Image.asset('assets/images/common/scanning.gif'),
                Positioned(child: SvgPicture.asset('assets/images/common/scanning.svg')),
                Positioned(left: 26, top: 54, child: Text(S.of(context).stopScan, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white))),
              ])
            : Text(inited ? S.of(context).startScan : S.of(context).initializing, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white)));
  }
}
