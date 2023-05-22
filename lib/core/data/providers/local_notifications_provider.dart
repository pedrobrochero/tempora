import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotificationsProvider {
  static const defaultNotificationChannelId = 'defaultNotificationChannelId';
  static const defaultNotificationChannelName =
      'defaultNotificationChannelName';

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
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    _plugin = FlutterLocalNotificationsPlugin();
    await _plugin!.initialize(initializationSettings);
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
    final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
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
