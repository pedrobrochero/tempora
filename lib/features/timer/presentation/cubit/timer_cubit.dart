import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/timer.dart';
import '../../domain/usecases/show_notification.dart';

part 'timer_cubit.freezed.dart';
part 'timer_state.dart';

/// A [Cubit] that manages the state of a timer.
class TimerCubit extends Cubit<TimerState> {
  TimerCubit({
    required this.timer,
    required this.showNotification,
  }) : super(TimerState(
          duration: timer.duration,
          remainingSeconds: timer.duration.inSeconds,
        ));
  final CustomTimer timer;
  final ShowNotification showNotification;

  /// Starts the timer.
  void startTimer() async {
    emit(
      state.copyWith(
        timer: Timer.periodic(const Duration(seconds: 1), (timer) {
          tick();
        }),
      ),
    );
  }

  /// Pauses the timer if it is running, or resets it if it is finished.
  void pauseTimer() {
    if (state.isFinished) {
      resetTimer();
      return;
    }
    state.timer?.cancel();
    emit(state.copyWith(timer: null));
  }

  /// Resets the timer to its initial state.
  void resetTimer() {
    state.timer?.cancel();
    emit(state.copyWith(
      timer: null,
      remainingSeconds: state.duration.inSeconds,
    ));
  }

  /// Decrements the remaining seconds by one.
  void tick() {
    final remainingSeconds = state.remainingSeconds - 1;
    emit(state.copyWith(remainingSeconds: remainingSeconds));
    if (remainingSeconds == 0) {
      onTimerFinished();
    }
  }

  void onTimerFinished() {
    showNotification(timer);
  }

  @override
  Future<void> close() {
    state.timer?.cancel();
    return super.close();
  }
}
