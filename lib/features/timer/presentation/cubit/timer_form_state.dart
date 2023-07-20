part of 'timer_form_cubit.dart';

@freezed
class TimerFormState with _$TimerFormState {
  const factory TimerFormState({
    required String name,
    required String seconds,
    required String minutes,
    @Default(InitialStatus()) Status status,
    String? nameError,
    String? durationError,
  }) = _Initial;

  const TimerFormState._();

  /// Returns true if the form is valid.
  bool get isValid =>
      nameError == null &&
      durationError == null &&
      (minutes != '' || seconds != '');

  /// Returns the duration from the form.
  Duration get duration => Duration(
        minutes: int.tryParse(minutes) ?? 0,
        seconds: int.tryParse(seconds) ?? 0,
      );
}
