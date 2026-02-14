import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Callback invoked when the user taps a local notification.
///
/// The [payload] is the JSON-encoded notification data map.
typedef NotificationTapCallback = void Function(String? payload);

/// Helper for displaying local notifications and managing Android channels.
///
/// ## Native Setup Required
///
/// **Android:**
/// - Add `google-services.json` to `android/app/`.
/// - In `android/app/src/main/AndroidManifest.xml`, add:
///   ```xml
///   <meta-data android:name=
///     "com.google.firebase.messaging
///       .default_notification_channel_id"
///     android:value="work_items" />
///   ```
/// - Ensure `minSdkVersion` >= 21 in `android/app/build.gradle`.
///
/// **iOS:**
/// - Add `GoogleService-Info.plist` to the Xcode project under `Runner/`.
/// - Enable Push Notifications capability in Xcode.
/// - Enable Background Modes > Remote notifications in Xcode.
class LocalNotificationHelper {
  LocalNotificationHelper({
    FlutterLocalNotificationsPlugin? plugin,
  }) : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

  /// Initializes the local notification plugin for both platforms.
  ///
  /// [onTap] is invoked when the user taps a notification.
  Future<void> initialize({NotificationTapCallback? onTap}) async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        onTap?.call(response.payload);
      },
    );
  }

  /// Creates Android notification channels for different notification types.
  ///
  /// Must be called after [initialize] on Android only.
  Future<void> createChannels() async {
    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin == null) return;

    const channels = [
      AndroidNotificationChannel(
        'work_items',
        'Work Items',
        description: 'Notifications for work item updates',
        importance: Importance.high,
      ),
      AndroidNotificationChannel(
        'comments',
        'Comments',
        description: 'Notifications for new comments',


      ),
      AndroidNotificationChannel(
        'cycles',
        'Cycles',
        description: 'Notifications for cycle updates',


      ),
      AndroidNotificationChannel(
        'general',
        'General',
        description: 'General notifications',


      ),
    ];

    for (final channel in channels) {
      await androidPlugin.createNotificationChannel(channel);
    }
  }

  /// Displays a local notification with the given [title], [body], and
  /// optional [payload] data.
  ///
  /// The [channelId] determines the Android notification channel.
  /// Defaults to `'general'`.
  Future<void> showNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
    String channelId = 'general',
  }) async {
    final androidDetails = AndroidNotificationDetails(
      channelId,
      _channelName(channelId),
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Encode payload as JSON string so it can be recovered on tap.
    final payloadString =
        payload != null ? jsonEncode(payload) : null;

    await _plugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
      payload: payloadString,
    );
  }

  /// Maps a channel ID to a human-readable name.
  static String _channelName(String channelId) {
    switch (channelId) {
      case 'work_items':
        return 'Work Items';
      case 'comments':
        return 'Comments';
      case 'cycles':
        return 'Cycles';
      default:
        return 'General';
    }
  }

  @visibleForTesting
  FlutterLocalNotificationsPlugin get plugin => _plugin;
}
