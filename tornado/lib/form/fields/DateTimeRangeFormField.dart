import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../theme.dart';
import '../FormItemContainer.dart';
import 'FormFieldBuilderWidget.dart';

class DateTimeRangeFormField extends FormFieldBuilderWidget<List<DateTime?>> {
  DateMode mode;

  DateTimeRangeFormField({
    Key? key,
    this.mode = DateMode.YMD,
    label,
    initialValue,
    placeholder,
    onSaved,
    validator,
    validators,
  }) : super(key: key, label: label, initialValue: initialValue, onSaved: onSaved, placeholder: placeholder, validator: validator, validators: validators);

  @override
  Widget build(BuildContext context) {
    return FormItemContainer(
        control: FormField<List<DateTime?>>(
            initialValue: initialValue,
            builder: (FormFieldState<List<DateTime?>> field) {
              return CupertinoFormRow(
                  prefix: buildLabel(context),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                          Pickers.showDatePicker(context,
                              pickerStyle: PickerStyle(commitButton: Container(child: Text('确定'), margin: EdgeInsets.only(right: 16))),
                              mode: mode,
                              suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
                              selectDate: getPDuration(field, 0), onConfirm: (p) {
                            List<DateTime?>? datetimes = field.value;
                            if (datetimes != null) {
                              datetimes[0] = DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!);
                            } else {
                              datetimes = [DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!), DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!)];
                            }
                            field.didChange(datetimes);
                          });
                        },
                        child: field.value != null ? Text(_getValue(field.value![0]), style: Theme.of(context).textTheme.bodyLarge) : getPlaceholderText(context)),
                    Text('-'),
                    TextButton(
                        onPressed: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                          Pickers.showDatePicker(context,
                              pickerStyle: PickerStyle(commitButton: Container(child: Text('确定'), margin: EdgeInsets.only(right: 16))),
                              mode: mode,
                              suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
                              selectDate: getPDuration(field, 1), onConfirm: (p) {
                            List<DateTime?>? datetimes = field.value;
                            if (datetimes != null) {
                              datetimes[1] = DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!);
                            } else {
                              datetimes = [DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!), DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!)];
                            }
                            field.didChange(datetimes);
                          });
                        },
                        child: field.value != null ? Text(_getValue(field.value![1]), style: Theme.of(context).textTheme.bodyLarge) : getPlaceholderText(context))
                  ]),
                  error: showErrorText(context, field));
            },
            onSaved: onSaved,
            validator: validator != null ? validator : (v) => validate(v)));
  }

  PDuration? getPDuration(FormFieldState<List<DateTime?>> field, int index) {
    if (field != null && field.value![index] != null) {
      return PDuration.parse(field.value![index]!);
    } else {
      return null;
    }
  }

  String _getValue(DateTime? dateTime) {
    switch (mode) {
      case DateMode.HM:
        return DateFormater.formatTimeNoSecond(dateTime);
      case DateMode.HMS:
        return DateFormater.formatTime(dateTime);
      case DateMode.YMDHM:
      case DateMode.YMDHMS:
        return DateFormater.formatDateTime(dateTime);
      case DateMode.MD:
        return DateFormater.formatDateNoYear(dateTime);
      default:
        return DateFormater.formatDate(dateTime);
    }
  }

  PDuration? getFileValue(FormFieldState<List<DateTime>> field) {
    return field.value != null ? PDuration.parse(field.value![0]) : null;
  }
}
