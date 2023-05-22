import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../repositories/timers_repository.dart';

class CreateTimer implements UseCase<void, CreateTimerParams> {
  const CreateTimer({
    required this.repository,
  });

  @visibleForTesting
  final TimersRepository repository;

  @override
  Future<Either<Failure, void>> call(CreateTimerParams params) =>
      repository.createTimer(params);
}

class CreateTimerParams {
  CreateTimerParams({
    required this.name,
    required this.duration,
  });

  final String name;
  final Duration duration;
}
