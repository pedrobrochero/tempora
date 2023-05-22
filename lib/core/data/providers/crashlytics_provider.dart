import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Run code logging error through crashlytics.
///
/// It catchs Flutter framework errors (sync and async) and outside  flutter
/// errors.
/// Must call [Firebase.initializeApp] prior this.
void runWithCrashlytics(Future<void> Function() function) {
  if (kReleaseMode) {
    // Log Flutter framework errors.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // Log async errors.
    runZonedGuarded<Future<void>>(
      function,
      (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
    );
    // Catch errors outside of Flutter.
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        fatal: true,
      );
    }).sendPort);
  } else {
    function();
  }
}

/// Logs an error to crashlytics.
///
/// Only works if running in release mode.
void recordErrorToCrashlytics(Object error) {
  if (kReleaseMode) {
    FirebaseCrashlytics.instance.recordError(
      error,
      StackTrace.current,
    );
  }
}
