import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/form/FormItem.dart';

import 'FormFieldBuilderHelper.dart';


class RadioInputFormField<T> extends FormField<T> {
  RadioInputFormField({
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
    isEdit = true,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<T> field) {
              return BrnRadioInputFormItem(
                isEdit: isEdit,
                prefixIconType: prefixIconType,
                error: field.errorText ?? "",
                title: title,
                subTitle: subTitle,
                tipLabel: tipLabel,
                isRequire: isRequire,
                themeData: BrnFormItemConfig(optionsMiddlePadding:EdgeInsets.only(left: 18.sp)),
                options: formItems?.map((e) => e.label).toList(),
                value: field.value != null ? formItems?.firstWhere((element) => element.value == field.value).label : null,
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
