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
import '../../domain/usecases/toggle_timer_favorite.dart';
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
    required this.toggleTimerFavoriteUsecase,
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

  /// A use case to toggle a timer's favorite status.
  @visibleForTesting
  final ToggleTimerFavorite toggleTimerFavoriteUsecase;

  /// A list of [TimerCubit]s created from [CustomTimer]s in the state.
  List<TimerCubit> timersCubits = [];

  @override
  Future<void> close() async {
    await Future.wait(timersCubits.map((e) => e.close()));
    return super.close();
  }

  void getInitialData() async {
    (await getTimersUsecase(const NoParams())).fold(
      (failure) => emit(state.copyWith(status: const Status.error())),
      (timers) => emit(
        state.copyWith(
          timers: timers.sorted(state.sorting.sortingFunction),
          status: const Status.loaded(),
        ),
      ),
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

  void editTimer(EditTimerParams params) async {
    final either = await editTimerUsecase(params);
    either.fold(
      (failure) => emit(state.copyWith(status: const Status.error())),
      (_) {
        final timer =
            state.timers.firstWhere((element) => element.id == params.id);
        removeTimerCubit(timer);
        getInitialData();
      },
    );
  }

  void toggleFavorite(CustomTimer timer) async {
    (await toggleTimerFavoriteUsecase(timer)).fold(
      (failure) {
        emit(state.copyWith(status: const Status.error()));
      },
      (_) async {
        removeTimerCubit(timer);
        getInitialData();
      },
    );
  }

  /// Returns a [TimerCubit] for a given [CustomTimer].
  /// If the [TimerCubit] doesn't exist, it will be created and added to the
  /// [TimerListCubit] state list.
  TimerCubit getTimerCubit(CustomTimer timer) {
    var cubit = timersCubits
        .firstWhereOrNull((element) => element.timer.id == timer.id);
    // If the cubit doesn't exist, create it and add it to the list.
    if (cubit == null) {
      cubit = sl<TimerCubit>(param1: timer);
      timersCubits.add(cubit);
    }
    return cubit;
  }

  /// Removes a [TimerCubit] from the [TimerListCubit] state list.
  void removeTimerCubit(CustomTimer timer) {
    final cubit = timersCubits
        .firstWhereOrNull((element) => element.timer.id == timer.id);
    cubit?.close();
    timersCubits.remove(cubit);
  }

  /// Sorts the timers by a given [TimerSorting]. If the [TimerSorting] is the
  /// same as the current one, it will reverse the order.
  void sort(TimerSorting result) {
    var newTimers =
        <CustomTimer>[...state.timers].sorted(result.sortingFunction);

    final isReversed = state.sorting == result && !state.reverseSorting;
    if (isReversed) {
      newTimers = newTimers.reversed.toList();
    }

    // TODO(pedrobrochero): Save sorting in sharedPrefs.

    emit(state.copyWith(
      sorting: result,
      reverseSorting: isReversed,
      timers: newTimers,
    ));
  }
}
