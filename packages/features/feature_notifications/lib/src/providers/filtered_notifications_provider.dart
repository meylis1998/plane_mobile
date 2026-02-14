import 'package:feature_notifications/src/models/notification_filter.dart';
import 'package:feature_notifications/src/models/plane_notification.dart';
import 'package:feature_notifications/src/providers/notification_filter_provider.dart';
import 'package:feature_notifications/src/providers/notification_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_notifications_provider.g.dart';

@riverpod
Future<List<PlaneNotification>> filteredNotifications(
  Ref ref, {
  required String workspaceSlug,
}) async {
  final filter = ref.watch(currentNotificationFilterProvider);
  final notifications = await ref.watch(
    notificationListProvider(workspaceSlug: workspaceSlug).future,
  );

  switch (filter) {
    case NotificationFilter.all:
      return notifications;
    case NotificationFilter.unread:
      return notifications.where((n) => !n.isRead).toList();
    case NotificationFilter.read:
      return notifications.where((n) => n.isRead).toList();
  }
}
