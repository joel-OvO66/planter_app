import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme.dart';
import '../Validator.dart';

abstract class FormFieldBuilderWidget<T> extends StatelessWidget {
  /**
   * 标题
   */
  final String? label;

  ///是否必填
  final bool required;

  //初始值
  final T? initialValue;
  final FormFieldSetter<T>? onSaved;
  final ValueChanged<T>? onChanged;

  final FormFieldValidator<T>? validator;

  final List<ValidatorFn?>? validators;

  /// 输入提示
  final String? placeholder;

  FormFieldBuilderWidget({Key? key, required this.label, this.required = false, this.initialValue, this.placeholder, this.onSaved, this.onChanged, this.validator, this.validators}) : super(key: key);

  Widget buildLabel(BuildContext context) {
    bool validRequired = false;
    if (validators != null) {
      validRequired = validators!.any((element) => element!.type == 'required');
    }
    if (required || validRequired) {
      return Row(
        children: [Text('* ', style: TextStyle(color: Colors.red)), Text((label ?? ""), style: Theme.of(context).textTheme.labelMedium)],
      );
    } else {
      return Padding(padding: EdgeInsets.only(left: 12.sp), child: Text((label ?? ""), style: Theme.of(context).textTheme.labelMedium));
      // return Row(
      //   children: [Text('  ' ), Text(label, style: Theme.of(context).textTheme.labelMedium)],
      // );
      // return Text(label, style: Theme.of(context).textTheme.labelMedium);
    }
  }

  String? validate<C>(C? v) {
    if (validators != null && validators!.isNotEmpty) {
      bool required = validators!.any((element) => element!.type == 'required');
      if ((v == null || v is String && v.isEmpty) && !required) {
        return null;
      }
      for (var element in validators!) {
        if (element != null) {
          String? error = element.call(v);
          if (error != null) {
            return error;
          }
        }
      }
    } else {
      return null;
    }
    return null;
  }

  Widget showErrorText(BuildContext context, FormFieldState field) {
    return field.errorText == null ? Container() : Text(field.errorText!, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.red));
  }

  String getPlaceholder() {
    return placeholder != null ? placeholder! : "请选择" + (label ?? "");
  }

  TextStyle getPlaceholderStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.8));
  }

  Text getPlaceholderText(BuildContext context) {
    return Text(getPlaceholder(), style: getPlaceholderStyle(context));
  }
}
