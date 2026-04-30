import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planter_app/views/my_brn_date_range_picker.dart';
import 'package:tornado/theme.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../generated/l10n.dart';

/**
 * 日期或者日期范围选择器，注意，只能选择日期，或者时间，不能同时使用
 */
class DateTimeRangeFormField extends FormField<DateTimeRange> {
  DateTimeRangeFormField({
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    pickerMode = BrnDateTimeRangePickerMode.date,
    minDateTime,
    maxDateTime,
    DateTime? startDateTime,
    DateTime? endDateTime,
    FormFieldSetter<DateTimeRange>? onSaved,
    onChanged,
    placeholder,
    validator,
    isEdit = true,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            initialValue: DateTimeRange(startDateTime, endDateTime),
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            builder: (FormFieldState<DateTimeRange> field) {
              String valueLabel = "";
              if (pickerMode == BrnDateTimeRangePickerMode.date) {
                valueLabel = DateFormater.formatDate(field.value?.startDateTime) + " - " + DateFormater.formatDate(field.value?.endDateTime);
              } else {
                valueLabel = DateFormater.formatTimeNoSecond(field.value?.startDateTime) + " - " + DateFormater.formatTimeNoSecond(field.value?.endDateTime);
              }
              return BrnTextSelectFormItem(
                isEdit: isEdit,
                error: field.errorText ?? "",
                title: title,
                subTitle: subTitle,
                tipLabel: tipLabel,
                isRequire: isRequire,
                value: (field.value != null && field.value?.startDateTime != null) ? valueLabel : null,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(field.context);
                  if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
                  MyBrnDateRangePicker.showDatePicker(field.context,
                      minDateTime: minDateTime,
                      maxDateTime: maxDateTime,
                      pickerMode: pickerMode,
                      dateFormat: (pickerMode == BrnDateTimeRangePickerMode.date) ? "yyyy年-MM月-dd日" : "HH时-mm分",
                      initialStartDateTime: field.value?.startDateTime,
                      initialEndDateTime: field.value?.endDateTime,
                      pickerTitleConfig: BrnPickerTitleConfig(titleContent: S.of(field.context).select_time_range),
                      themeData: BrnPickerConfig(itemTextStyle: BrnTextStyle.withStyle(Theme.of(field.context).textTheme.bodyLarge)), onConfirm: (startDateTime, endDateTime, startlist, endlist) {
                    field.didChange(DateTimeRange(startDateTime, endDateTime));
                  }, onClose: () {
                    print("onClose");
                  }, onCancel: () {
                    print("onCancel");
                  }, onChange: (startDateTime, endDateTime, startlist, endlist) {});
                },
                onTip: () {},
              );
            });
}

class DateTimeRange {
  DateTime? startDateTime;

  DateTime? endDateTime;

  DateTimeRange(this.startDateTime, this.endDateTime);
}
