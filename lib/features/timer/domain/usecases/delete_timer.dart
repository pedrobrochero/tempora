import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../repositories/timers_repository.dart';

/// A use case to delete a timer.
class DeleteTimer implements UseCase<void, String> {
  const DeleteTimer({
    required this.repository,
  });

  @visibleForTesting
  final TimersRepository repository;

  @override
  Future<Either<Failure, void>> call(String id) => repository.deleteTimer(id);
}
