import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../domain/entities/timer.dart';
import '../../domain/repositories/timers_repository.dart';
import '../datasources/timers_local_data_source.dart';

class TimersRepositoryImpl implements TimersRepository {
  TimersRepositoryImpl(this.localDataSource);

  final TimersLocalDataSource localDataSource;

  /// Returns a list of [CustomTimer]s.
  ///
  /// If something goes wrong, a [Failure] is returned.
  @override
  Future<Either<Failure, List<CustomTimer>>> getTimers() async {
    try {
      final timers = await localDataSource.getTimers();
      return Right(timers);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }
}
