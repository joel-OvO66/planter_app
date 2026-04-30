import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../FormItem.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class FormCheckboxBuilder extends FormFieldBuilderWidget<bool?> {
  List<FormItem<bool>>? formItems;

  FormCheckboxBuilder({
    Key? key,
    label,
    this.formItems,
    initialValue,
    onSaved,
    onChanged,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, onSaved: onSaved, onChanged: onChanged, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField<bool?>(
      initialValue: initialValue,
      builder: (FormFieldState field) {
        return CupertinoFormRow(
            prefix: buildLabel(context),
            child: Wrap(
                children: formItems == null
                    ? []
                    : formItems!
                        .map((v) => Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                              Checkbox(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, activeColor: Color.fromRGBO(24, 144, 255, 1.0), value: v.value, onChanged: onChanged),
                              Text(v.label, style: Theme.of(context).textTheme.bodyLarge)
                            ]))
                        .toList()));
      },
      validator: validator != null ? validator : (v) => validate(v),
      onSaved: onSaved,
    ));
  }
}
