class DateTimeUtil {
  static DateTime convertTime(int? seconds) {
    DateTime dateTime = DateTime(2024, 1, 1, 0, 0, 0, 0, 0);
    if (seconds != null) {
      dateTime = dateTime.add(Duration(seconds: seconds));
    }
    return dateTime;
  }

  static int convertNum(DateTime dateTime) {
    return dateTime.hour * 60 * 60 + dateTime.minute * 60 + dateTime.second;
  }

  static DateTime getLastSecondOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
}
