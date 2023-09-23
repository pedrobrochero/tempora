import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl_standalone.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../../../../core/data/providers/local_notifications_provider.dart';
import '../../../../generated/l10n.dart';
import '../entities/custom_timer.dart';

class ShowNotification implements UseCase<void, CustomTimer> {
  const ShowNotification({
    required this.notificationsProvider,
  });

  @visibleForTesting
  final LocalNotificationsProvider notificationsProvider;

  @override
  Future<Either<Failure, void>> call(CustomTimer timer) async {
    try {
      final s = await S.load(Locale(await findSystemLocale()));
      await notificationsProvider.requestPermission();
      await notificationsProvider.showNotification(
        id: timer.id.hashCode,
        androidChannelId: LocalNotificationsProvider.timerEndedChannel,
        androidChannelName: LocalNotificationsProvider.timerEndedChannel,
        title: s.somethingEnded(
          timer.name.isNotEmpty ? timer.name : S.current.timer,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e));
    }
  }
}
