import '../data/providers/crashlytics_provider.dart';
import '../misc/logging/logging.dart';

/// [Failure] are handled exceptions, define inside features, not here.
abstract class Failure with Logging {
  Failure() {
    printStacktrace();
  }

  void printStacktrace() {
    log.e(runtimeType);
  }
}

class UnknownFailure extends Failure {
  UnknownFailure(this.error) : super() {
    recordErrorToCrashlytics(error);
  }

  final Object error;

  @override
  void printStacktrace() {
    log.e(error);
  }
}

class ParsingFailure extends Failure {
  ParsingFailure(this.error) : super();
  final Object error;

  @override
  void printStacktrace() {
    log.e(error);
  }
}

class UnexpectedTypeFailure extends Failure {
  UnexpectedTypeFailure(this.objectType) : super();
  final String objectType;

  @override
  void printStacktrace() {
    log.e('Type: $objectType');
  }
}
