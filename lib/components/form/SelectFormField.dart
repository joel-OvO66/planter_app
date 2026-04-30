import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:tornado/form/FormItem.dart';

import '../Brn1RowDelegate.dart';
import 'FormFieldBuilderHelper.dart';

class SelectFormField<T> extends FormField<dynamic> {
  SelectFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    List<FormItem<T>>? formItems,
    initialValue,
    onSaved,
    onChanged,
    placeholder,
    validator,
    validators,
    maxSelectItemCount = 0,
    crossAxisCount = 4,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator ?? (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<dynamic> field) {
              String? value;
              if (formItems != null) {
                int index = formItems.indexWhere((element) => element.value == initialValue);
                if (index > -1) {
                  value = formItems[index].label;
                }
              }
              return BrnTextSelectFormItem(
                prefixIconType: prefixIconType,
                isRequire: isRequire,
                hint: placeholder ?? "",
                error: field.errorText ?? "",
                title: title,
                value: value,
                subTitle: subTitle,
                tipLabel: tipLabel,
                onTip: () {},
                onAddTap: () {},
                onRemoveTap: () {},
                onTap: () {
                  List<dynamic> items = [];
                  for (int i = 0; i < formItems!.length; i++) {
                    FormItem it = formItems[i];
                    items.add({it.label: it.value});
                  }
                  BrnMultiDataPicker(
                    context: field.context,
                    title: title,
                    delegate: Brn1RowDelegate(list: items, firstSelectedIndex: 1),
                    confirmClick: onChanged,
                  ).show();
                },
              );
            });
}
