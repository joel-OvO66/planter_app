
class TimePeriod {
  DateTime startTime;
  DateTime endTime;

  TimePeriod(this.startTime, this.endTime);

  bool overlapsWith(TimePeriod other) {
    return endTime.isAfter(other.startTime) && startTime.isBefore(other.endTime);
  }
}