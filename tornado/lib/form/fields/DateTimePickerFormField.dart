import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:intl/intl.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../theme.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class DateTimePickerFormField extends FormFieldBuilderWidget<DateTime> {
  DateMode mode;

  /// 输入提示
  String? placeholder;

  DateTimePickerFormField({
    Key? key,
    this.mode = DateMode.YMD,
    label,
    initialValue,
    this.placeholder,
    onSaved,
    onChange,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, onSaved: onSaved, onChanged: onChange, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField<DateTime>(
            initialValue: initialValue,
            builder: (FormFieldState<DateTime> field) {
              String _getValue() {
                switch (mode) {
                  case DateMode.HM:
                    return DateFormater.formatTimeNoSecond(field.value);
                  case DateMode.HMS:
                    return DateFormater.formatTime(field.value);
                  case DateMode.YMDHM:
                    return DateFormater.formatDateTimeNoSecond(field.value);
                  case DateMode.YMDHMS:
                    return DateFormater.formatDateTime(field.value);
                  case DateMode.MD:
                    return DateFormater.formatDateNoYear(field.value);
                  default:
                    return DateFormater.formatDate(field.value);
                }
              }

              return CupertinoFormRow(
                  padding: EdgeInsets.fromLTRB(20, 0, 6, 0),
                  prefix: buildLabel(context),
                  child: TextButton(
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                        Pickers.showDatePicker(context,
                            pickerStyle: PickerStyle(commitButton: Container(child: Text('确定'), margin: EdgeInsets.only(right: 16))),
                            mode: mode,
                            suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
                            selectDate: field.value != null ? PDuration.parse(field.value!) : null, onConfirm: (p) {
                          field.didChange(DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!));
                          if (onChanged != null) onChanged!(DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!));
                        });
                      },
                      child: field.value != null ? Text(_getValue(), style: Theme.of(context).textTheme.bodyLarge) : getPlaceholderText(context)),
                  error: showErrorText(context, field));
            },
            onSaved: onSaved,
            validator: validator != null ? validator : (v) => validate(v)));
  }
}
