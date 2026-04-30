import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:planter_app/views/my_brn_date_range_picker.dart';
import 'package:provider/provider.dart';
import 'package:tornado/theme.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../generated/l10n.dart';

/**
 * 日期或者日期范围选择器，注意，只能选择日期，或者时间，不能同时使用
 */

/**
 * DateTimeRangeForm 主类
 **/
class DateTimeRangeForm extends StatefulWidget {
  DateTime? startDate;

  DateTime? endDate;

  ValueChanged<List<DateTime>>? onChanged;

  DateTimeRangeForm({Key? key, this.startDate, this.endDate, this.onChanged}) : super(key: key);

  @override
  _DateTimeRangeFormState createState() => _DateTimeRangeFormState();
}

/**
 * DateTimeRangeForm UI布局
 **/
class _DateTimeRangeFormState extends State<DateTimeRangeForm> with _DateTimeRangeFormMixin {
  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    startDate = widget.startDate;
    endDate = widget.endDate;
    if (startDate == null) {
      startDate = DateTime.now();
    }
    if (endDate == null) {
      endDate = startDate!.add(Duration(days: 30));
      widget.onChanged!([startDate!, endDate!]);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return Column(
      children: [
        SizedBox(height: 16.sp),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text(S.of(context).startDate), Text(S.of(context).endDate)]),
        GestureDetector(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text(DateFormater.formatDate(startDate)), Text(DateFormater.formatDate(endDate))]),
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (currentFocus.focusedChild != null) currentFocus.focusedChild!.unfocus();
            MyBrnDateRangePicker.showDatePicker(context,
                // minDateTime: minDateTime,
                // maxDateTime: maxDateTime,
                pickerMode: BrnDateTimeRangePickerMode.date,
                dateFormat: "yyyy-MM-dd",
                initialStartDateTime: startDate,
                initialEndDateTime: endDate,
                locale: settingProvider.toDateTimePickerLocale(),
                pickerTitleConfig: BrnPickerTitleConfig(titleContent: S.of(context).select_time_range),
                onConfirm: (startDateTime, endDateTime, startlist, endlist) {
              setState(() {
                startDate = startDateTime;
                endDate = endDateTime;
                if (widget.onChanged != null) {
                  widget.onChanged!([startDate!, endDate!]);
                }
              });
            }, onClose: () {
              print("onClose");
            }, onCancel: () {
              print("onCancel");
            }, onChange: (startDateTime, endDateTime, startlist, endlist) {});
          },
        )
      ],
    );
  }
}

/**
 * DateTimeRangeForm 数据逻辑
 **/
mixin _DateTimeRangeFormMixin<T extends StatefulWidget> on State<T> {}

class DateTimeRange {
  DateTime? startDateTime;

  DateTime? endDateTime;

  DateTimeRange(this.startDateTime, this.endDateTime);
}
