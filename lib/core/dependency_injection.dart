// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';

import '../features/timer/data/datasources/timers_local_data_source.dart';
import '../features/timer/data/repositories/timers_repository_impl.dart';
import '../features/timer/domain/repositories/timers_repository.dart';
import '../features/timer/domain/usecases/get_timers.dart';
import '../features/timer/presentation/cubit/timer_list_cubit.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  if (sl.isRegistered<_InitChecker>()) {
    return;
  }

  //! Feature: Timers
  // Bloc
  sl.registerFactory(() => TimerListCubit(getTimers: sl()));
  // Usecases
  sl.registerLazySingleton(() => GetTimers(repository: sl()));
  // Repos
  sl.registerLazySingleton<TimersRepository>(
    () => TimersRepositoryImpl(sl()),
  );
  // Data sources
  sl.registerLazySingleton<TimersLocalDataSource>(
      () => FakeTimersLocalDataSource());

  //! Plugin interfaces AKA providers

  //! Initialization flag
  sl.registerSingleton(_InitChecker());
}

class _InitChecker {}
