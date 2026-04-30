import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class OutlineChip extends StatelessWidget {

  String? text;
  Color? color;
  double? width;
  Color? borderColor;

  OutlineChip(this.text, {Key? key, this.color, this.width, this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: RawChip(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: color != null ? BorderSide(color: color!, width: 0.5) : BorderSide(color: borderColor != null ? borderColor! : Color(0xff6B7380), width: 0.5),
        ),
        padding: EdgeInsets.only(bottom: 10),
        label: color != null ?
        Container(
          width: width != null ? width! : null,
          child: Text(text!, overflow: TextOverflow.ellipsis, maxLines: 1, textAlign: TextAlign.center,
              style: TextStyle(color: color!, fontSize: 12)),
        ) :
        Container(
          width: width != null ? width! : null,
          child: Text(text!, textAlign: TextAlign.center, style: TextStyle(color: borderColor != null ? borderColor! : Color(0xff6B7380), fontSize: 12)),
        )
      ),
    );
  }
}
