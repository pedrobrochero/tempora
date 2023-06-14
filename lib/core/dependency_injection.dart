// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';

import '../features/foreground_service/presentation/cubit/foreground_service_cubit.dart';
import '../features/timer/data/datasources/timers_local_data_source.dart';
import '../features/timer/data/repositories/timers_repository_impl.dart';
import '../features/timer/domain/entities/timer.dart';
import '../features/timer/domain/repositories/timers_repository.dart';
import '../features/timer/domain/usecases/clear_notification.dart';
import '../features/timer/domain/usecases/create_timer.dart';
import '../features/timer/domain/usecases/delete_timer.dart';
import '../features/timer/domain/usecases/get_timers.dart';
import '../features/timer/domain/usecases/show_notification.dart';
import '../features/timer/presentation/cubit/timer_cubit.dart';
import '../features/timer/presentation/cubit/timer_list_cubit.dart';
import 'data/datasources/timers_sqlite_db.dart';
import 'data/providers/local_notifications_provider.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  if (sl.isRegistered<_InitChecker>()) {
    return;
  }

  //! Feature: Timers
  // Bloc
  sl.registerFactory(() => TimerListCubit(
        getTimers: sl(),
        createTimer: sl(),
        deleteTimer: sl(),
      ));
  sl.registerFactoryParam<TimerCubit, CustomTimer, dynamic>(
      (timer, _) => TimerCubit(
            timer: timer,
            showNotification: sl(),
            clearNotification: sl(),
          ));
  // Usecases
  sl.registerLazySingleton(() => GetTimers(repository: sl()));
  sl.registerLazySingleton(() => ShowNotification(notificationsProvider: sl()));
  sl.registerLazySingleton(() => ClearNotification(provider: sl()));
  sl.registerLazySingleton(() => CreateTimer(repository: sl()));
  sl.registerLazySingleton(() => DeleteTimer(repository: sl()));
  // Repos
  sl.registerLazySingleton<TimersRepository>(
    () => TimersRepositoryImpl(sl()),
  );
  // Data sources
  sl.registerLazySingleton<TimersLocalDataSource>(
      () => TimersLocalDataSourceImpl(sl()));

  //! Feature: Foreground service
  // Bloc
  sl.registerLazySingleton(() => ForegroundServiceCubit());
  // Usecases
  // Repos
  // Data sources

  //! Plugin interfaces AKA providers
  sl.registerLazySingleton<LocalNotificationsProvider>(
      () => LocalNotificationsProviderImpl());
  sl.registerLazySingleton(() => TimersSqliteProvider());

  //! Initialization flag
  sl.registerSingleton(_InitChecker());
}

class _InitChecker {}
