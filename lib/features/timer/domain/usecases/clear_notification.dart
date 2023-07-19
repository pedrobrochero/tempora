import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../../../../core/data/providers/local_notifications_provider.dart';
import '../entities/custom_timer.dart';

class ClearNotification implements UseCase<void, CustomTimer> {
  const ClearNotification({
    required this.provider,
  });

  @visibleForTesting
  final LocalNotificationsProvider provider;

  @override
  Future<Either<Failure, void>> call(CustomTimer timer) async {
    await provider.clear(timer.id.hashCode);
    return const Right(null);
  }
}
