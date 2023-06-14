import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../timer/domain/entities/timer.dart';

part 'foreground_service_cubit.freezed.dart';
part 'foreground_service_state.dart';

class ForegroundServiceCubit extends Cubit<ForegroundServiceState> {
  ForegroundServiceCubit() : super(const ForegroundServiceState());

  static const _androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: 'Timer(s) running...',
    // notificationIcon: AndroidResource(
    //     name: 'background_icon'), // Default is ic_launcher from folder mipmap
  );

  /// Adds a [CustomTimer] to the list of active timers.
  /// Enables background service if not already on.
  void addTimer(CustomTimer timer) async {
    print('Adding timer ${timer.name}');
    final success =
        await FlutterBackground.initialize(androidConfig: _androidConfig);
    if (!success) {
      print('Failed to initialize FlutterBackground');
      return;
    }
    emit(state.copyWith(activeTimers: state.activeTimers + [timer]));
    if (!FlutterBackground.isBackgroundExecutionEnabled) {
      final result = await FlutterBackground.enableBackgroundExecution();
      print('Background execution enabled: $result');
    }
  }

  /// Removes a [CustomTimer] from the list of active timers.
  /// Disables background service if no active timers remain.
  void removeTimer(CustomTimer timer) async {
    final newList = state.activeTimers.toList()..remove(timer);
    if (newList.isEmpty) {
      print('No active timers remaining, disabling background execution');
      await FlutterBackground.disableBackgroundExecution();
    }
    emit(state.copyWith(activeTimers: newList));
  }
}
