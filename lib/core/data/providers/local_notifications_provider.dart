import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../presentation/utils/theme.dart';

abstract class LocalNotificationsProvider {
  static const timerEndedChannel = 'TimerEnded';

  /// Requests permission to show notifications.
  Future<void> requestPermission();

  /// Shows a notification.
  Future<void> showNotification({
    /// Identifier, is duplicated, last notification will replace older
    required int id,

    /// Necessary to show on android
    required String androidChannelId,

    /// Necessary to show on android
    required String androidChannelName,
    required String title,
    String? body,
  });

  /// Clears a notification.
  Future<void> clear(int id);

  Future<void> clearAll();
}

class LocalNotificationsProviderImpl implements LocalNotificationsProvider {
  // Lazy initialization, singleton for plugin
  static FlutterLocalNotificationsPlugin? _plugin;

  static Future<FlutterLocalNotificationsPlugin> get plugin async {
    if (_plugin != null) {
      return _plugin!;
    }
    // Android settings
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // Ios settings
    const initializationSettingsIOS = DarwinInitializationSettings();

    _plugin = FlutterLocalNotificationsPlugin();
    await _plugin!.initialize(const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    ));
    return _plugin!;
  }

  @override
  Future<void> clearAll() async => (await plugin).cancelAll();

  @override
  Future<void> showNotification({
    required int id,
    required String title,
    required String androidChannelId,
    required String androidChannelName,
    String? body,
  }) async {
    // TODO(pedrobrochero): Test this vibration pattern.
    final vibrationPattern = Int64List.fromList([
      0,
      10000,
      5000,
      2000,
    ]);

    final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
      fullScreenIntent: true,
      visibility: NotificationVisibility.public,
      priority: Priority.max,
      importance: Importance.high,
      playSound: false,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      usesChronometer: true,
      additionalFlags: Int32List.fromList(<int>[
        4, // Insistent flag from https://developer.android.com/reference/android/app/Notification.html#FLAG_INSISTENT
      ]),
      vibrationPattern: vibrationPattern,
      enableLights: true,
      ledColor: primaryThemeColor,
      ledOnMs: 1000,
      ledOffMs: 500,
    ));
    await (await plugin).show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  @override
  Future<void> requestPermission() async {
    await (await plugin)
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  @override
  Future<void> clear(int id) async {
    (await plugin).cancel(id);
  }
}
