import 'package:intl/intl.dart';

class DateFormater {
  static String formatDate(DateTime? dateTime, [String? newPattern]) {
    return dateTime != null ? DateFormat(newPattern == null ? 'yyyy-MM-dd' : newPattern).format(dateTime) : '';
  }

  static String formatDateTime(DateTime? dateTime, [String? newPattern]) {
    return dateTime != null ? DateFormat(newPattern == null ? 'yyyy-MM-dd HH:mm:ss' : newPattern).format(dateTime) : '';
  }

  static String formatDateTimeNoSecond(DateTime? dateTime, [String? newPattern]) {
    return dateTime != null ? DateFormat(newPattern == null ? 'yyyy-MM-dd HH:mm' : newPattern).format(dateTime) : '';
  }

  static String formatTime(DateTime? dateTime, [String? newPattern]) {
    return dateTime != null ? DateFormat(newPattern == null ? 'HH:mm:ss' : newPattern).format(dateTime) : '';
  }

  static String formatTimeNoSecond(DateTime? dateTime, [String? newPattern]) {
    return dateTime != null ? DateFormat(newPattern == null ? 'HH:mm' : newPattern).format(dateTime) : '';
  }

  static String formatDateNoYear(DateTime? dateTime, [String? newPattern]) {
    return dateTime != null ? DateFormat(newPattern == null ? 'MM-dd' : newPattern).format(dateTime) : '';
  }

  static String prefixInteger(num, length) {
    return num >= 10 ? num.toString() : (List.generate(length + 1, (index) => '').join('0') + num.toString());
  }

  static String debug(String s, length) {
    return s.length == 24 ? s : (List.generate(length - s.length, (index) => '').join('0') + s);
  }

  static DateTime? parseTime(String? value, [String? newPattern]) {
    return value != null && value.isNotEmpty ? DateFormat(newPattern == null ? 'HH:mm:ss' : newPattern).parse(value) : null;
  }

  static DateTime? parseDate(String? value, [String? newPattern]) {
    return value != null && value.isNotEmpty ? DateFormat(newPattern == null ? 'yyyy-MM-dd' : newPattern).parse(value) : null;
  }

  static DateTime? parseDateTime(String? value, [String? newPattern]) {
    try {
      return value != null && value.isNotEmpty ? DateFormat(newPattern == null ? 'yyyy-MM-dd HH:mm:ss' : newPattern).parse(value) : null;
    } catch (error) {
      return parseDateTimeNoSecond(value, newPattern);
    }
  }

  static DateTime? parseDateTimeNoSecond(String? value, [String? newPattern]) {
    return value != null && value.isNotEmpty ? DateFormat(newPattern == null ? 'yyyy-MM-dd HH:mm' : newPattern).parse(value) : null;
  }

  static String dateToJson(DateTime? dateTime) => DateFormater.formatDate(dateTime);

  static String dateTimeToJson(DateTime? dateTime) => DateFormater.formatDateTime(dateTime);

  static String dateTimeNoSecondToJson(DateTime? dateTime) => DateFormater.formatDateTimeNoSecond(dateTime);

  static String timeToJson(DateTime? dateTime) => DateFormater.formatTime(dateTime);

  static DateTime? jsonToTime(String? value) => DateFormater.parseTime(value);

  static DateTime? jsonToDate(String? value) => DateFormater.parseDate(value);

  static DateTime? jsonToDateTime(String? value) => DateFormater.parseDateTime(value);

  static DateTime? jsonToDateTimeNoSecond(String? value) => DateFormater.parseDateTimeNoSecond(value);
}
