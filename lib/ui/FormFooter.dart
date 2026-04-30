import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';
import '../style/AppTheme.dart';

class FormFooter extends StatefulWidget {
  final VoidCallback onSubmitPressed;

  final VoidCallback? onResetPressed;

  /// 主按钮是否可用 默认可用
  /// 如果设置为false，按钮置灰且不响应[mainButtonOnTap]
  final bool enableMainButton;

  /// 次按钮是否可用 默认可用
  /// 如果设置为false，按钮置灰且不响应[secondaryButtonName]
  final bool enableSecondaryButton;

  const FormFooter({Key? key, required this.onSubmitPressed, this.onResetPressed, this.enableMainButton = true, this.enableSecondaryButton = true}) : super(key: key);

  @override
  State<FormFooter> createState() => _FormFooterState();
}

class _FormFooterState extends State<FormFooter> {
  @override
  Widget build(BuildContext context) {
    return BrnBottomButtonPanel(
        mainButtonName: S.of(context).save,
        secondaryButtonName: S.of(context).reset,
        mainButtonOnTap: widget.onSubmitPressed,
        secondaryButtonOnTap: widget.onResetPressed,
        enableMainButton: widget.enableMainButton,
        enableSecondaryButton: widget.enableSecondaryButton);

    // return Row(
    //   children: <Widget>[
    //     SizedBox(width: 20),
    //     Expanded(
    //       child: MaterialButton(
    //         height: 64.sp,
    //         color: AppTheme.colorPrimary,
    //         elevation: 0,
    //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //         child: const Text("保存", style: TextStyle(color: Colors.white)),
    //         onPressed: widget.onSubmitPressed,
    //       ),
    //     ),
    //     SizedBox(width: 12),
    //     Expanded(
    //       child: MaterialButton(
    //         height: 64.sp,
    //         color: AppTheme.grey26,
    //         elevation: 0,
    //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //         child: const Text("重置", style: TextStyle(color: Colors.white)),
    //         onPressed: widget.onResetPressed,
    //       ),
    //     ),
    //     SizedBox(width: 20),
    //   ],
    // );
  }
}
