import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 72.sp),
      //child: Image.asset('assets/images/no_data.png', width: 300.sp),
      alignment: Alignment.center,
    );
  }
}
