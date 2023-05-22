// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  if (sl.isRegistered<_InitChecker>()) {
    return;
  }

  //! Plugin interfaces AKA providers

  //! Initialization flag
  sl.registerSingleton(_InitChecker());
}

class _InitChecker {}
