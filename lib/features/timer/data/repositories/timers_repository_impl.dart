import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/data/providers/uuid_provider.dart';
import '../../domain/entities/timer.dart';
import '../../domain/repositories/timers_repository.dart';
import '../../domain/usecases/create_timer.dart';
import '../datasources/timers_local_data_source.dart';

/// A repository for timers.
class TimersRepositoryImpl implements TimersRepository {
  TimersRepositoryImpl(this.localDataSource);

  /// A local data source for timers.
  final TimersLocalDataSource localDataSource;

  /// A provider for uuid.
  final UuidProvider uuidProvider = UuidProviderImpl();

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

  /// Creates a new [CustomTimer] in the database.
  @override
  Future<Either<Failure, void>> createTimer(CreateTimerParams params) async {
    try {
      final timer = CustomTimer(
        id: uuidProvider.v4,
        name: params.name,
        duration: params.duration,
      );
      await localDataSource.createTimer(timer);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }

  /// Deletes a [CustomTimer] from the database.
  @override
  Future<Either<Failure, void>> deleteTimer(String id) async {
    try {
      await localDataSource.deleteTimer(id);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }
}
