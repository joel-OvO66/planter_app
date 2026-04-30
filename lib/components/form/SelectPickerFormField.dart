import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tornado/form/FormItem.dart';

import 'FormFieldBuilderHelper.dart';

class SelectPickerFormField<T> extends FormField<T> {
  SelectPickerFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    List<FormItem<T>>? formItems,
    initialValue,
    onSaved,
    onChanged,
    onAddTap,
    onTip,
    isEdit = true,
    onRemoveTap,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
    String? confirmText,
    String? cancelText,
    String? notContentText,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<T> field) {
              String? value = null;
              if (formItems != null) {
                int index = formItems.indexWhere((element) => element.value == field.value);
                if (index >= 0) {
                  value = formItems[index].label;
                }
              }
              FormItem<T>? getFormItem(T? value) {
                return formItems == null || value == null
                    ? null
                    : formItems.firstWhere((element) => element.value == value || element.value.hashCode == value.hashCode, orElse: () => FormItem('', initialValue));
              }

              return BrnTextSelectFormItem(
                prefixIconType: prefixIconType,
                isRequire: isRequire,
                error: field.errorText ?? "",
                title: title,
                value: value,
                isEdit: isEdit,
                subTitle: subTitle,
                tipLabel: tipLabel,
                onTip: onTip,
                onAddTap: onAddTap,
                onRemoveTap: onRemoveTap,
                onTap: () {
                  if (formItems == null || formItems.length == 0) {
                    Fluttertoast.showToast(msg: notContentText?? '没有选择项');
                    return;
                  }
                  FocusScopeNode currentFocus = FocusScope.of(field.context);
                  if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                  Pickers.showSinglePicker(field.context,
                      pickerStyle: PickerStyle(
                        commitButton:  Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Text(confirmText ?? '确定'),
                        ),
                        cancelButton: Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: Text(cancelText ?? '取消'),
                        ),
                      ),
                      data: formItems,
                      selectData: getFormItem(field.value), onConfirm: (var data, int position) {
                    field.didChange((data as FormItem).value);
                    if (onChanged != null) onChanged!((data).value);
                  });
                },
              );
            }
            );
}
