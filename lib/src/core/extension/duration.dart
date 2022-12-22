class DurationStamp {
  final int microseconds;
  final int milliseconds;
  final int seconds;
  final int minutes;
  final int hours;
  final int days;

  const DurationStamp.fromValue(
      {this.microseconds = 0,
      this.milliseconds = 0,
      this.seconds = 0,
      this.minutes = 0,
      this.hours = 0,
      this.days = 0});

  factory DurationStamp({
    int microseconds = 0,
    int milliseconds = 0,
    int seconds = 0,
    int minutes = 0,
    int hours = 0,
    int days = 0,
  }) {
    return DurationStamp.fromDuration(Duration(
      microseconds: microseconds,
      milliseconds: milliseconds,
      seconds: seconds,
      minutes: minutes,
      hours: hours,
      days: days,
    ));
  }

  factory DurationStamp.fromDuration(Duration duration) {
    return DurationStamp.fromValue(
      microseconds: duration.inMicroseconds.remainder(1000),
      milliseconds: duration.inMilliseconds.remainder(1000),
      seconds: duration.inSeconds.remainder(60),
      minutes: duration.inMinutes.remainder(60),
      hours: duration.inHours.remainder(24),
      days: duration.inDays.remainder(24),
    );
  }

  const DurationStamp.calculate(
      {int microseconds = 0,
      int milliseconds = 0,
      int seconds = 0,
      int minutes = 0,
      int hours = 0,
      int days = 0})
      : this._microseconds(microseconds +
            Duration.microsecondsPerMillisecond * milliseconds +
            Duration.microsecondsPerSecond * seconds +
            Duration.microsecondsPerMinute * minutes +
            Duration.microsecondsPerHour * hours +
            Duration.microsecondsPerDay * days);

  const DurationStamp._microseconds(int microseconds)
      : days = microseconds ~/ Duration.microsecondsPerDay,
        hours = microseconds ~/ Duration.microsecondsPerHour -
            (microseconds ~/ Duration.microsecondsPerDay) * 24,
        minutes = microseconds ~/ Duration.microsecondsPerMinute -
            (microseconds ~/ Duration.microsecondsPerHour) * 60,
        seconds = microseconds ~/ Duration.microsecondsPerSecond -
            (microseconds ~/ Duration.microsecondsPerMinute) * 60,
        milliseconds = microseconds ~/ Duration.microsecondsPerMillisecond -
            (microseconds ~/ Duration.microsecondsPerSecond) * 1000,
        microseconds = microseconds -
            (microseconds ~/ Duration.microsecondsPerMillisecond) * 1000;
}
