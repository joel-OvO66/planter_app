import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:tornado/form/FormItem.dart';
import 'FormFieldBuilderHelper.dart';

/**
 * QuickSelectFormField 主类
 **/
class QuickSelectFormField<T> extends FormField<T> {

  QuickSelectFormField({
    Key? key,
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    placeholder,
    tipLabel,
    isRequire = false,
    isBtnsScroll = true,
    List<FormItem<T>>? formItems,
    initialValue,
    onSaved,
    onAddTap,
    onTip,
    onRemoveTap,
    onChanged,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
      validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      builder: (FormFieldState field) {
        List<bool> statusAllFunctionDemo = [];
        List<String> options = [];
        String value = '';
        if (initialValue != null) {
          value = initialValue;
        }
        if(formItems != null && formItems.isNotEmpty) {
          options = formItems.map((e) => e.label).toList();
          statusAllFunctionDemo = formItems.map((e) => initialValue != null && initialValue != '' ? initialValue.contains(e.label) : false).cast<bool>().toList();
        } else {
          statusAllFunctionDemo = [];
        }
        print(statusAllFunctionDemo);
        return BrnTextQuickSelectFormItem(
          hint: placeholder ?? "请输入",
          prefixIconType: prefixIconType,
          title: title,
          subTitle: subTitle,
          isRequire: isRequire,
          tipLabel: tipLabel,
          btnsTxt: options,
          selectBtnList: statusAllFunctionDemo,
          value: value,
          onTip: onTip,
          isBtnsScroll: isBtnsScroll,
          onAddTap: onAddTap,
          onRemoveTap: onRemoveTap,
          onBtnSelectChanged: (index) {
            statusAllFunctionDemo[index] = !statusAllFunctionDemo[index];
            if (statusAllFunctionDemo[index]) {
              value += '${options[index]},';
            } else if (value.contains(options[index])) {
              value = value.replaceFirst('${options[index]},', '');
            }
            field.didChange(value);
            if (onChanged != null) {
              onChanged(value);
            }
          },
        );
      });
}
