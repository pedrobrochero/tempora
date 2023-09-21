import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/add_to_timer_count.dart';
import '../../domain/usecases/clear_notification.dart';
import '../../domain/usecases/show_notification.dart';

part 'timer_cubit.freezed.dart';
part 'timer_state.dart';

/// A [Cubit] that manages the state of a timer.
class TimerCubit extends Cubit<TimerState> {
  TimerCubit({
    required this.timer,
    required this.showNotification,
    required this.clearNotification,
    required this.addToTimerCount,
  }) : super(TimerState(
          duration: timer.duration,
          remainingSeconds: timer.duration.inSeconds,
        ));
  final CustomTimer timer;
  final ShowNotification showNotification;
  final ClearNotification clearNotification;
  final AddToTimerCount addToTimerCount;

  /// Starts the timer.
  void startTimer() async {
    addToTimerCount(timer);
    emit(
      state.copyWith(
        ticker: Timer.periodic(const Duration(seconds: 1), (timer) {
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
    state.ticker?.cancel();
    emit(state.copyWith(ticker: null));
  }

  /// Resets the timer to its initial state.
  void resetTimer() {
    state.ticker?.cancel();
    emit(state.copyWith(
      ticker: null,
      remainingSeconds: state.duration.inSeconds,
    ));
    clearNotification(timer);
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
    state.ticker?.cancel();
    return super.close();
  }
}
