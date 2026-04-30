import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../FormItem.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class RadioInputFormField<T> extends FormFieldBuilderWidget {
  List<FormItem<T>>? formItems;

  bool listTile;

  RadioInputFormField({
    Key? key,
    this.formItems,
    this.listTile = false,
    label,
    initialValue,
    onSaved,
    onChanged,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, onSaved: onSaved, onChanged: onChanged, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField<T>(
      initialValue: initialValue,
      builder: (FormFieldState field) {
        return CupertinoFormRow(prefix: buildLabel(context), child: _buildContent(context));
      },
      validator: validator != null ? validator : (v) => validate(v),
      onSaved: onSaved,
    ));
  }

  Widget _buildContent(BuildContext context) {
    if (formItems == null) {
      return Text("");
    }
    if (listTile) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: formItems!
              .map((v) => RadioListTile(
                  value: v.value,
                  groupValue: initialValue,
                  onChanged: onChanged,
                  contentPadding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                  dense: true,
                  title: Text(v.label, style: Theme.of(context).textTheme.bodyLarge)))
              .toList());
    } else {
      return Wrap(
          children: formItems!
              .map((v) => Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                    Radio<T>(value: v.value, groupValue: initialValue, onChanged: onChanged, activeColor: Color.fromRGBO(24, 144, 255, 1.0)),
                    Text(v.label, style: Theme.of(context).textTheme.bodyLarge)
                  ]))
              .toList());
    }
  }
}
