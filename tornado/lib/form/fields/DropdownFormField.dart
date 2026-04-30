import 'package:flutter/material.dart';

import '../../theme.dart';
import '../FormItem.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class DropdownFormField<T> extends FormFieldBuilderWidget<T?> {
  List<FormItem<T>>? formItems;

  DropdownFormField({
    Key? key,
    label,
    initialValue,
    this.formItems,
    placeholder,
    onSaved,
    onChanged,
    validator,
    validators,
  }) : super(key: key, label: label, onSaved: onSaved, onChanged: onChanged, placeholder: placeholder, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
      control: DropdownButtonFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: InputBorder.none,
          // filled: true,
          // fillColor: Colors.grey[300],
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        hint: Text(getPlaceholder()),
        isExpanded: true,
        isDense: true,
        style: getPlaceholderStyle(context),
        value: initialValue,
        items: formItems!.map((item) {
          return DropdownMenuItem(
            value: item.value,
            child: Text(item.label),
          );
        }).toList(),
        validator: validator != null ? validator : (v) => validate(v),
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}
