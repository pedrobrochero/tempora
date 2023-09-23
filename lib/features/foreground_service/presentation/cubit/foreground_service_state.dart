part of 'foreground_service_cubit.dart';

@freezed
class ForegroundServiceState with _$ForegroundServiceState {
  const factory ForegroundServiceState({
    @Default([]) List<String> activeTimerIds,
  }) = _Initial;
}
