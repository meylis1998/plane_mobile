import 'dart:convert';

import 'package:push_notification_service/src/models/notification_payload.dart';

/// Maps notification payloads to GoRouter navigation paths.
///
/// When the user taps a push notification, the app should navigate to the
/// relevant screen. This class translates the notification data into a
/// GoRouter path.
class NotificationRouter {
  const NotificationRouter();

  /// Returns the GoRouter path for the given notification [data].
  ///
  /// Returns `null` if the payload cannot be mapped to a valid route.
  ///
  /// ## Supported entity types
  ///
  /// - `work_item` -> `/home/projects/{pid}/issues/{eid}`
  /// - `comment`   -> `/home/projects/{pid}/issues/{eid}`
  /// - `cycle`     -> `/home/projects/{pid}/cycles/{eid}`
  /// - `module`    -> `/home/projects/{pid}/modules/{eid}`
  /// - `project`   -> `/home/projects/{eid}`
  /// - `notification` -> `/home/notifications`
  String? routeNotification(Map<String, dynamic> data) {
    final payload = NotificationPayload.fromData(data);
    return routePayload(payload);
  }

  /// Returns the GoRouter path for a parsed [NotificationPayload].
  ///
  /// Returns `null` if the payload cannot be mapped to a valid route.
  String? routePayload(NotificationPayload payload) {
    switch (payload.entityType) {
      case 'work_item':
      case 'comment':
        if (payload.projectId != null && payload.entityId != null) {
          return '/home/projects/${payload.projectId}'
              '/issues/${payload.entityId}';
        }
        return null;

      case 'cycle':
        if (payload.projectId != null && payload.entityId != null) {
          return '/home/projects/${payload.projectId}'
              '/cycles/${payload.entityId}';
        }
        return null;

      case 'module':
        if (payload.projectId != null && payload.entityId != null) {
          return '/home/projects/${payload.projectId}'
              '/modules/${payload.entityId}';
        }
        return null;

      case 'project':
        if (payload.entityId != null) {
          return '/home/projects/${payload.entityId}';
        }
        return null;

      case 'notification':
        return '/home/notifications';

      default:
        return null;
    }
  }

  /// Parses a JSON-encoded payload string (from a local notification tap)
  /// and returns the navigation route.
  ///
  /// Returns `null` if [payloadString] is null, empty, or cannot be decoded.
  String? routeFromPayloadString(String? payloadString) {
    if (payloadString == null || payloadString.isEmpty) return null;

    try {
      final data = jsonDecode(payloadString) as Map<String, dynamic>;
      return routeNotification(data);
    } on FormatException {
      return null;
    }
  }
}
