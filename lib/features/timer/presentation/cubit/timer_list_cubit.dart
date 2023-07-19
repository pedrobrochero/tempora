import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/usecase.dart';
import '../../../../core/dependency_injection.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../../domain/usecases/delete_timer.dart';
import '../../domain/usecases/get_timers.dart';
import 'timer_cubit.dart';

part 'timer_list_cubit.freezed.dart';
part 'timer_list_state.dart';

/// A [Cubit] that manages the state of a list of timers.
class TimerListCubit extends Cubit<TimerListState> {
  TimerListCubit({
    required this.getTimers,
    required this.createTimer,
    required this.deleteTimer,
  }) : super(const TimerListState()) {
    getInitialData();
  }

  /// A use case to get a list of timers.
  @visibleForTesting
  final GetTimers getTimers;

  /// A use case to create a timer.
  @visibleForTesting
  final CreateTimer createTimer;

  /// A use case to delete a timer.
  @visibleForTesting
  final DeleteTimer deleteTimer;

  void getInitialData() async {
    (await getTimers(const NoParams())).fold(
      (failure) => emit(state.copyWith()),
      (timers) => emit(state.copyWith(timers: timers)),
    );
  }

  void createTimerAction(CreateTimerParams params) async {
    (await createTimer(params)).fold(
      (failure) => emit(state.copyWith()),
      (_) => getInitialData(),
    );
  }

  void deleteTimerAction(String id) async {
    final either = await deleteTimer(id);
    either.fold(
      (failure) {
        emit(state.copyWith());
      },
      (_) {
        getInitialData();
      },
    );
  }

  /// Returns a [TimerCubit] for a given [CustomTimer].
  /// If the [TimerCubit] doesn't exist, it will be created and added to the
  /// [TimerListCubit] state list.
  TimerCubit getTimerCubit(CustomTimer timer) {
    var cubit = state.timersCubits
        .firstWhereOrNull((element) => element.timer == timer);
    // If the cubit doesn't exist, create it and add it to the list.
    if (cubit == null) {
      cubit = sl<TimerCubit>(param1: timer);
      emit(state.copyWith(timersCubits: [...state.timersCubits, cubit]));
    }
    return cubit;
  }

  @override
  Future<void> close() async {
    await Future.wait(state.timersCubits.map((e) => e.close()));
    return super.close();
  }
}
