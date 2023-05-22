import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/timer.dart';
import '../repositories/timers_repository.dart';

/// Returns a list of [CustomTimer]s.
class GetTimers implements UseCase<List<CustomTimer>, NoParams> {
  const GetTimers({
    required this.repository,
  });

  @visibleForTesting
  final TimersRepository repository;

  @override
  Future<Either<Failure, List<CustomTimer>>> call(NoParams params) =>
      repository.getTimers();
}
