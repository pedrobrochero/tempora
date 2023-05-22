// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';

import '../features/timer/data/datasources/timers_local_data_source.dart';
import '../features/timer/data/repositories/timers_repository_impl.dart';
import '../features/timer/domain/entities/timer.dart';
import '../features/timer/domain/repositories/timers_repository.dart';
import '../features/timer/domain/usecases/get_timers.dart';
import '../features/timer/domain/usecases/show_notification.dart';
import '../features/timer/presentation/cubit/timer_cubit.dart';
import '../features/timer/presentation/cubit/timer_list_cubit.dart';
import 'data/providers/local_notifications_provider.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  if (sl.isRegistered<_InitChecker>()) {
    return;
  }

  //! Feature: Timers
  // Bloc
  sl.registerFactory(() => TimerListCubit(getTimers: sl()));
  sl.registerFactoryParam<TimerCubit, CustomTimer, dynamic>(
      (timer, _) => TimerCubit(
            timer: timer,
            showNotification: sl(),
          ));
  // Usecases
  sl.registerLazySingleton(() => GetTimers(repository: sl()));
  sl.registerLazySingleton(() => ShowNotification(notificationsProvider: sl()));
  // Repos
  sl.registerLazySingleton<TimersRepository>(
    () => TimersRepositoryImpl(sl()),
  );
  // Data sources
  sl.registerLazySingleton<TimersLocalDataSource>(
      () => FakeTimersLocalDataSource());

  //! Plugin interfaces AKA providers
  sl.registerLazySingleton<LocalNotificationsProvider>(
      () => LocalNotificationsProviderImpl());

  //! Initialization flag
  sl.registerSingleton(_InitChecker());
}

class _InitChecker {}
