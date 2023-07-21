import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/control_classes/usecase.dart';
import '../../../../core/dependency_injection.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../../domain/usecases/delete_timer.dart';
import '../../domain/usecases/edit_timer.dart';
import '../../domain/usecases/get_timers.dart';
import 'timer_cubit.dart';

part 'timer_list_cubit.freezed.dart';
part 'timer_list_state.dart';

/// A [Cubit] that manages the state of a list of timers.
class TimerListCubit extends Cubit<TimerListState> {
  TimerListCubit({
    required this.getTimersUsecase,
    required this.createTimerUsecase,
    required this.deleteTimerUsecase,
    required this.editTimerUsecase,
  }) : super(const TimerListState()) {
    getInitialData();
  }

  /// A use case to get a list of timers.
  @visibleForTesting
  final GetTimers getTimersUsecase;

  /// A use case to create a timer.
  @visibleForTesting
  final CreateTimer createTimerUsecase;

  /// A use case to delete a timer.
  @visibleForTesting
  final DeleteTimer deleteTimerUsecase;

  /// A use case to edit a timer.
  @visibleForTesting
  final EditTimer editTimerUsecase;

  void getInitialData() async {
    (await getTimersUsecase(const NoParams())).fold(
      (failure) => emit(state.copyWith(status: const Status.error())),
      (timers) => emit(state.copyWith(
        timers: timers,
        status: const Status.loaded(),
      )),
    );
  }

  void createTimer(CreateTimerParams params) async {
    (await createTimerUsecase(params)).fold(
      (failure) => emit(state.copyWith(status: const Status.error())),
      (_) => getInitialData(),
    );
  }

  void deleteTimer(CustomTimer timer) async {
    final either = await deleteTimerUsecase(timer.id);
    either.fold(
      (failure) => emit(state.copyWith(status: const Status.error())),
      (_) {
        removeTimerCubit(timer);
        getInitialData();
      },
    );
  }

  void editTimer(CustomTimer timer) async {
    final either = await editTimerUsecase(timer);
    either.fold(
      (failure) => emit(state.copyWith(status: const Status.error())),
      (_) {
        removeTimerCubit(timer);
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

  /// Removes a [TimerCubit] from the [TimerListCubit] state list.
  void removeTimerCubit(CustomTimer timer) {
    final cubit = state.timersCubits
        .firstWhereOrNull((element) => element.timer.id == timer.id);
    cubit?.close();
    final newList = List<TimerCubit>.from(state.timersCubits)..remove(cubit);
    emit(state.copyWith(timersCubits: newList));
  }

  @override
  Future<void> close() async {
    await Future.wait(state.timersCubits.map((e) => e.close()));
    return super.close();
  }
}
