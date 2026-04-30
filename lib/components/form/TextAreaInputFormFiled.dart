import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:planter_app/views/my_brn_text_block_input_item.dart';

import 'FormFieldBuilderHelper.dart';

class TextAreaInputFormFiled extends FormField<String> {
  TextAreaInputFormFiled({
    title = "",
    initialValue,
    isRequire = false,
    onSaved,
    maxCharCount,
    String? placeholder,
    minLines = 4,
    maxLines = 20,
    isEdit = true,
    tipLabel,
    validator,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            builder: (FormFieldState<String> field) {
              return BrnTextBlockInputFormItem(
                title: title,
                isRequire: isRequire,
                controller: TextEditingController()..text = initialValue ?? "",
                minLines: minLines,
                maxLines: maxLines,
                isEdit: isEdit,
                hint: placeholder ?? "请输入",
                tipLabel: tipLabel,
                error: field.errorText ?? "",
                maxCharCount: maxCharCount,
                onChanged: (value) {
                  field.didChange(value);
                },
              );
            },
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved);
}
