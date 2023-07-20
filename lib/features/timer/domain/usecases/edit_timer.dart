import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/custom_timer.dart';
import '../repositories/timers_repository.dart';

/// Edits a [CustomTimer].
class EditTimer implements UseCase<void, CustomTimer> {
  const EditTimer({
    required this.repository,
  });

  @visibleForTesting
  final TimersRepository repository;

  @override
  Future<Either<Failure, void>> call(CustomTimer timer) =>
      repository.editTimer(timer);
}
