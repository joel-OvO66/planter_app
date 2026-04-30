import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';

import 'FormFieldBuilderHelper.dart';

class StepInputFormField extends FormField<int> {
  StepInputFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    int? initialValue,
    onSaved,
    isEdit=true,
    onChanged,
    validator,
    validators,
    maxLimit = 10,
    minLimit = 0,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue ?? 0,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<int> field) {
              return BrnStepInputFormItem(
                prefixIconType: prefixIconType,
                isRequire: isRequire,
                isEdit: isEdit,
                error: field.errorText ?? "",
                title: title,
                subTitle: subTitle,
                tipLabel: tipLabel,
                value: field.value,
                maxLimit: maxLimit,
                minLimit: minLimit,
                onTip: () {},
                onAddTap: () {},
                onRemoveTap: () {},
                onChanged: (oldValue, newValue) {
                  field.didChange(newValue);
                  if (onChanged != null) {
                    onChanged(newValue);
                  }
                },
              );
            });
}
