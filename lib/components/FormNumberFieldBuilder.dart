import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tornado/form/FormItemContainer.dart';
import 'package:tornado/form/fields/FormFieldBuilderWidget.dart';
import 'package:tornado/theme.dart';

class FormNumberFieldBuilder extends FormFieldBuilderWidget<num> {
  /// 输入提示
  String? placeholder;

  /// 最大可输入字符数
  final int? maxLength;

  /// 整数的个数
  final int maxIntegerCount;

  /// 保留的小数个数
  final int maxDecimalCount;

  bool enabled;

  /// 是否为整型
  bool integer;

  FormNumberFieldBuilder({
    Key? key,
    label,
    required = false,
    this.maxLength,
    this.maxIntegerCount = 8,
    this.maxDecimalCount = 2,
    this.placeholder,
    this.enabled = true,
    this.integer = false,
    initialValue,
    onSaved,
    onChanged,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, required: required, onSaved: onSaved, onChanged: onChanged, validator: validator, validators: validators);
  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: CupertinoTextFormFieldRow(
            prefix: buildLabel(context),
            textAlign: TextAlign.right,
            inputFormatters: [_NoLeadingWhitespaceInputFormatter(), _CustomNumFormatter(maxDecimalCount: maxDecimalCount, maxIntegerCount: maxIntegerCount)],
            initialValue: initialValue != null ? initialValue.toString() : null,
            onSaved: (value) {
              if (onSaved != null) {
                if (integer) {
                  onSaved!(int.parse(value ?? "0"));
                } else {
                  onSaved!(double.parse(value ?? "0"));
                }
              }
            },
            onChanged: (value) {
              if (onChanged != null) {
                if (integer) {
                  onChanged!(int.parse(value));
                } else {
                  onChanged!(double.parse(value));
                }
              }
            },
            enabled: enabled,
            placeholder: placeholder ?? "请输入" + label!,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLength: maxLength,
            placeholderStyle: Theme.of(context).textTheme.bodyLarge,
            validator: (v) => validate(v),
            keyboardType: TextInputType.number));
  }
}

class _NoLeadingWhitespaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      final txt = newValue.text.trimLeft();
      return newValue.copyWith(text: txt, selection: TextSelection.collapsed(offset: txt.length));
    }
    return newValue;
  }
}

class _CustomNumFormatter extends TextInputFormatter {
  /// 整数的个数
  final int maxIntegerCount;

  /// 保留的小数个数
  final int maxDecimalCount;

  /// 是否可以输入>=0<1的值
  final bool zeroStartLTOne;

  _CustomNumFormatter({this.maxIntegerCount = 8, this.maxDecimalCount = 2, this.zeroStartLTOne = false}) : assert(maxIntegerCount >= 1 && maxDecimalCount >= 0);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (_isValidInput(newValue.text)) {
      return newValue;
    } else {
      if (newValue.text == '') {
        return TextEditingValue(text: '', selection: TextSelection.collapsed(offset: 0));
      } else {
        return oldValue;
      }
    }
  }

  bool _isValidInput(String input) {
    String pattern = '';
    if (maxDecimalCount == 0) {
      if (input.startsWith('0') && zeroStartLTOne) {
        pattern = '^0\$';
      } else {
        pattern = '^[1-9]\\d{0,${maxIntegerCount - 1}}\$';
      }
    } else {
      if (input.startsWith('0') && zeroStartLTOne) {
        pattern = '^0(?:\\.\\d{0,$maxDecimalCount})?\$';
      } else {
        pattern = '^[1-9]\\d{0,${maxIntegerCount - 1}}(?:\\.\\d{0,$maxDecimalCount})?\$';
      }
    }
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(input);
  }
}
