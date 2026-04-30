import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:tornado/form/FormItem.dart';
import 'package:tornado/theme.dart';

import 'FormFieldBuilderHelper.dart';

/**
 * RadioPortraitInputFormField 主类
 **/
class RadioPortraitInputFormField<T> extends FormField<T> {
  RadioPortraitInputFormField({
    Key? key,
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    List<FormItem<T>>? formItems,
    initialValue,
    onSaved,
    onChanged,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<T> field) {
              return BrnRadioPortraitInputFormItem(
                prefixIconType: prefixIconType,
                title: title,
                subTitle: subTitle,
                isRequire: isRequire,
                tipLabel: tipLabel,
                options: formItems?.map((e) => e.label).toList(),
                value: formItems?.firstWhere((element) => element.value == field.value).label,
                onTip: () {},
                onAddTap: () {},
                onRemoveTap: () {},
                onChanged: (oldValue, newValue) {
                  T fieldValue = formItems!.firstWhere((element) => element.label == newValue).value;
                  field.didChange(fieldValue);
                  if (onChanged != null) {
                    onChanged(fieldValue);
                  }
                },
              );
            });
}
