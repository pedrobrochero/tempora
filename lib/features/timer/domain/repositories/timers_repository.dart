import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../entities/timer.dart';
import '../usecases/create_timer.dart';

/// A repository for timers.
abstract class TimersRepository {
  Future<Either<Failure, List<CustomTimer>>> getTimers();
  Future<Either<Failure, void>> createTimer(CreateTimerParams params);
}
