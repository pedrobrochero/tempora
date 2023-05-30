part of 'timer_form_cubit.dart';

@freezed
class TimerFormState with _$TimerFormState {
  const factory TimerFormState({
    @Default(InitialStatus()) Status status,
    @Default('') String name,
    String? nameError,
    @Default('00') String seconds,
    @Default('00') String minutes,
    String? durationError,
  }) = _Initial;

  const TimerFormState._();

  /// Returns true if the form is valid.
  bool get isValid =>
      nameError == null &&
      durationError == null &&
      minutes != '00' &&
      seconds != '00';
}
