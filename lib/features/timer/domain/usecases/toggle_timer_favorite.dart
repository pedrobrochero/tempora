import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/custom_timer.dart';
import '../repositories/timers_repository.dart';
import 'edit_timer.dart';

/// A use case to toggle a timer's favorite status.
class ToggleTimerFavorite implements UseCase<void, CustomTimer> {
  const ToggleTimerFavorite({
    required this.repository,
  });

  @visibleForTesting
  final TimersRepository repository;

  @override
  Future<Either<Failure, void>> call(CustomTimer timer) =>
      repository.editTimer(EditTimerParams(
        id: timer.id,
        isFavorite: !timer.isFavorite,
      ));
}
