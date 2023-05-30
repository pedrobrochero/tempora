import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/status.dart';

part 'timer_form_cubit.freezed.dart';
part 'timer_form_state.dart';

/// Cubit for the timer form.
class TimerFormCubit extends Cubit<TimerFormState> {
  TimerFormCubit() : super(const TimerFormState());

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setMinutes(String minutes) {
    final durationError = getDurationError(minutesString: minutes);
    emit(state.copyWith(
      durationError: durationError,
      minutes: minutes,
    ));
  }

  void setSeconds(String seconds) {
    final durationError = getDurationError(secondsString: seconds);
    emit(state.copyWith(
      durationError: durationError,
      seconds: seconds,
    ));
  }

  String? getDurationError({
    String? minutesString,
    String? secondsString,
  }) {
    final minutes = int.tryParse(minutesString ?? state.minutes);
    final seconds = int.tryParse(secondsString ?? state.seconds);
    if (minutes == null || seconds == null) {
      return 'Invalid duration';
    } else if (minutes < 0 || seconds < 0) {
      return 'Duration must be positive';
    }
    return null;
  }

  void submit() {
    if (!state.isValid) return;
    emit(state.copyWith(status: const Status.success()));
  }
}
