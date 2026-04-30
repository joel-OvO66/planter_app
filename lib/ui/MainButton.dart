import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String text;

  final EdgeInsetsGeometry? margin;

  final Size? size;

  final Color? color;

  final bool enable;

  const MainButton({Key? key, this.onPressed, required this.text, this.margin, this.size, this.color, this.enable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.only(bottom: 42.sp, left: 36.sp, right: 36.sp),
        child: ElevatedButton(
          style: ButtonStyle(
            // side: MaterialStateProperty.all(BorderSide(width: 1,color: Color(0xffCAD0DB))),//边框
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp))),
            elevation: MaterialStateProperty.all(5),
            minimumSize: MaterialStateProperty.all(size ?? const Size.fromHeight(42)),
            shadowColor: MaterialStateProperty.all(const Color.fromRGBO(73, 190, 125, 0.3)),
            backgroundColor: enable ? MaterialStateProperty.all(color?? Theme.of(context).primaryColorLight) : MaterialStateProperty.all(Colors.grey),
          ),
          onPressed: enable ? onPressed : null,
          child: Text(text, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white)),
        ));
  }
}
