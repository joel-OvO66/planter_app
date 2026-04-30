import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class TextAreaInputFormFiled extends FormFieldBuilderWidget<String> {
  /// 最大可输入字符数
  final int? maxLength;

  final int? maxLines;

  TextAreaInputFormFiled({
    Key? key,
    label,
    required = false,
    this.maxLength,
    this.maxLines = 5,
    initialValue,
    placeholder,
    onSaved,
    validator,
    validators,
  }) : super(key: key, label: label, onSaved: onSaved, required: required, placeholder: placeholder, initialValue: initialValue, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        label: label,
        control: CupertinoTextFormFieldRow(
          onSaved: onSaved,
          initialValue: initialValue,
          placeholder: getPlaceholder(),
          maxLength: maxLength,
          maxLines: maxLines,
          style: Theme.of(context).textTheme.bodyLarge,
          placeholderStyle: getPlaceholderStyle(context),
          validator: validator != null ? validator : (v) => validate(v),
        ));
  }
}
