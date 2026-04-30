import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/views/my_brn_text_input_item.dart';
import 'package:tornado/form/Validator.dart';
import 'package:tornado/theme.dart';

import 'FormFieldBuilderHelper.dart';

class TextInputFormField extends FormField<String> {
  TextInputFormField({
    key,
    title = "",
    initialValue,
    controller,
    isRequire = false,
    onSaved,
    onChanged,
    onAddTap,
    maxCharCount,
    String? placeholder,
    inputType,
    isEdit = true,
    unit,
    Widget? end,
    prefixIconType = BrnPrefixIconType.normal,
    obscureText = false,
    tipLabel,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            key: key,
            builder: (FormFieldState<String> field) {
              Widget item = BrnTextInputFormItem(
                  prefixIconType: prefixIconType,
                  title: title,
                  isRequire: isRequire,
                  isEdit: isEdit,
                  controller: controller ?? (TextEditingController()..text = initialValue ?? ""),
                  hint: placeholder ?? "Please input ...",
                  tipLabel: tipLabel,
                  unit: unit,
                  obscureText: obscureText,
                  error: field.errorText ?? "",
                  maxCharCount: maxCharCount,
                  inputType: inputType,
                  onChanged: (value) {
                    if (onChanged != null) {
                      onChanged(value);
                    }
                    field.didChange(value);
                  },
                  onAddTap: onAddTap);
              return end != null
                  ? Row(
                      children: [
                        Expanded(
                          child: item,
                        ),
                        end,
                      ],
                    )
                  : item;
            },
            validator: validator ?? (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved);
}
