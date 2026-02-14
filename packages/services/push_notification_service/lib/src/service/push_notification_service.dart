import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:push_notification_service/src/service/local_notification_helper.dart';
import 'package:push_notification_service/src/service/notification_router.dart';

/// Top-level handler for background FCM messages.
///
/// Must be a top-level function (not a closure or instance method) so that
/// it can be called by the platform even when the app is terminated.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase must be initialized for background handlers.
  try {
    await Firebase.initializeApp();
  } on Exception catch (_) {
    // Firebase may already be initialized; ignore.
  }
  developer.log(
    'Background message received: ${message.messageId}',
    name: 'PushNotificationService',
  );
}

/// Central service for push notification handling.
///
/// Wraps [FirebaseMessaging] for FCM token management, permission requests,
/// and message streams. Uses [LocalNotificationHelper] to display foreground
/// notifications and [NotificationRouter] to map tap payloads to routes.
///
/// ## Native Setup Required
///
/// **Android:**
/// 1. Place `google-services.json` in `android/app/`.
/// 2. Add the Google Services plugin to `android/build.gradle`:
///    ```groovy
///    classpath 'com.google.gms:google-services:4.4.2'
///    ```
/// 3. Apply the plugin in `android/app/build.gradle`:
///    ```groovy
///    apply plugin: 'com.google.gms.google-services'
///    ```
///
/// **iOS:**
/// 1. Add `GoogleService-Info.plist` to the Xcode project under `Runner/`.
/// 2. Enable Push Notifications in Xcode > Signing & Capabilities.
/// 3. Enable Background Modes > Remote notifications.
/// 4. Upload APNs key to Firebase Console > Project Settings > Cloud Messaging.
///
/// ## Graceful Degradation
///
/// If Firebase is not configured (e.g., missing `google-services.json`),
/// [initialize] catches the error, logs a warning, and returns normally.
/// The app continues to function without push notifications.
class PushNotificationService {
  PushNotificationService({
    LocalNotificationHelper? localNotificationHelper,
    NotificationRouter? notificationRouter,
  })  : _localHelper = localNotificationHelper ?? LocalNotificationHelper(),
        _notificationRouter = notificationRouter ?? const NotificationRouter();

  final LocalNotificationHelper _localHelper;
  final NotificationRouter _notificationRouter;

  FirebaseMessaging? _messaging;
  bool _initialized = false;

  final _tokenController = StreamController<String>.broadcast();
  final _routeController = StreamController<String>.broadcast();

  /// Stream of FCM token updates.
  ///
  /// Listen to this stream to send the token to the Plane backend whenever
  /// it changes (e.g., after first registration or token refresh).
  Stream<String> get onTokenRefresh => _tokenController.stream;

  /// Stream of GoRouter paths derived from notification taps.
  ///
  /// The app should listen to this stream and navigate to the emitted path
  /// whenever a notification is tapped (either from a local foreground
  /// notification or an FCM background notification).
  Stream<String> get onNotificationRoute => _routeController.stream;

  /// Whether the service was successfully initialized with Firebase.
  bool get isInitialized => _initialized;

  /// Initializes Firebase, requests notification permissions, retrieves the
  /// initial FCM token, and sets up message listeners.
  ///
  /// Catches [PlatformException] and [FirebaseException] so the app can
  /// start normally even if Firebase is not configured.
  Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
    } on PlatformException catch (e) {
      developer.log(
        'Firebase not configured, push notifications disabled: $e',
        name: 'PushNotificationService',
        level: 900, // WARNING
      );
      return;
    } on FirebaseException catch (e) {
      developer.log(
        'Firebase initialization failed, push notifications disabled: $e',
        name: 'PushNotificationService',
        level: 900,
      );
      return;
    } on Exception catch (e) {
      developer.log(
        'Unexpected error initializing Firebase: $e',
        name: 'PushNotificationService',
        level: 900,
      );
      return;
    }

    _messaging = FirebaseMessaging.instance;

    // Request permission (iOS shows a dialog; Android auto-grants).
    await _requestPermission();

    // Initialize local notification display.
    await _localHelper.initialize(onTap: _handleLocalNotificationTap);
    await _localHelper.createChannels();

    // Register the background handler.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Get initial token.
    try {
      final token = await _messaging!.getToken();
      if (token != null) {
        _tokenController.add(token);
      }
    } on Exception catch (e) {
      developer.log(
        'Failed to get FCM token: $e',
        name: 'PushNotificationService',
        level: 900,
      );
    }

    // Listen for token refreshes.
    _messaging!.onTokenRefresh.listen(_tokenController.add);

    // Handle foreground messages.
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification taps when the app is in the background.
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Check for an initial notification (app opened from terminated state).
    final initialMessage = await _messaging!.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }

    _initialized = true;
    developer.log(
      'Push notification service initialized',
      name: 'PushNotificationService',
    );
  }

  /// Returns the current FCM token, or `null` if not available.
  Future<String?> getToken() async {
    try {
      return await _messaging?.getToken();
    } on Exception {
      return null;
    }
  }

  /// Handles a foreground FCM message by showing a local notification.
  void _handleForegroundMessage(RemoteMessage message) {
    developer.log(
      'Foreground message: ${message.messageId}',
      name: 'PushNotificationService',
    );

    final notification = message.notification;
    final data = message.data;

    final title = notification?.title ?? data['title'] as String? ?? '';
    final body = notification?.body ?? data['body'] as String? ?? '';

    if (title.isEmpty && body.isEmpty) return;

    final channelId = _channelForEntityType(
      data['entity_type'] as String?,
    );

    _localHelper.showNotification(
      title: title,
      body: body,
      payload: data,
      channelId: channelId,
    );
  }

  /// Handles a notification tap when the app was in the background.
  void _handleMessageOpenedApp(RemoteMessage message) {
    final route = _notificationRouter.routeNotification(message.data);
    if (route != null) {
      _routeController.add(route);
    }
  }

  /// Handles a tap on a local notification displayed in the foreground.
  void _handleLocalNotificationTap(String? payload) {
    final route = _notificationRouter.routeFromPayloadString(payload);
    if (route != null) {
      _routeController.add(route);
    }
  }

  /// Requests notification permissions from the OS.
  Future<void> _requestPermission() async {
    try {
      await _messaging!.requestPermission();
    } on Exception catch (e) {
      developer.log(
        'Failed to request notification permission: $e',
        name: 'PushNotificationService',
        level: 900,
      );
    }
  }

  /// Maps an entity type string to an Android notification channel ID.
  static String _channelForEntityType(String? entityType) {
    switch (entityType) {
      case 'work_item':
        return 'work_items';
      case 'comment':
        return 'comments';
      case 'cycle':
        return 'cycles';
      default:
        return 'general';
    }
  }

  /// Releases resources held by this service.
  void dispose() {
    _tokenController.close();
    _routeController.close();
  }
}
