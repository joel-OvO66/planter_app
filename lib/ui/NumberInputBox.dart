import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberInputBox extends StatefulWidget {
  final int value;

  final int min;

  final int max;

  final ValueChanged<int> onChanged;

  const NumberInputBox({Key? key, required this.value, required this.onChanged, this.min = 0, this.max = 999}) : super(key: key);

  @override
  State<NumberInputBox> createState() => _NumberInputBoxState();
}

class _NumberInputBoxState extends State<NumberInputBox> {
  late TextEditingController _textFieldController;

  late int _previousValue;
  @override
  void initState() {
    super.initState();
    _previousValue = widget.value;
    _textFieldController = TextEditingController(text: widget.value.toString());

    _textFieldController.addListener(() {
      int? result = int.tryParse(_textFieldController.text);
      if (result != null && result > widget.max) {
        _textFieldController.text = widget.max.toString();
      }
      // if (result < widget.min) {
      //   _textFieldController.text = widget.min.toString();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 42.sp, maxHeight: 54.sp),
        child: IntrinsicWidth(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sp), // 设置左右外边距
              child: TextField(
                maxLines: 1,
                controller: _textFieldController,
                keyboardType: TextInputType.number,
                enableInteractiveSelection: false,
                // 设置文字垂直居中
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  int? result = int.tryParse(value);
                  if (result != null && result >= widget.min && result <= widget.max) {
                    // 输入合法时保存当前值
                    _previousValue = result;
                    widget.onChanged(result);
                  } else {}
                },
                onTapOutside: (value) {
                  int? result = int.tryParse(_textFieldController.text);
                  if (result != null && result < widget.min && result > widget.max) {
                    _textFieldController.text = _previousValue.toString();
                    _textFieldController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _previousValue.toString().length),
                    );
                  }
                },
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.symmetric(vertical: 52.sp, horizontal: 24.sp),
                  // 设置内容的内边距，左右 20，控制文本和输入框的距离
                  fillColor: const Color.fromRGBO(16, 16, 16, 0.06),
                  // 确保背景色填充
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 2.0.sp),
                  ),
                  // 获得焦点时的边框颜色
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0.sp),
                  ),
                  // 错误时的边框颜色
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0.sp),
                  ),
                ),
              )),
        ));
  }
}
