import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/farm/entity/Farm.dart';

import '../../generated/l10n.dart';
import '../../ui/description/DescriptItemRemark.dart';
import '../../ui/description/DescriptionItem.dart';

/**
* FarmSettingPage 主类
**/
class FarmSettingPage extends StatefulWidget {
  final Farm farm;

  const FarmSettingPage({Key? key, required this.farm}) : super(key: key);

  @override
  _FarmSettingPageState createState() => _FarmSettingPageState();
}

/**
* FarmSettingPage UI布局
**/
class _FarmSettingPageState extends State<FarmSettingPage> with _FarmSettingPageMixin {
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
        appBar: AppBar(title: Text(widget.farm.tenantName!)),
        body: Container(
            padding: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 12.sp),
            child: Column(
              children: [
                DescriptionItem(S.of(context).farm_farmName, widget.farm.tenantName ?? ""),
                DescriptionItemRemark(S.of(context).farm_remark, widget.farm.remark ?? ""),
                // DescriptionItem(S.of(context).user_mobile, user?.mobile ?? ""),
              ],
            )
        ),
    );
  }
}

/**
* FarmSettingPage 数据逻辑
**/
mixin _FarmSettingPageMixin<T extends StatefulWidget> on State<T> {}
