import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../entities/custom_timer.dart';
import '../usecases/create_timer.dart';
import '../usecases/edit_timer.dart';

/// A repository for timers.
abstract class TimersRepository {
  /// Returns a list of [CustomTimer]s.
  Future<Either<Failure, List<CustomTimer>>> getTimers();

  /// Creates a new [CustomTimer] in the database.
  Future<Either<Failure, void>> createTimer(CreateTimerParams params);

  /// Deletes a [CustomTimer] from the database.
  Future<Either<Failure, void>> deleteTimer(String id);

  /// Edits a [CustomTimer] in the database.
  Future<Either<Failure, void>> editTimer(EditTimerParams params);

  /// Adds to the [CustomTimer]'s timesStarted count.
  Future<Either<Failure, void>> addToTimerCount(CustomTimer params);
}
