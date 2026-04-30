import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class SliderFormField extends FormFieldBuilderWidget {
  SliderFormField({
    Key? key,
    label,
    initialValue,
    onSaved,
    onChanged,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, onSaved: onSaved, onChanged: onChanged);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField<bool>(
      initialValue: initialValue,
      builder: (FormFieldState field) {
        return CupertinoFormRow(
          prefix: buildLabel(context),
          child: Slider(
            value: initialValue,
            onChanged: onChanged,
            onChangeStart: (startValue) {
              print('onChangeStart:$startValue');
            },
            onChangeEnd: (endValue) {
              print('onChangeEnd:$endValue');
            },
            // label: '$_value dollars',
            divisions: 5,
            semanticFormatterCallback: (newValue) {
              return '${newValue.round()}';
            },
          ),
        );
      },
      onSaved: onSaved,
    ));
  }
}
