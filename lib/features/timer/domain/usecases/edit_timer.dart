import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/custom_timer.dart';
import '../repositories/timers_repository.dart';

/// Edits a [CustomTimer].
class EditTimer implements UseCase<void, EditTimerParams> {
  const EditTimer({
    required this.repository,
  });

  @visibleForTesting
  final TimersRepository repository;

  @override
  Future<Either<Failure, void>> call(EditTimerParams params) {
    if (params.hasNoChanges) {
      return Future.value(const Right(null));
    }
    return repository.editTimer(params);
  }
}

/// The parameters for [EditTimer].
class EditTimerParams {
  const EditTimerParams({
    required this.id,
    this.name,
    this.duration,
    this.isFavorite,
    this.timesStarted,
  });

  final String id;
  final String? name;
  final Duration? duration;
  final bool? isFavorite;
  final int? timesStarted;

  bool get hasNoChanges =>
      name == null &&
      duration == null &&
      isFavorite == null &&
      timesStarted == null;
}
