import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';

import 'FormFieldBuilderHelper.dart';

class StarsFormField extends FormField<int> {
  StarsFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    int initialValue = 0,
    onSaved,
    sumStar,
    backgroundColor,
    isEdit=true,
    onChanged,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<int> field) {
              return BrnStarsFormItem(
                prefixIconType: prefixIconType,
                isRequire: isRequire,
                isEdit: isEdit,
                error: field.errorText ?? "",
                backgroundColor: backgroundColor,
                sumStar: sumStar,
                title: title,
                subTitle: subTitle,
                tipLabel: tipLabel,
                value: field.value!,
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
