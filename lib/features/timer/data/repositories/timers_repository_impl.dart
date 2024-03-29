import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/data/providers/uuid_provider.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/repositories/timers_repository.dart';
import '../../domain/usecases/create_timer.dart';
import '../../domain/usecases/edit_timer.dart';
import '../datasources/timers_local_data_source.dart';

/// A repository for timers.
class TimersRepositoryImpl implements TimersRepository {
  TimersRepositoryImpl(this.localDataSource);

  /// A local data source for timers.
  final TimersLocalDataSource localDataSource;

  /// A provider for uuid.
  final UuidProvider uuidProvider = UuidProviderImpl();

  @override
  Future<Either<Failure, List<CustomTimer>>> getTimers() async {
    try {
      final timers = await localDataSource.getTimers();
      return Right(timers);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> createTimer(CreateTimerParams params) async {
    try {
      await localDataSource.createTimer(
        id: uuidProvider.v4,
        params: params,
      );
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTimer(String id) async {
    try {
      await localDataSource.deleteTimer(id);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> editTimer(EditTimerParams params) async {
    try {
      await localDataSource.editTimer(params);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> addToTimerCount(CustomTimer params) async {
    try {
      await localDataSource.addToTimerCount(params);
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }
}
