import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:tornado/util/DateFormater.dart';

import 'FormFieldBuilderHelper.dart';

class DateTimePickerFormField extends FormField<DateTime> {
  DateTimePickerFormField({
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    BrnDateTimePickerMode mode = BrnDateTimePickerMode.date,
    String dateFormat = 'yyyy年-MM月-dd日',
    initialValue,
    onSaved,
    onChanged,
    placeholder,
    minDateTime,
    maxDateTime,
    validator,
    isEdit = true,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            initialValue: initialValue,
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<DateTime> field) {
              String? value = null;
              switch (mode) {
                // case DateMode.HM:
                //   value = DateFormater.formatTimeNoSecond(field.value);
                //   break;
                case BrnDateTimePickerMode.time:
                  value = DateFormater.formatTime(field.value);
                  dateFormat = dateFormat != 'yyyy年-MM月-dd日' ? dateFormat : 'HH时:mm分';
                  break;
                case BrnDateTimePickerMode.datetime:
                  value = DateFormater.formatDateTimeNoSecond(field.value);
                  dateFormat = dateFormat != 'yyyy年-MM月-dd日' ? dateFormat : 'yyyy年-MM月-dd日-HH时:mm分';
                  break;
                case BrnDateTimePickerMode.date:
                  value = DateFormater.formatDateTime(field.value, dateFormat);
                  break;
                // case DateMode.MD:
                //   value = DateFormater.formatDateNoYear(field.value);
                //   break;
                default:
                  value = DateFormater.formatDate(field.value);
              }

              return BrnTextSelectFormItem(
                isEdit: isEdit,
                error: field.errorText ?? "",
                title: title,
                subTitle: subTitle,
                tipLabel: tipLabel,
                isRequire: isRequire,
                value: value,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(field.context);
                  if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                  BrnDatePicker.showDatePicker(field.context,
                      pickerMode: mode,
                      minDateTime: minDateTime,
                      maxDateTime: maxDateTime,
                      initialDateTime: field.value,
                      pickerTitleConfig: BrnPickerTitleConfig.Default,
                      dateFormat: dateFormat, onConfirm: (dateTime, list) {
                    field.didChange(dateTime);
                    if (onChanged != null) {
                      onChanged!(dateTime);
                    }
                  });
                },
                onTip: () {},
              );
            });
}
