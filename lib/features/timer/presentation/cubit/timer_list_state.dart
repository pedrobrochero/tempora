part of 'timer_list_cubit.dart';

@freezed
class TimerListState with _$TimerListState {
  const factory TimerListState({
    @Default([]) List<CustomTimer> timers,
    @Default([]) List<TimerCubit> timersCubits,
  }) = _TimerListState;
}
