part of 'timer_form_cubit.dart';

@freezed
class TimerFormState with _$TimerFormState {
  const factory TimerFormState({
    @Default(InitialStatus()) Status status,
    @Default('') String name,
    String? nameError,
    @Default('') String seconds,
    @Default('') String minutes,
    String? durationError,
  }) = _Initial;

  const TimerFormState._();

  /// Returns true if the form is valid.
  bool get isValid =>
      nameError == null &&
      durationError == null &&
      (minutes != '' || seconds != '');
}
