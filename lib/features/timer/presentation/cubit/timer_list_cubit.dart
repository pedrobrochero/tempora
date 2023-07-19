import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/usecase.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../../domain/usecases/delete_timer.dart';
import '../../domain/usecases/get_timers.dart';

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
}
