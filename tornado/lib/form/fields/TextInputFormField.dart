import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import 'FormFieldBuilderWidget.dart';

class TextInputFormField extends FormFieldBuilderWidget<String> {
  final Widget? prefix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;

  TextInputFormField({
    Key? key,
    label,
    initialValue,
    onSaved,
    onChanged,
    this.maxLength,
    Widget? end,
    required,
    this.prefix,
    this.controller,
    placeholder,
    validator,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    tipLabel,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key, label: label, initialValue: initialValue, required: required, placeholder: placeholder, onSaved: onSaved, validator: validator, onChanged: onChanged, validators: validators);

  @override
  Widget build(BuildContext context) {
    Widget? filedPrefix;
    if (prefix != null) {
      filedPrefix = prefix;
    } else if (label != null) {
      filedPrefix = Text(label!, style: Theme.of(context).textTheme.labelSmall);
      if (required == true) {
        filedPrefix = Row(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('*', style: TextStyle(color: CupertinoColors.systemRed)), filedPrefix],
        );
      }
    }
    return CupertinoTextFormFieldRow(
      controller: controller,
      placeholder: placeholder,
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      textAlign: TextAlign.right,
      onSaved: onSaved,
      style: Theme.of(context).textTheme.bodyLarge,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      placeholderStyle: getPlaceholderStyle(context),
      validator: validator != null ? validator : (v) => validate(v),
      prefix: filedPrefix,
    );
  }
}
