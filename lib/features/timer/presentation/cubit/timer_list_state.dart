part of 'timer_list_cubit.dart';

@freezed
class TimerListState with _$TimerListState {
  const factory TimerListState({
    @Default(Status.loading()) Status status,
    @Default([]) List<CustomTimer> timers,
    @Default([]) List<TimerCubit> timersCubits,
    @Default(TimerSorting.name) TimerSorting sorting,
    @Default(false) bool reverseSorting,
  }) = _TimerListState;
}
