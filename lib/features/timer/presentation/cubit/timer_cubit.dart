import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/add_to_timer_count.dart';
import '../../domain/usecases/clear_notification.dart';
import '../../domain/usecases/play_timer_sound.dart';
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
    required this.playTimerSound,
  }) : super(TimerState(
          duration: timer.duration,
          remainingSeconds: timer.duration.inSeconds,
        ));
  final CustomTimer timer;

  AudioPlayer? player;

  /// The volume before the timer finished.
  double? volumeBackup;

  @visibleForTesting
  final ShowNotification showNotification;

  @visibleForTesting
  final ClearNotification clearNotification;

  @visibleForTesting
  final AddToTimerCount addToTimerCount;

  /// The use case to play the timer sound when it ends.
  @visibleForTesting
  final PlayTimerSound playTimerSound;

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
    player?.stop();
    // TODO(pedrobrochero): Usecase to set the volume.
    if (volumeBackup != null) {
      VolumeController().setVolume(
        volumeBackup!,
        showSystemUI: false,
      );
    }
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

  void onTimerFinished() async {
    showNotification(timer);
    (await playTimerSound(player)).fold(
      (l) => null,
      (r) => player = r,
    );
    // TODO(pedrobrochero): Usecase to set the volume.
    volumeBackup = await VolumeController().getVolume();
    VolumeController().setVolume(
      1,
      showSystemUI: false,
    );
  }

  @override
  Future<void> close() {
    state.ticker?.cancel();
    player?.dispose();
    return super.close();
  }
}
