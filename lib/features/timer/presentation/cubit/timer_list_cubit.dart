import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/usecase.dart';
import '../../domain/entities/timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../../domain/usecases/get_timers.dart';

part 'timer_list_cubit.freezed.dart';
part 'timer_list_state.dart';

/// A [Cubit] that manages the state of a list of timers.
class TimerListCubit extends Cubit<TimerListState> {
  TimerListCubit({
    required this.getTimers,
    required this.createTimer,
  }) : super(const TimerListState()) {
    getInitialData();
  }

  final GetTimers getTimers;

  final CreateTimer createTimer;

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
}
