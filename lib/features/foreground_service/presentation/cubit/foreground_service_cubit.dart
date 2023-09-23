import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../timer/domain/entities/custom_timer.dart';

part 'foreground_service_cubit.freezed.dart';
part 'foreground_service_state.dart';

class ForegroundServiceCubit extends Cubit<ForegroundServiceState> {
  ForegroundServiceCubit() : super(const ForegroundServiceState());

  static const _androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: 'Timer(s) running...',
    // notificationIcon: AndroidResource(
    //     name: 'background_icon'), // Default is ic_launcher from folder mipmap
    notificationIcon: AndroidResource(name: 'background_icon'),
  );

  /// Adds a [CustomTimer] id to the list of active timers.
  /// Enables background service if not already on.
  void addTimer(String timerId) async {
    final success =
        await FlutterBackground.initialize(androidConfig: _androidConfig);
    if (!success) {
      return;
    }
    emit(state.copyWith(activeTimerIds: state.activeTimerIds + [timerId]));
    if (!FlutterBackground.isBackgroundExecutionEnabled) {
      await FlutterBackground.enableBackgroundExecution();
    }
  }

  /// Removes a [CustomTimer] from the list of active timers.
  /// Disables background service if no active timers remain.
  void removeTimer(String timerId) async {
    final newList = state.activeTimerIds.toList()..remove(timerId);
    if (newList.isEmpty && FlutterBackground.isBackgroundExecutionEnabled) {
      await FlutterBackground.disableBackgroundExecution();
    }
    emit(state.copyWith(activeTimerIds: newList));
  }
}
