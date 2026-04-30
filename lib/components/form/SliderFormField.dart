import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormFieldBuilderHelper.dart';
import 'SliderExample.dart';

class SliderFormField extends FormField<double> {
  SliderFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    double initialValue = 0,
    onSaved,
    max = 100,
    min = 0,
    sumStar,
    backgroundColor,
    isEdit = true,
    divisions = 100,
    onChanged,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<double> field) {
              return BrnBaseTitle(
                error: field.errorText ?? "",
                title: title,
                isEdit: isEdit,
                subTitle: subTitle,
                tipLabel: tipLabel,
                isRequire: isRequire,
                customActionWidget: Slider(
                  value: field.value!,
                  max: double.parse(max.toString()),
                  min: double.parse(min.toString()),
                  divisions: divisions,
                  label: field.value!.round().toString(),
                  onChanged: (newValue) {
                    field.didChange(newValue);
                    if (onChanged != null) {
                      onChanged(newValue);
                    }
                  },
                ),
                onTip: () {},
              );
            });
}
