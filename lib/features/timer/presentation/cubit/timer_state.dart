part of 'timer_cubit.dart';

/// The state of a timer.
@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    required Duration duration,
    required int remainingSeconds,
    Timer? timer,
  }) = _Initial;

  const TimerState._();

  /// Returns true if the timer is running.
  bool get isRunning => timer != null;

  /// Returns true if the timer has finished.
  bool get isFinished => remainingSeconds <= 0;

  /// Returns the remaining minutes as a string.
  String remainingMinutesString(int seconds) =>
      (seconds ~/ 60).toString().padLeft(2, '0');

  /// Returns the remaining seconds in the minute as a string.
  String remainingSecondsInMinuteString(int seconds) =>
      (seconds % 60).toString().padLeft(2, '0');

  /// Returns the remaining time as a string with a '+' sign if the remaining
  /// time is negative.
  String get clockTime {
    var s = remainingSeconds < 0 ? '+' : '';
    return s += '${remainingMinutesString(remainingSeconds.abs())}:'
        '${remainingSecondsInMinuteString(remainingSeconds.abs())}';
  }
}
