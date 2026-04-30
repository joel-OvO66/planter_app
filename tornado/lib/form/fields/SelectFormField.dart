import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:tornado/form/FormItem.dart';
import 'package:tornado/form/FormItemContainer.dart';
import 'package:tornado/form/fields/FormFieldBuilderWidget.dart';
import 'package:tornado/theme.dart';

class SelectFormField<T> extends FormFieldBuilderWidget {
  /// 输入提示
  String? placeholder;

  List<FormItem<T>>? formItems;

  SelectFormField({
    Key? key,
    label,
    initialValue,
    required = false,
    this.formItems,
    this.placeholder,
    onSaved,
    onChanged,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, required: required, onSaved: onSaved, onChanged: onChanged, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField(
            initialValue: initialValue,
            onSaved: onSaved,
            builder: (FormFieldState field) {
              return CupertinoFormRow(
//上下间隔和问题名称一样高
                  padding: EdgeInsets.fromLTRB(20, 0, 6, 0),
                  prefix: buildLabel(context),
                  child: TextButton(
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                      Pickers.showSinglePicker(context,
                          pickerStyle: PickerStyle(commitButton: Container(child: Text('确定'), margin: EdgeInsets.only(right: 16))),
                          data: formItems,
                          selectData: getFormItem(field.value), onConfirm: (var data, int position) {
                        field.didChange((data as FormItem).value);
                        if (onChanged != null) onChanged!((data as FormItem).value);
                      });
                    },
                    child: field.value != null ? Text(getItemLabel(field.value), style: Theme.of(context).textTheme.bodyLarge) : getPlaceholderText(context),
                  ),
                  error: showErrorText(context, field));
            },
            validator: validator != null ? validator : (v) => validate(v)));
  }

  String getItemLabel(T value) {
    return formItems == null ? "" : formItems!.firstWhere((element) => element.value == value || element.value.hashCode == value.hashCode, orElse: () => FormItem('', initialValue)).label;
  }

  FormItem<T>? getFormItem(T? value) {
    return formItems == null || value == null ? null : formItems!.firstWhere((element) => element.value == value || element.value.hashCode == value.hashCode, orElse: () => FormItem('', initialValue));
  }
}
