import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';

import '../../style/AppTheme.dart';
import 'FormFieldBuilderHelper.dart';

class SwitchFormFiled extends FormField<bool> {
  SwitchFormFiled({
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    initialValue,
    onSaved,
    onChanged,
    isEdit = true,
    validator,
    validators,
    activeColor = AppTheme.colorPrimary,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue ?? false,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<bool> field) {
              return BrnBaseTitle(
                error: field.errorText ?? "",
                title: title,
                isEdit: isEdit,
                subTitle: subTitle,
                tipLabel: tipLabel,
                isRequire: isRequire,
                customActionWidget: CupertinoSwitch(
                  activeColor: activeColor,
                  onChanged: (value) {
                    if (onChanged != null) {
                      onChanged(value);
                    }
                    field.didChange(value);
                  },
                  value: field.value!,
                ),
                onTip: () {},
              );
            });
}
