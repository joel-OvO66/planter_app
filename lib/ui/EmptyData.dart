import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../generated/l10n.dart';

class EmptyData extends StatelessWidget {
  final String? title;

  final String? content;

  final VoidCallback? onTap;

  final String? operateText;

  final double top;

  const EmptyData({Key? key, this.title, this.top = 30, this.operateText, this.content, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: top, bottom: 30),
        child: BrnAbnormalStateWidget(
          topPercent: 0.1,
          topOffset: 30,
          //img: Assets.images.noData.image(scale: 3.5),
          isCenterVertical: true,
          title: title ?? S.of(context).emptyData,
          bgColor: Colors.transparent,
          content: content,
          operateTexts: onTap != null ? <String>[operateText ?? S.of(context).create] : null,
          operateAreaType: OperateAreaType.singleButton,
          action: (index) {
            if (onTap != null) {
              onTap!();
            }
          },
        ));
    // return Image.asset('assets/images/no_data.png');
  }
}
