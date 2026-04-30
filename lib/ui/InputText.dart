import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputText extends StatelessWidget {
  final String text;

  const InputText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 6.sp, bottom: 6.sp),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(16, 16, 16, 0.06), // 浅绿色背景
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1), width: 2.sp),
        borderRadius: BorderRadius.circular(8.sp), // 圆角
      ),
      child: Center(child: Text(text)),
    );
  }
}
