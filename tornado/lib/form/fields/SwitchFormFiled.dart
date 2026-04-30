import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class SwitchFormFiled extends FormFieldBuilderWidget<bool> {
  SwitchFormFiled({
    Key? key,
    initialValue,
    label,
    onSaved,
    onChanged,
  }) : super(key: key, label: label, initialValue: initialValue, onSaved: onSaved, onChanged: onChanged);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField<bool>(
      initialValue: initialValue,
      builder: (FormFieldState field) {
        return CupertinoFormRow(
            prefix: buildLabel(context),
            child: CupertinoSwitch(
              onChanged: onChanged,
              value: initialValue!,
            ));
      },
      onSaved: onSaved,
    ));
  }
}
