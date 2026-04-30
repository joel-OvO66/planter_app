import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormFieldBuilderHelper.dart';
import 'SliderExample.dart';

class RangeSliderFormField extends FormField<RangeValues> {
  RangeSliderFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    required RangeValues initialValue,
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
            builder: (FormFieldState<RangeValues> field) {
              return BrnBaseTitle(
                error: field.errorText ?? "",
                title: title,
                isEdit: isEdit,
                subTitle: subTitle,
                tipLabel: tipLabel,
                isRequire: isRequire,
                customActionWidget: RangeSlider(
                  values: field.value!,
                  max: double.parse(max.toString()),
                  min: double.parse(min.toString()),
                  divisions: divisions,
                  labels: RangeLabels(field.value!.start.toString(), field.value!.end.toString()),
                  onChangeStart: (newValue) {
                    // field.didChange(newValue);
                    // if (onChanged != null) {
                    //   onChanged(newValue);
                    // }
                  },
                  onChangeEnd: (newValue) {
                    // field.didChange(newValue);
                    // if (onChanged != null) {
                    //   onChanged(newValue);
                    // }
                  },
                  onChanged: (RangeValues newValue) {
                    print(newValue);
                    field.didChange(newValue);
                  },
                ),
                onTip: () {},
              );
            });
}
