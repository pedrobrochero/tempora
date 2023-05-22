import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../../../../core/data/providers/local_notifications_provider.dart';
import '../entities/timer.dart';

class ShowNotification implements UseCase<void, CustomTimer> {
  const ShowNotification({
    required this.notificationsProvider,
  });

  @visibleForTesting
  final LocalNotificationsProvider notificationsProvider;

  @override
  Future<Either<Failure, void>> call(CustomTimer timer) async {
    try {
      await notificationsProvider.requestPermission();
      await notificationsProvider.showNotification(
        id: timer.id.hashCode,
        androidChannelId:
            LocalNotificationsProvider.defaultNotificationChannelId,
        androidChannelName:
            LocalNotificationsProvider.defaultNotificationChannelName,
        title: '${timer.name} ended',
      );
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }
}
